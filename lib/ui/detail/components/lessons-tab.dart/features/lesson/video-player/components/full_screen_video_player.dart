// lib/features/video_player/widgets/full_screen_video_player.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  const FullScreenVideoPlayer({super.key, required this.controller});

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  bool _showControls = true;
  final Duration skipDuration = const Duration(seconds: 10);
  Timer? _hideTimer;

  VideoPlayerController get _controller => widget.controller;

  @override
  void initState() {
    super.initState();
    _scheduleHideControls(); // langsung jadwalkan hide
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  // Jadwalkan hide controls setelah 3 detik
  void _scheduleHideControls() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  // Play/pause
  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
    _scheduleHideControls();
  }

  // Mundur 10 detik
  Future<void> _skipBackward() async {
    final currentPos = await _controller.position;
    if (currentPos != null) {
      final newPos = currentPos - skipDuration;
      _controller.seekTo(newPos < Duration.zero ? Duration.zero : newPos);
    }
    _scheduleHideControls();
  }

  // Maju 10 detik
  Future<void> _skipForward() async {
    final currentPos = await _controller.position;
    if (currentPos != null) {
      final newPos = currentPos + skipDuration;
      final duration = _controller.value.duration;
      _controller.seekTo(newPos < duration ? newPos : duration);
    }
    _scheduleHideControls();
  }

  // Ketika tap di fullscreen, toggle kontrol & reset timer
  void _onTap() {
    setState(() => _showControls = !_showControls);
    if (_showControls) {
      _scheduleHideControls();
    } else {
      _hideTimer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: _onTap,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Video di tengah
              Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),

              // Overlay kontrol jika _showControls true
              if (_showControls) ...[
                Positioned.fill(
                  child: Container(color: Colors.black38),
                ),

                // Tombol skip/maju/play di tengah
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 40,
                        color: Colors.white,
                        icon: const Icon(Icons.replay_10),
                        onPressed: _skipBackward,
                      ),
                      IconButton(
                        iconSize: 60,
                        color: Colors.white,
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                      IconButton(
                        iconSize: 40,
                        color: Colors.white,
                        icon: const Icon(Icons.forward_10),
                        onPressed: _skipForward,
                      ),
                    ],
                  ),
                ),

                // Progress bar di bawah
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: Colors.red,
                      bufferedColor: Colors.white,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),

                // Tombol keluar fullscreen di pojok kanan bawah
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    iconSize: 30,
                    color: Colors.white,
                    icon: const Icon(Icons.fullscreen_exit),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

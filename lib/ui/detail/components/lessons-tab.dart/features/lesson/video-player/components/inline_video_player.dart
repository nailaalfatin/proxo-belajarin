// lib/features/video_player/widgets/inline_video_player.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'full_screen_video_player.dart';

class InlineVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const InlineVideoPlayer({super.key, required this.videoUrl});

  @override
  // ignore: library_private_types_in_public_api
  _InlineVideoPlayerState createState() => _InlineVideoPlayerState();
}

class _InlineVideoPlayerState extends State<InlineVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  /// Menandakan apakah kontrol (play/pause, skip, dsb) sedang ditampilkan
  bool _showControls = false;

  /// Key untuk mendeteksi posisi dan ukuran video di layar
  final GlobalKey _videoKey = GlobalKey();

  /// Timer untuk menyembunyikan kontrol setelah beberapa detik
  Timer? _hideTimer;

  /// Durasi untuk lompat mundur/maju
  final Duration skipDuration = const Duration(seconds: 10);

  /// Berapa lama kontrol ditampilkan setelah tap di area video
  static const int controlVisibleSeconds = 3;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl.startsWith('http')) {
      _controller = VideoPlayerController.network(widget.videoUrl);
    } else {
      _controller = VideoPlayerController.asset(widget.videoUrl);
    }

    _controller.initialize().then((_) {
      setState(() => _isInitialized = true);
      _controller.play();
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // Fungsi untuk menjadwalkan penyembunyian kontrol otomatis
  void _scheduleHideControls() {
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(seconds: controlVisibleSeconds), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  // Dipanggil setiap kali pengguna men-tap di area widget ini
  void _onTapDown(BuildContext context, TapDownDetails details) {
    final box = _videoKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final offset = box.localToGlobal(Offset.zero);
      final size = box.size;
      final Rect videoRect = offset & size;

      if (videoRect.contains(details.globalPosition)) {
        // TAP di dalam area video => tampilkan kontrol
        setState(() => _showControls = true);
        _scheduleHideControls();
      } else {
        // TAP di luar area video => sembunyikan kontrol
        setState(() => _showControls = false);
        _hideTimer?.cancel();
      }
    }
  }

  // Tombol play/pause
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

  // Tombol mundur 10 detik
  Future<void> _skipBackward() async {
    final currentPos = await _controller.position;
    if (currentPos != null) {
      final newPos = currentPos - skipDuration;
      _controller.seekTo(newPos < Duration.zero ? Duration.zero : newPos);
    }
    _scheduleHideControls();
  }

  // Tombol maju 10 detik
  Future<void> _skipForward() async {
    final currentPos = await _controller.position;
    if (currentPos != null) {
      final newPos = currentPos + skipDuration;
      final duration = _controller.value.duration;
      _controller.seekTo(newPos < duration ? newPos : duration);
    }
    _scheduleHideControls();
  }

  // Tombol fullscreen
  void _enterFullscreen() {
    _hideTimer?.cancel();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenVideoPlayer(controller: _controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTapDown: (details) => _onTapDown(context, details),
      behavior: HitTestBehavior.translucent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Video utama
          Center(
            child: Container(
              key: _videoKey,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          ),

          // Kontrol hanya ditampilkan jika _showControls = true
          if (_showControls) ...[
            // Lapisan hitam semi-transparan menutupi video
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

            // Tombol fullscreen di pojok kanan bawah
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                iconSize: 30,
                color: Colors.white,
                icon: const Icon(Icons.fullscreen),
                onPressed: _enterFullscreen,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

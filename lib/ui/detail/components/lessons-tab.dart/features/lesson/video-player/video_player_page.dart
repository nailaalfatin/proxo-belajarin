// lib/features/video_player/video_player_page.dart

import 'package:belajarin_app/ui/detail/components/lessons-tab.dart/features/lesson/video-player/components/inline_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerPage({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
      ),
      body: Center(
        child: InlineVideoPlayer(videoUrl: videoUrl),
      ),
    );
  }
}

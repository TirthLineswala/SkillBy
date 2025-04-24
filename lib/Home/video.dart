import 'package:firebase_test/Home/videoplayer.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:video_player/video_player.dart';

class VideoPreview extends StatelessWidget {
  final String assetPath;

  VideoPreview({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(videoPath: assetPath),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // Thumbnail or placeholder (optional)
            Container(
              color: Colors.black26,
              child: Center(
                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


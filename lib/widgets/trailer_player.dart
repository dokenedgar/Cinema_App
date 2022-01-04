import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/view_model/explode_youtube_link.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class TrailerPlayer extends StatefulWidget {
  const TrailerPlayer({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _TrailerPlayerState createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  ExplodeYoutubeLink explodeYoutubeLink = ExplodeYoutubeLink();

  @override
  void initState() {
    super.initState();
    explodeYoutubeLink.addListener(() {
      print('notify');
      youtubeStuff();
      setState(() {});
    });
    explodeYoutubeLink.explodeLink(widget.movie.trailerCode);
  }

  void youtubeStuff() async {
    _videoPlayerController = VideoPlayerController.network(
        //'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
        //'https://m.youtube.com/watch?v=${widget.movie.trailerCode}');
        explodeYoutubeLink.youtubeLink ?? '');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      autoPlay: true,
      aspectRatio: 1.8,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(_videoPlayerController.dataSource);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    'Trailer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.share_outlined),
                  ),
                ],
              ),
            ),
            explodeYoutubeLink.youtubeLink != null
                ? Expanded(
                  child: Chewie(
                      controller: _chewieController,
                    ),
                )
                : const Align(
              alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
  }
}

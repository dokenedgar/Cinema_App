import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/view_model/explode_youtube_link.dart';
import 'package:cinema_app/widgets/shimmer_loading_image.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

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
              padding:  EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
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
                :  SizedBox(
                    height: 50.h,
                    child: const ShimmerLoadingImage(
                      duration: Duration(milliseconds: 500),
                    ),
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

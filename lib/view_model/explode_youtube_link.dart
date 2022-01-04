import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ExplodeYoutubeLink with ChangeNotifier {
  String? youtubeLink;

  Future<void> explodeLink (String link) async {
    var yt = YoutubeExplode();
    var video = await yt.videos.streams.getManifest(link);
    youtubeLink = video.muxed.first.url.toString();
    notifyListeners();
  }
}
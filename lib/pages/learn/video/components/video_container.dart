import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';


class VideoPlayerComponent extends StatefulWidget {
  final String name;
  final String videoUrl;

  VideoPlayerComponent({required this.name, required this.videoUrl});

  @override
  _VideoPlayerComponentState createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late BetterPlayerController _betterPlayerController;
  GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration = const BetterPlayerConfiguration(
      aspectRatio: 16/9,
      fit: BoxFit.contain
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Expanded(child: AspectRatio(
            aspectRatio: 16/9,
            child: BetterPlayer(key: _betterPlayerKey, controller: _betterPlayerController,),
        )),
          const SizedBox(height: 30,),
      ],) ,
    );
  }
}

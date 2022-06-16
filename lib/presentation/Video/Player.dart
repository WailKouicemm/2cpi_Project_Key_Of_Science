import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio:16/9 ,
            child: BetterPlayer.network(
"https://media.istockphoto.com/videos/audience-applauding-for-speaker-in-conference-video-id1161128828"           ,     betterPlayerConfiguration: BetterPlayerConfiguration(
                  aspectRatio: 16/9,
                )
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: (){

            },
            child: Text("Next Lesson"),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

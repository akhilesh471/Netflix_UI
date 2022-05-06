import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 98,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          color: Colors.black,
          size: 27,
        ),
        label: const Text(
          'Play',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.white),
      ),
    );
  }
}

class HomeButtons extends StatelessWidget {
  const HomeButtons(
      {Key? key,
      required this.icon,
      required this.text,
      required this.textsize,
      required this.iconsize})
      : super(key: key);
  final IconData icon;
  final String text;
  final double textsize;
  final double iconsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.white,
            size: iconsize,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: textsize),
        )
      ],
    );
  }
}

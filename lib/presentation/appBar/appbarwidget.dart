import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 14),
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 25,
        ),
        kwidth,
        const SizedBox(
          height: 25,
          width: 25,
          child: Image(image: AssetImage('lib/assets/avatarimage.jpg')),
        ),
        kwidth
      ],
    );
  }
}

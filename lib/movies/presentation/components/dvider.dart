import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/resources/colors_manager.dart';

class DividerClass extends StatelessWidget {
  const DividerClass({
    Key? key,
    required this.textSeeMore,
    required this.title,
  }) : super(key: key);

  final String title;
  final String textSeeMore;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context)
        .textTheme
        .headlineMedium
        ?.copyWith(fontWeight: FontWeight.w700,);
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16.0,
        24.0,
        16.0,
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: ColorManager.white),
          ),
          InkWell(
            onTap: () {
              /// TODO : NAVIGATION TO POPULAR SCREEN
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    textSeeMore,
                    style: style,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: ColorManager.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

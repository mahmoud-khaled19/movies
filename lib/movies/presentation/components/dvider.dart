import 'package:flutter/material.dart';
import 'package:untitled1/app/resources/values_manager.dart';

import '../../../app/resources/colors_manager.dart';

class DividerClass extends StatelessWidget {
  const DividerClass({
    Key? key,
    required this.textSeeMore,
    required this.title,
    required this.function,
  }) : super(key: key);

  final String title;
  final String textSeeMore;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.titleLarge;
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppSize.s16,
        AppSize.s20,
        AppSize.s16,
        AppSize.s8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:style,
          ),
          InkWell(
            onTap: function,
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
                    color: ColorManagerLight.white,
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

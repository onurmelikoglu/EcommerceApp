// ignore_for_file: must_be_immutable

import 'package:ecommerceapp/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({Key? key,
      this.color = const Color(0xFF332d2b),
      this.size = 0,
      required this.text,
      this.overFlow = TextOverflow.ellipsis
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        overflow: overFlow,
        style: TextStyle(
            color: color, 
            fontWeight: FontWeight.w400, 
            fontSize: size == 0 ? Dimensions.font20:size,
            fontFamily: "Roboto"
        )
    );
  }
}

import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({Key? key,
      this.color = const Color(0xFF332d2b),
      this.size = 20,
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
            fontSize: size,
            fontFamily: "Roboto"
        )
    );
  }
}

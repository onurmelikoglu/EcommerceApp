import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerceapp/utils/colors.dart';
import 'package:ecommerceapp/utils/dimentions.dart';
import 'package:ecommerceapp/widgets/big_text.dart';
import 'package:ecommerceapp/widgets/icon_and_text_widget.dart';
import 'package:ecommerceapp/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimentions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //print("Current value: " + _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.amber,
          height: Dimentions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
              dotsCount: 5,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimentions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimentions.width10, right: Dimentions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food002.jpg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimentions.width30, right: Dimentions.width30, bottom: Dimentions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimentions.height15, left: Dimentions.width15, right: Dimentions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Vegan Salad"),
                    SizedBox(height: Dimentions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        SizedBox(
                          width: Dimentions.width10,
                        ),
                        SmallText(text: "4,5"),
                        SizedBox(
                          width: Dimentions.width10,
                        ),
                        SmallText(
                          text: "1287",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(
                      height: Dimentions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle,
                            text: "Normal",
                            color: AppColors.textColor,
                            iconColor: AppColors.yellowColor),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            color: AppColors.textColor,
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "20m",
                            color: AppColors.textColor,
                            iconColor: AppColors.mainColor),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
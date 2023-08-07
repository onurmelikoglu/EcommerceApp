import 'package:ecommerceapp/home/food_page_body.dart';
import 'package:ecommerceapp/utils/colors.dart';
import 'package:ecommerceapp/utils/dimentions.dart';
import 'package:ecommerceapp/widgets/big_text.dart';
import 'package:ecommerceapp/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimentions.height45, bottom: Dimentions.height10),
          padding: EdgeInsets.only(left: Dimentions.width20, right: Dimentions.width20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Turkey", color: AppColors.mainColor), 
                    Row(
                      children: [
                        SmallText(text: "City", color: Colors.black54),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ) 
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimentions.width45,
                    height: Dimentions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimentions.iconSize24
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimentions.radius15),
                        color: AppColors.mainColor),
                  ),
                )
              ],
            ),
          ),
        ),
        FoodPageBody()
      ],
    ));
  }
}

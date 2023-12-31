import 'package:ecommerceapp/pages/home/food_page_body.dart';
import 'package:ecommerceapp/utils/colors.dart';
import 'package:ecommerceapp/utils/dimensions.dart';
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
        // header section
        Container(
          margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height10),
          padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BigText(text: "Turkey", color: AppColors.mainColor), 
                  Row(
                    children: [
                      SmallText(text: "City", color: Colors.black54),
                      const Icon(Icons.arrow_drop_down_rounded)
                    ],
                  ) 
                ],
              ),
              Center(
                child: Container(
                  width: Dimensions.width45,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize24
                  ),
                ),
              )
            ],
          ),
        ),
        // Food body section
        const Expanded(child: SingleChildScrollView(child: FoodPageBody(),))

      ],
    ));
  }
}

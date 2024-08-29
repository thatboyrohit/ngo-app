import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ngo/constants/global_variables.dart';

class CarouseImage extends StatelessWidget {
  const CarouseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Builder(
            builder: (BuildContext context) =>  Image.asset(
                  i,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1 , height: 200,
      ),
    );
  }
}

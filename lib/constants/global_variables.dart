import 'package:flutter/material.dart';

String uri = 'http://192.168.67.71:3000';
class GlobalVariables{
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 96, 179, 243),
      Color.fromARGB(255, 166, 208, 228),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(0, 174, 255, 0.659);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static const selectedNavBarColor = Color.fromARGB(255, 76, 163, 225);
  static const unselectedNavBarColor = Colors.black87;

    static const List<String> carouselImages = [
    
    'assets/images/img1.jpeg',
    
  ];

   static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Environment',
      'image': 'assets/images/environment.png',
    },
    {
      'title': 'Health',
      'image': 'assets/images/healthcare.png',
    },
    {
      'title': 'Education',
      'image': 'assets/images/schoolBag.png',
    },
    {
      'title': 'Cleanliness',
      'image': 'assets/images/cleanliness.png',
    },
  
    
    
  ];
}
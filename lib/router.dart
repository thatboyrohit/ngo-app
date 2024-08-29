import 'package:flutter/material.dart';
import 'package:ngo/common/widgets/bottom_bar.dart';
import 'package:ngo/features/admin/screen/add_post_screen.dart';
import 'package:ngo/features/auth/screens/auth_screen.dart';
import 'package:ngo/features/donation_details/donation_details.dart';
import 'package:ngo/features/home/screens/category_screen.dart';
import 'package:ngo/features/home/screens/home_screen.dart';
import 'package:ngo/features/post_details/screens/post_details_screen.dart';
import 'package:ngo/models/order.dart';
import 'package:ngo/models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) => const AuthScreen(),);
      case HomeScreen.routeName:
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) => const HomeScreen(),);
      case BottomBar.routeName:
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) => const BottomBar(),);
       case AddProductScreen.routeName:
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) => const AddProductScreen(),);
      case CategoryDealScreen.routeName:
      var category = routeSettings.arguments as String;
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) =>  CategoryDealScreen(
        category: category ,
      ),);
      case PostDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) =>  PostDetailScreen(
        product: product ,
      ),);
      case DonationDetails.routeName:
      var order = routeSettings.arguments as Order;
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) =>  DonationDetails(
        order : order ,
      ),);
      default:
      
     return MaterialPageRoute( 
      settings: routeSettings,
      builder: (_) => const Scaffold(
        body: Center(
          child: Text("Error 404"),
        ),
      ),);

  }
}
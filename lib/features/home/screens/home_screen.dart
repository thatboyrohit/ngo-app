import 'package:flutter/material.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/features/auth/widgets/below_appbar.dart';
import 'package:ngo/features/auth/widgets/top_categories.dart';
import 'package:ngo/features/home/widget/carousel.dart';
import 'package:ngo/features/home/widget/daily_feed.dart';
import 'package:ngo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // alignment: Alignment.bottomCenter,
                  child: Text(
                    'Y4D'
                  )
                ),
                
              ],
            ),
          
          )),
      body: SingleChildScrollView(
        child: Column(children: [
        BelowAppBar(),
          SizedBox(height: 10,),
          CarouseImage(),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
               
              children: [
                const Text('Feedback Categories..' ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          Container(
color: Colors.black12,
height: 5,
          ),
           SizedBox(height: 10,),
          TopCategories(),
          SizedBox(height: 10,),
           Container(
color: Colors.black12,
height: 5,          ),
        FeedOfDay( ),
        ],),
      )
    );
  }
}

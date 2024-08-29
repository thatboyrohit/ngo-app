import 'package:flutter/material.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/features/accounts/screen/donation_screen.dart';
import 'package:ngo/features/auth/widgets/below_appbar.dart';

import 'package:ngo/features/auth/widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logo.png', width: 125,height: 55,color: Colors.black,
                  ),
                ),

              ],
            ),
          )),
          body: Column(
            children: const [BelowAppBar(),
            SizedBox(height: 10,),
            TopButtons(),
             SizedBox(height: 10,),
            Donations(),
            ],
          ),
    );
  }
}

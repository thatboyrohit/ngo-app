import 'package:flutter/material.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: '  Hello, Admin',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
            //     children: [
            // TextSpan(
            //     text: user.name,
            //     style: const TextStyle(
            //       fontSize: 22,
            //       color: Colors.black,
            //       fontWeight: FontWeight.w600,
            //     ),),
            //     ]
                
                ),
          ),
        ],
      ),
    );
  }
}

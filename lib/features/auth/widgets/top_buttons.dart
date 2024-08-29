import 'package:flutter/material.dart';
import 'package:ngo/features/accounts/services/account_services.dart';
import 'package:ngo/features/auth/widgets/account_buttons.dart';


class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Donations',
              onTap: () {
          
              },
            ),
            // AccountButton(
            //   text: 'Turn Seller',
            //   onTap: () {},
            // ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTap: () => AccountServices().logOut(context),
            ),
            // AccountButton(
            //   text: 'Your Wish List',
            //   onTap: () {},
            // ),
          ],
        ),
      ],
    );
  }
}
// class TopButtons extends StatelessWidget {



//   TopButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//        Row(children: [
//         AccountButton(text: 'Your Donations', onTap: (){}),
//         AccountButton(text: 'Log Out', onTap: ()=> AccountServices().logOut(context)),
//        ],) ,
//        const SizedBox(height: 10,),
//       //  Row(children: [
//       //   AccountButton(text: 'Get your certificate', onTap: (){}),
//       //   AccountButton(text: 'Coming soon....', onTap: (){}),
//       //  ],) ,
//       ],
//     );
//   }
// }
// import 'dart:js';

// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart'as http;
// import 'package:ngo/constants/error_handling.dart';
// import 'package:ngo/constants/global_variables.dart';
// import 'package:ngo/constants/utils.dart';
// import 'package:ngo/providers/user_provider.dart';
// import 'package:provider/provider.dart';

// class FormService{
//    void sellProduct({
//     required BuildContext context,
//     required String name,
//     required String description,
//     required double price,
//     required double quantity,
//     required String category,

//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     try {
      

      

//       Product product = Product(
//         name: name,
//         description: description,
//         quantity: quantity,
//         images: imageUrls,
//         category: category,
//         price: price,
//       );

//       http.Response res = await http.post(
//         Uri.parse('$uri/admin/add-product'),
//         headers: {
//           'Content-Type': 'application/json; charset=UTF-8',
//           'x-auth-token': userProvider.user.token,
//         },
//         body: product.toJson(),
//       );
//       httpErrorHandle(
//           response: res,
//           context: context,
//           onSuccess: () {
//             showSnackBar(context, 'Fund Raised successfully!');
//             Navigator.pop(context);
//           });
//     } catch (e) {
//       showSnackBar(
//         context,
//         e.toString(),
//       );
//     }
//   }
// }
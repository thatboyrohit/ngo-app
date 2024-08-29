import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ngo/constants/error_handling.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/constants/utils.dart';
import 'package:ngo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DonationService {
  void donate(
      {required BuildContext context,
     // required double totalPrice,
      required String userId,
      required String productId}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(Uri.parse('$uri/api/order'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode({
            'productId': productId,
            //'totalPrice': totalPrice,
            'userId': userId,
          }));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "You've donated successfully! Your certificate will sent in your provide email address! ");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

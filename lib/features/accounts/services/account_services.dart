import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ngo/constants/error_handling.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/constants/utils.dart';
import 'package:ngo/features/auth/screens/auth_screen.dart';
import 'package:ngo/models/order.dart';
import 'package:ngo/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountServices {
  Future<List<Order>> fetchDonations({required BuildContext context}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<Order> orderList = [];
  try {
    http.Response res = await http.get(
      Uri.parse('$uri/api/order/me'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
    );

    print('Response Body: ${res.body}'); 

    final List<dynamic> jsonData = jsonDecode(res.body);
    print('Decoded Data: $jsonData');

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {
        for (var item in jsonData) {
          orderList.add(Order.fromMap(item));
        }
      },
    );
  } catch (e) {
    showSnackBar(context, e.toString());
    print('Error: $e');
  }
  return orderList;
}
void logOut(BuildContext context)async{
  try{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('x-auth-token', '');
    Navigator.pushNamedAndRemoveUntil(context, AuthScreen.routeName, (route) => false);
  } catch(e){
    showSnackBar(context, e.toString());
  }
}

}

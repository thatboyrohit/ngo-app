import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ngo/constants/error_handling.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/constants/utils.dart';
import 'package:ngo/models/product.dart';
import 'package:ngo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeServices{
  Future<List<Product>> fetchCategoryPosts({ required BuildContext context , required String category})async{
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/products?category=$category'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  })async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
      try {
      http.Response res =
          await http.post(Uri.parse('$uri/admin/delete-product'),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'x-auth-token': userProvider.user.token,
              },
              body: jsonEncode({'id': product.id}));

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
           onSuccess();
          });
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ngo/common/widgets/loader.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/features/accounts/services/account_services.dart';
import 'package:ngo/features/auth/widgets/single_products.dart';
import 'package:ngo/features/donation_details/donation_details.dart';
import 'package:ngo/models/order.dart';

class Donations extends StatefulWidget {
  const Donations({super.key});

  @override
  State<Donations> createState() => _DonationsState();
}

class _DonationsState extends State<Donations> {
  List<Order> orders = []; // Initialize as an empty list
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchDonations();
  }

 void fetchDonations() async {
  try {
    final fetchedOrders = await accountServices.fetchDonations(context: context);


    print('Raw Fetched Orders: ${jsonEncode(fetchedOrders)}');

    setState(() {
      orders = fetchedOrders ?? [];
    });

    print('Fetched Orders: $orders');
  } catch (e) {
    print('Error fetching donations: $e');
  }
}



  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      'Your Donations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              // display orders
              Container(
                height: 170,
                padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final productImages = orders[index].products.isNotEmpty
                        ? orders[index].products[0].images
                        : [];

                    return GestureDetector(
                      onTap: () {
                       Navigator.pushNamed(context, DonationDetails.routeName , arguments: orders[index]);
                      },
                        child: SingleProduct(
                        image: orders![index].products[0].images[0],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}

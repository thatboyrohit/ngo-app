import 'package:flutter/material.dart';
import 'package:ngo/common/widgets/loader.dart';
import 'package:ngo/features/home/services/home_services.dart';
import 'package:ngo/features/post_details/screens/post_details_screen.dart';
import 'package:ngo/models/product.dart';


class FeedOfDay extends StatefulWidget {
  const FeedOfDay({super.key});

  @override
  State<FeedOfDay> createState() => _FeedOfDayState();
}

class _FeedOfDayState extends State<FeedOfDay> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchEmergencyHelpPosts();
  }

  fetchEmergencyHelpPosts() async {
    productList = await homeServices.fetchCategoryPosts(
        context: context, category: 'Emergency-Help');
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const Loader()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  'Emergency Help!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (productList!.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PostDetailScreen.routeName,
                      arguments: productList![0], // Display the first post
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        productList![0].images[0],
                        height: 235,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      Row(
                        children: [
                          Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(' Donation amount ${productList![0].price.toString()}/-'
                          ,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,),
                        child: Text('Tap to Donate.' ,   style: const TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),),
                      )
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     productList![0].name,
                      //     style: const TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(2.0),
                      //   child: Text(
                      //     productList![0].price.toString(),
                      //     style: const TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     productList![0].name,
                      //     style: const TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Text(
                      //     productList![0].description,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                    ],
                  ),
                ),
            ],
          );
  }
}

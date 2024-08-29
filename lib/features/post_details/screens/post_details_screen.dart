import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/features/donations/services/donation_service.dart';
import 'package:ngo/models/product.dart';
import 'package:ngo/providers/user_provider.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';


class PostDetailScreen extends StatefulWidget {
  static const String routeName = '/post-details';
  final Product product;
  const PostDetailScreen({super.key, required this.product});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late Future<PaymentConfiguration> _googlePayConfigFuture;
  List<PaymentItem> paymentItems = [];
  DonationService donationService = DonationService();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.product.price.toString(),
        label: 'Donation Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('default_google_pay_config.json');
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 125,
                height: 55,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.id!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map((i) {
                return Builder(
                  builder: (BuildContext context) => Image.network(
                    i,
                    fit: BoxFit.contain,
                    height: 200,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: 'Donation Amount : ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Rs.${widget.product.price}/-',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            FutureBuilder<PaymentConfiguration>(
              future: _googlePayConfigFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return const Text('No Payment Configuration Found');
                }
                final paymentConfig = snapshot.data!;

                return SizedBox(
                  width: double.infinity,
                  child: GooglePayButton(
                    onPressed: () {},
                    paymentConfiguration: paymentConfig,
                    paymentItems: paymentItems,
                    type: GooglePayButtonType.pay,
                    margin: const EdgeInsets.only(top: 15.0),
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    onPaymentResult: (paymentResult) {
                      donationService.donate(
                        context: context,
                       // totalPrice: widget.product.price,
                        userId: Provider.of<UserProvider>(context, listen: false)
                            .user
                            .id,
                        productId: widget.product.id!,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}








// class PostDetailScreen extends StatefulWidget {
//   static const String routeName = '/post-details';
//   final Product product;
//   const PostDetailScreen({super.key, required this.product});

//   @override
//   State<PostDetailScreen> createState() => _PostDetailScreenState();
// }

// class _PostDetailScreenState extends State<PostDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: AppBar(
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                 gradient: GlobalVariables.appBarGradient,
//               ),
//             ),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   // alignment: Alignment.bottomCenter,
//                   child: Image.asset(
//                     'assets/images/logo.png',
//                     width: 125,
//                     height: 55,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           )),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(widget.product.id!),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 vertical: 20,
//                 horizontal: 10,
//               ),
//               child: Text(
//                 widget.product.name,
//                 style: const TextStyle(fontSize: 15),
//               ),
//             ),
//             CarouselSlider(
//               items: widget.product.images.map((i) {
//                 return Builder(
//                     builder: (BuildContext context) => Image.network(
//                           i,
//                           fit: BoxFit.contain,
//                           height: 200,
//                         ));
//               }).toList(),
//               options: CarouselOptions(
//                 viewportFraction: 1,
//                 height: 300,
//               ),
//             ),
//             Container(
//               color: Colors.black12,
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: RichText(
//                 text: TextSpan(
//                   text: 'Donation Amount : ',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   children: [
//                     TextSpan(
//                   text: 'Rs.${widget.product.price}/-',
//                   style: const TextStyle(
//                     fontSize: 22,
//                     color: Colors.redAccent,
//                     fontWeight: FontWeight.w500,
//                   ),)
//                   ]
//                 ),
//               ),
//             ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(widget.product.description),
//              ),
//               Container(
//               color: Colors.black12,
//               height: 5,
//             ),

//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: CustomButton(text: 'Donate Now', onTap: (){} ,color: Color.fromARGB(255, 0, 0, 0),),
//               ),
        
//           ],
//         ),
//       ),
//     );
//   }
// }

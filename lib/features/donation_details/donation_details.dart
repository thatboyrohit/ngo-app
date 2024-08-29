import 'package:flutter/material.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/models/order.dart';

class DonationDetails extends StatefulWidget {
  static const String routeName = '/donation-details';
  final Order order;
  const DonationDetails({super.key, required this.order});

  @override
  State<DonationDetails> createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  int currentStep = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentStep = widget.order.status;
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
                Container(
                  // alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 125,
                    height: 55,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'View Donation details',
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black12,
              )),
              child: Column(
                children: [
                  Text('Donation date: ${widget.order.orderedAt}'),
                  Text('Donation ID: ${widget.order.id}'),
                  Text('Donation amount: Rs.${widget.order.totalPrice}')
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Donation details',
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black12,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.order.products.length; i++)
                    Row(
                      children: [
                        Image.network(
                          widget.order.products[i].images[0],
                          height: 120,
                          width: 120,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.order.products[i].name,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Status'
            ),
            Container(
              child: Stepper(
                currentStep: currentStep,
                controlsBuilder: (context, details) {
                  return const SizedBox();
                },
                steps: [
                Step(  title: Text('done') , content: Text('Not done') ,isActive: currentStep >0),
                Step(  title: Text('mail') , content: Text('Not done') ,isActive: currentStep > 1),
                
                
              ]),
            )
          ],
        ),
      ),
    );
  }
}

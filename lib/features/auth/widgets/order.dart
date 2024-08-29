import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
//temp list
List list = [
    ''
];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(right: 15),
          child: const Text(
            '   Your all Donations',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        
       
        //display donations
      Container(
        height: 170,
        padding: const EdgeInsets.only(top: 20 , left: 10, right: 0,),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: ((context , index){

        })
        
        ),
      )
      ],
    );
  }
}

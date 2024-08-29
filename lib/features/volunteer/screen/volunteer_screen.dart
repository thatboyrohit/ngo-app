import 'package:flutter/material.dart';
import 'package:ngo/common/widgets/custom_button.dart';
import 'package:ngo/common/widgets/custom_textfield.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/constants/utils.dart';



class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  String category = 'Education';
    List<String> productCategories = [
    'Education',
    'Health',
    'Cleanliness',
     'Environment'
  ];
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
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logo.png', width: 125,height: 55,color: Colors.black,
                  ),
                ),

              ],
            ),
          )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(' Fill the Feedback Form 💕' , style:  TextStyle(fontSize: 18 , fontWeight: FontWeight.w500) ),
                  Container(
                      color: Colors.grey,
                      height: 5,
                  ),
                   const SizedBox(
                      height: 10,
                    ),
                  CustomTextField(controller: nameController, hintText: 'Name'),
                   const SizedBox(
                      height: 10,
                    ),
                  
                  CustomTextField(controller: emailController, hintText: 'Email Id'),
                  const SizedBox(
                      height: 10,
                    ),
                  CustomTextField(controller: messageController, hintText: 'Location'),
                  const SizedBox(
                      height: 10,
                    ),
                  CustomTextField(controller: locationController, hintText: 'Message' , maxLines: 7,),
                 const  Row(
                    children: [
                       Text('Select your field' , style: TextStyle(fontSize: 15 , color: Colors.red),),
                    ],
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: category,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: productCategories.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            category = newVal!;
                          });
                        },
                      ),
                    ),
                     const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: 'Submit',
                      onTap: (){
                        showSnackBar(context, 'Thankyou for showing your Interest');
                      },
                    ),
                ],
              ),
            ),
          ),
    );
  }
}
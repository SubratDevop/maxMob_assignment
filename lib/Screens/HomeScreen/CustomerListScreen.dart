import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maxmob_assignment/Screens/AddCustomerScreen/AddCustomerScreen.dart';
import 'package:maxmob_assignment/Widgets/Navigate/Navigate.dart';

import '../CustomerLocationScreen/CustomerLocationScreen.dart';

class CustomerListScreen extends StatefulWidget {
  static BuildContext? ctx;
   CustomerListScreen({Key? key}) : super(key: key);

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Assets/Images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 5,
          title: const Text(
            "Customer List",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigate.pushTo(context, AddCustomerSceen());
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue.shade700,
        ),
        body: Stack(children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 50,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigate.pushTo(context, CustomerLocation());
                },
                child: Card(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _buildCustmInfo("Assets/Images/noImage.jpg",
                            "someone@example.com", "Subrat", "Bhubaneswar"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 5,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}

_buildCustmInfo(String Cust_img, String Cust_mail_id, String Cust_name, String Cust_Address) {
  return Row(
    children: [
      Container(
        width: 80,
        child: Image.asset(
          Cust_img,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //*  Name
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                SizedBox(
                  width: 05,
                ),
                Text(
                  Cust_name,
                  style: const TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            //* E_mail
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "mail",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                SizedBox(
                  width: 05,
                ),
                Text(
                  Cust_mail_id,
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            //* Address
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                SizedBox(
                  width: 05,
                ),
                Text(
                  Cust_Address,
                  style: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

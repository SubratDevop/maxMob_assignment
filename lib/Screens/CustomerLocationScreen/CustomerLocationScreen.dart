import 'package:flutter/material.dart';

class CustomerLocation extends StatelessWidget {
  const CustomerLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black54,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Image.asset(
            'Assets/Images/patiamap.jpg',
            fit: BoxFit.fitHeight,
          ),
        ));
  }
}

import 'package:ecommerce_pro/view/screen/address/details.dart';
import 'package:ecommerce_pro/view/widget/address/google_map_service.dart';
import 'package:ecommerce_pro/view/widget/auth/CustomButtomAuth.dart';
import 'package:flutter/material.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'add new address',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const GoogleMapService(),
                Positioned(
                  bottom: 10,
                  child: CustomButtomAuth(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddressDetails()));
                      },
                      width: 200,
                      title: 'Continue',
                      buttoncolor: Colors.red[300]!,
                      textcolor: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_pro/controller/auth/Login/LoginCubit.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/view/screen/address/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 1.9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.grey.shade300,
                ),
              ),
              Positioned(
                  top: Get.width / 2.5,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(100)),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage(ImagesAseets.defaultUserImage),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Column(children: [
                ListTile(
                  onTap: () {},
                  trailing: Switch(value: true, onChanged: (Value) {}),
                  title: const Text('Disbale notification'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const AddressView()));
                  },
                  trailing: const Icon(Icons.location_on_outlined),
                  title: const Text('Address'),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.info_outline),
                  title: const Text('About us'),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.phone_callback_outlined),
                  title: const Text('contact us'),
                ),
                ListTile(
                  onTap: () {
                    LoginCubit.get(context).signout(context);
                  },
                  trailing: const Icon(Icons.logout),
                  title: const Text('Sign out'),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

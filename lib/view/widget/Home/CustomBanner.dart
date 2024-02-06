import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key, required this.title, required this.imageName});

  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.brown[800],
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageName,
              width: 150,
              height: 200,
            ),
          ),
        ]),
      ),
    );
  }
}

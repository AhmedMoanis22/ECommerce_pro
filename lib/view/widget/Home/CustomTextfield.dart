import 'package:ecommerce_pro/controller/Search/search_controller.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.title, required this.prefixIcon});
  final String title;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    var search = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        onChanged: (val)
        {
          SearchCubit.get(context).checkSerach(val);
        },
        controller: search,
        decoration: InputDecoration(
          hintText: title,
          prefixIcon: IconButton(
              onPressed: () {
                SearchCubit.get(context).getallItems(name: search.text);
              },
              icon: Icon(prefixIcon)),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          filled: true,
          fillColor: Colors.grey.shade300.withOpacity(0.4),
        ),
      ),
    );
  }
}

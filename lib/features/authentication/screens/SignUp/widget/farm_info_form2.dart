import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/utils/constants/sizes.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';

class FarmInfoForm extends StatelessWidget {
  final TextEditingController businessController;
  final TextEditingController informalController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController zipController;
  final VoidCallback onContinue;
  const FarmInfoForm({
    super.key,
    required this.businessController,
    required this.informalController,
    required this.addressController,
    required this.cityController,
    required this.stateController,
    required this.zipController,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final dark = STHelperFunction.isDarkMode(context);
    return Column(
      children: [
        /// Business Name
        TextFormField(
          controller: businessController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.business),
            /* hintText: "Business Name", */
            labelText: "Business Name",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 15),

        /// Informal Name
        TextFormField(
          controller: informalController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.tag),
            /* hintText: "Informal Name", */
            labelText: "Informal Name",

            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 15),

        /// Address
        TextFormField(
          controller: addressController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.home),
            /*  hintText: "Street Address", */
            labelText: "Street Address",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 15),

        /// City
        TextFormField(
          controller: cityController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_city),
            /* hintText: "City", */
            labelText: "City",
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 15),

        /// State + Zip
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: stateController,
                decoration: InputDecoration(
                  /*  hintText: "State", */
                  labelText: "State",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: zipController,
                decoration: InputDecoration(
                  /*   hintText: "Enter Zipcode", */
                  labelText: "Zip Code",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: STAppSizes.spaceBtwItems),

        /// Bottom Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: dark ? Colors.white : Colors.black,
                size: 30,
              ),
            ),

            AuthButton(
              onPressed: onContinue,
              color: Color.fromRGBO(213, 113, 91, 1),
              text: "Continue",
            ),
          ],
        ),
      ],
    );
  }
}

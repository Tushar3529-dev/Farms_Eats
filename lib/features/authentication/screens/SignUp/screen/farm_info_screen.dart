import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_lab/common/styles/spacing_style.dart';
import 'package:software_lab/features/authentication/screens/SignUp/screen/verification_screen.dart';
import 'package:software_lab/features/authentication/screens/SignUp/widget/farm_info_form2.dart';
import 'package:software_lab/features/authentication/screens/SignUp/widget/sign_up_header.dart';

class FarmInfoScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const FarmInfoScreen({super.key, required this.userData});

  @override
  State<FarmInfoScreen> createState() => _FarmInfoScreenState();
}

class _FarmInfoScreenState extends State<FarmInfoScreen> {
  final businessController = TextEditingController();
final informalController = TextEditingController();
final addressController = TextEditingController();
final cityController = TextEditingController();
final stateController = TextEditingController();
final zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: STSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              /// HEADER
              STSignupHeader(
                title: "Farm Info",
                currentStep: 2,
              ),
        
              const SizedBox(height: 30),
        
              /// FORM
         FarmInfoForm(
  businessController: businessController,
  informalController: informalController,
  addressController: addressController,
  cityController: cityController,
  stateController: stateController,
  zipController: zipController,

  onContinue: () {
    final farmData = {
      "businessName": businessController.text,
      "informalName": informalController.text,
      "address": addressController.text,
      "city": cityController.text,
      "state": stateController.text,
      "zip": zipController.text,
    };

    
    final allData = {
      ...widget.userData,
      ...farmData,
    };

    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationScreen(allData: allData),
      ),
    );
  },
)
        
            ],
          ),
        ),
      ),
    );
  }
}
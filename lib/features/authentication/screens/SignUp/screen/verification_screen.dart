import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/common/widgets/top_bar.dart';
import 'package:software_lab/features/authentication/screens/SignUp/screen/bussiness_hours_screen.dart';
import 'package:software_lab/features/authentication/screens/SignUp/widget/verification_header.dart';
import 'package:software_lab/utils/helpers/helper_function.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class VerificationScreen extends StatefulWidget {
  final Map<String, dynamic> allData;

  const VerificationScreen({super.key, required this.allData});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  File? selectedFile;
  bool isImage = false;

  ///  Pick Image (Camera/Gallery)
  Future<void> pickImage(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source,);

    if (picked != null) {
      setState(() {
        selectedFile = File(picked.path);
        isImage = true;
      });
    }
  }

  ///  Pick PDF
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
        isImage = false;
      });
    }
  }

  ///  Bottom Sheet Options
  void showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text("Upload PDF"),
              onTap: () {
                Navigator.pop(context);
                pickFile();
              },
            ),
          ],
        ),
      ),
    );
  }

  ///  File Preview Widget
  Widget buildFilePreview() {
     final dark = STHelperFunction.isDarkMode(context);
    if (selectedFile == null) return SizedBox();

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          /// IMAGE OR PDF ICON
          isImage
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.file(
                    selectedFile!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(Icons.picture_as_pdf, color: Colors.red),

          SizedBox(width: 10),

          /// FILE NAME
          Expanded(
            child: Text(
              selectedFile!.path.split('/').last,
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// REMOVE BUTTON
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFile = null;
              });
            },
            child: Icon(Icons.close),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER
        
            STVerifyHeader(
              title: "Verification",
              subTitle: "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
              currentStep: 3,
             ),

            SizedBox(height: 30),

            /// ATTACH ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Attach proof of registration"),

                GestureDetector(
                  onTap: showPickerOptions,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFD5715B),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ),
              ],
            ),

            /// PREVIEW
            buildFilePreview(),

            Spacer(),

            /// BOTTOM BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                ),

               AuthButton(
                  onPressed: () {
  if (selectedFile == null) {
     showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: "Please upload a document",
      ),
    );
   
    return;
  }

 
  final finalData = {
    ...widget.allData,
    "document": selectedFile!.path,
  };

  ///  Debuggin the data
  print("FINAL DATA:");
  print(finalData);
showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message:"Successfully Uploaded Document",
    ),);
  Navigator.push(context, MaterialPageRoute(builder: (context) =>  BusinessHoursScreen(allData: finalData)));


},
                  color: Color.fromRGBO(213, 113, 91, 1),
                  text: "Continue",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
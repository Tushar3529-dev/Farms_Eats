import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_lab/common/widgets/auth_button.dart';
import 'package:software_lab/common/widgets/top_bar.dart';
import 'package:software_lab/features/authentication/screens/SignUp/data/model/sign_up_model.dart';
import 'package:software_lab/features/authentication/screens/SignUp/data/services/sign_up_service.dart';
import 'package:software_lab/features/authentication/screens/SignUp/screen/signup_success_screen.dart';
import 'package:software_lab/features/authentication/screens/SignUp/widget/verification_header.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BusinessHoursScreen extends StatefulWidget {
  final Map<String, dynamic> allData;

  const BusinessHoursScreen({super.key, required this.allData});

  @override
  State<BusinessHoursScreen> createState() => _BusinessHoursScreenState();
}

class _BusinessHoursScreenState extends State<BusinessHoursScreen> {
  /// Days
  final List<String> days = ["M", "T", "W", "Th", "F", "S", "Su"];
  Map<String, List<String>> businessHours = {};
  String selectedDay = "W";

  /// Time Slots
  final List<String> timeSlots = [
    "8:00am - 10:00am",
    "10:00am - 1:00pm",
    "1:00pm - 4:00pm",
    "4:00pm - 7:00pm",
    "7:00pm - 10:00pm"
  ];

  /// Selected Slots
  List<String> selectedSlots = [];

  ///  Submit Function
  void submitData() async {
  if (selectedSlots.isEmpty) {
     showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: "Select at least one time slot",
      ),
    );
    
    return;
  }

  if (businessHours.isEmpty) {
     showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: "Select at least one day & time",
      ),
    );
   
    return;
  }

  final formattedHours = {
    "mon": businessHours["M"] ?? [],
    "tue": businessHours["T"] ?? [],
    "wed": businessHours["W"] ?? [],
    "thu": businessHours["Th"] ?? [],
    "fri": businessHours["F"] ?? [],
    "sat": businessHours["S"] ?? [],
    "sun": businessHours["Su"] ?? [],
  };

  final model = SignupModel(
    fullName: widget.allData["name"],
    email: widget.allData["email"],
    phone: widget.allData["phone"],
    password: widget.allData["password"],
    role: "farmer",
    businessName: widget.allData["businessName"],
    informalName: widget.allData["informalName"],
    address: widget.allData["address"],
    city: widget.allData["city"],
    state: widget.allData["state"],
    zipCode: int.parse(widget.allData["zip"]),
    registrationProof: widget.allData["document"],
    businessHours: formattedHours,
    deviceToken: "yadav",
    type: "email",
    socialId: "TusharYadav433",
  );

  try {
    final api = SignUpApiService();

   
    final response = await api.registerUser(model);
final prefs = await SharedPreferences.getInstance();

  await prefs.setString(
    "name",
    response["user"]["full_name"],
  );

  await prefs.setString(
    "email",
    response["user"]["email"],
  );
  
 showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: response["message"],
    ),
  );
   
   Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const SignupSuccessScreen(),
  ),
  (route) => false, 
);

  } catch (e) {
 

   
   showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: e.toString().replaceFirst("Exception: ", ""),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
             

              STVerifyHeader(
              title: "Business Hours",
              subTitle: "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
              currentStep: 4,
              ),

              const SizedBox(height: 20),

              ///  DAYS SELECTOR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: days.map((day) {
                  final isSelected = selectedDay == day;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                        selectedDay = day;

/// Load already selected slots for that day
selectedSlots = businessHours[day] ?? [];
                        });
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFD5715B)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            day,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              ///  TIME SLOTS
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: timeSlots.map((slot) {
                  final isSelected = selectedSlots.contains(slot);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                       if (isSelected) {
  selectedSlots.remove(slot);
} else {
  selectedSlots.add(slot);
}

///  Saving  slots for that day
businessHours[selectedDay] = List.from(selectedSlots);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 34, vertical: 15),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF6C26B)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        slot,
                        style:  GoogleFonts.beVietnamPro(fontSize: 13,fontWeight: FontWeight.w500, color: Colors.black  ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const Spacer(),

              ///  the both button pop and auth  BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),

                  /* ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD5715B),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: submitData,
                    child: const Text("Signup"),
                  ), */
                  AuthButton(
                    color: const Color.fromRGBO(213, 113, 91, 1),
                    text: "Signup",
                    onPressed: submitData,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
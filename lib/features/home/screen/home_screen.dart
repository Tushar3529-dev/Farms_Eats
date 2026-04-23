import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_lab/features/authentication/screens/onBoarding/on_boarding_screen.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";
  String email = "";
  @override
void initState() {
  super.initState();
  loadUserData();
}

Future<void> loadUserData() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
    name = prefs.getString("name") ?? "User";
    email = prefs.getString("email") ?? "No Email";
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///  WELCOME CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFD5715B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome !",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Farmer Dashboard",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            ///  USER INFO (STATIC / FROM API)
            const Text(
              "Account Info",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text("Name: $name"),
const SizedBox(height: 5),
Text("Email: $email"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            ///  ABOUT DEVELOPER
            const Text(
              "About Developer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(94, 162, 95, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tushar Yadav",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Flutter Developer | Cross-Platform Mobile Developer",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "📍 Gurugram, Haryana\n📧 tusharyadav3529@gmail.com\n📞 8595857925",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Experienced in building high-performance Flutter apps with Firebase, REST APIs, and Clean Architecture.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ///  LOGOUT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: ()async {
                   final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
                Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => const OnBoardingScreen(),
  ),
  (route) => false, 
);
                },
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
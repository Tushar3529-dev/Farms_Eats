import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:software_lab/my_app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized(); 
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}
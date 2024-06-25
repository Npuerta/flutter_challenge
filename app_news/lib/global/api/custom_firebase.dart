import 'package:app_news/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CustomFirebase {

  CustomFirebase(){
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  }
   
  
}
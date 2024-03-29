import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter/material.dart';
import 'pages/welcome.dart';


Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // if(kIsWeb){
  //   await Firebase.initializeApp(options: const FirebaseOptions(apiKey: apiKey, appId: appId, messagingSenderId: messagingSenderId, projectId: projectId));
  // }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(
        
      )
    );
  }
}

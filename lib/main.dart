import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantgo_alpha/screens/home/home_screen.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/forum_service.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/post_function.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:plantgo_alpha/screens/auth/landing_service.dart';
import 'package:plantgo_alpha/screens/auth/landing_utils.dart';
import 'package:plantgo_alpha/screens/auth/landing_helper.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/upload_post.dart';
import 'package:plantgo_alpha/screens/home/pages/profile/profile_service.dart';
import 'package:plantgo_alpha/screens/splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(canvasColor: Colors.transparent),
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationService()),
        ChangeNotifierProvider(create: (_) => FirebaseOperations()),
        ChangeNotifierProvider(create: (_) => LandingHelper()),
        ChangeNotifierProvider(create: (_) => LandingService()),
        ChangeNotifierProvider(create: (_) => LandingUtils()),
        ChangeNotifierProvider(create: (_) => ProfileService()),
        ChangeNotifierProvider(create: (_) => ForumService()),
        ChangeNotifierProvider(create: (_) => UploadPost()),
        ChangeNotifierProvider(create: (_) => PostFunction())
      ],
    );
  }
}

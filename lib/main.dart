import 'package:amc_canteen/routes.dart';
import 'package:amc_canteen/screens/account.dart';
import 'package:amc_canteen/screens/cart.dart';
import 'package:amc_canteen/screens/home_page.dart';
import 'package:amc_canteen/screens/login_page.dart';
import 'package:amc_canteen/screens/otp_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        //fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: "/login",
      routes: {
        Routes.homeroutes: (context) => Homepage(),
        Routes.loginroutes: (context) => LoginPage(),
        Routes.cartroutes: (context) => Cartpage(),
        Routes.accountroutes: (context) => Accountpage(),
        Routes.signuproutes: (context) => OtpPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fcmapp/provider/loginprovider.dart';
import 'package:fcmapp/screens/splashscreen/splashscreen.dart';

// Onesignal ID: 198bf3cd-6140-4242-9d4c-9a0d35c89695

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("198bf3cd-6140-4242-9d4c-9a0d35c89695");

  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    // print("Accepted permission: $accepted");
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FCM App",
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSansProTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}

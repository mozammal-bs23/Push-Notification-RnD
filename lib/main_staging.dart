import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:push_notification/app/app.dart';
import 'package:push_notification/bootstrap.dart';
import 'package:push_notification/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // of notifications they would like to receive once the user
  // receives a notification.

  // For apple platforms, ensure the APNS token is available before making
  // any FCM plugin API calls

  final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
  if (apnsToken != null) {
    // APNS token is available, make FCM plugin API requests...
  }

  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    if (kDebugMode) {
      print(fcmToken);
    }

    // If you want to use other Firebase services in the background, such as
    // Cloud Firestore, make sure you call `initializeApp` before using other
    // Firebase services.
    Firebase.initializeApp();

    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
  }).onError((err) {
    // Error getting token.
  });

  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission();

  if (kDebugMode) {
    print('User granted permission: ${settings.authorizationStatus}');
  }
  await bootstrap(() => const App());
}

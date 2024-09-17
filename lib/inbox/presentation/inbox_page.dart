import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  String _message = 'no notification';

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _message = message.data.toString();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox Page'),
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}

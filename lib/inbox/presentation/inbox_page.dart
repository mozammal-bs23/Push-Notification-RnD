import 'package:flutter/material.dart';
import 'package:push_notification/l10n/l10n.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final String _message = 'no notification';
  int _nothing = 0;

  @override
  Widget build(BuildContext context) {
    final lan = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(lan.counterAppBarTitle),
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}

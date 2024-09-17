import 'package:flutter/material.dart';
import 'package:push_notification/l10n/l10n.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final String _message = 'no notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).counterAppBarTitle),
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}

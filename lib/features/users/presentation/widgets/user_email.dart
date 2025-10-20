import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserEmail extends StatelessWidget {
  const UserEmail({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            email,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.copy,
            size: 18,
            color: Colors.grey.shade600,
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: email));
            final messenger = ScaffoldMessenger.of(context);
            messenger.hideCurrentSnackBar();
            messenger.showSnackBar(
              const SnackBar(
                content: Text('Email copied to clipboard'),
                behavior: SnackBarBehavior.floating,
                duration: Duration(milliseconds: 900),
              ),
            );
          },
          tooltip: 'Copy email',
        ),
      ],
    );
  }
}

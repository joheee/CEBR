import 'package:cebr/custom/snack_bar/awesome_snackbar.dart';
import 'package:cebr/custom/snack_bar/content_type.dart';
import 'package:flutter/material.dart';

void notificationSnackBar(BuildContext context, String title, String message, ContentType contentType) {
  final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: title,
                    message: message,
                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: contentType,
                  ),
                );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
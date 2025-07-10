import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String subject;
  final String pathIconImage;
  final Color backgroundCard;
  final Color borderColor;
  final Color backgroundIcon;

  NotificationModel({
    required this.title,
    required this.subject,
    required this.pathIconImage,
    required this.backgroundCard,
    required this.borderColor,
    required this.backgroundIcon,
  });
}

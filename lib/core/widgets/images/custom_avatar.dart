import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'custom_network_image.dart';

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final double radius;

  const CustomAvatar({super.key, this.imageUrl, this.name, this.radius = 24.0});

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CustomNetworkImage(
        imageUrl: imageUrl,
        width: radius * 2,
        height: radius * 2,
        borderRadius: radius,
      );
    }

    // Fallback to initials
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primary,
      child: Text(
        _getInitials(name ?? 'User'),
        style: TextStyle(
          color: Colors.white,
          fontSize: radius * 0.8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.trim().isEmpty) return 'U';

    final names = name.trim().split(RegExp(r'\s+'));
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '${names[0][0]}${names[1][0]}'.toUpperCase();
  }
}

import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_section.dart';
import '../widgets/profile_menu_section.dart';

class ProfileMobileLayout extends StatelessWidget {
  const ProfileMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.horizontalPadding),
      child: Column(
        children: [
          const ProfileHeader(),
          SizedBox(height: context.spacing),
          const ProfileInfoSection(),
          SizedBox(height: context.spacing),
          const ProfileMenuSection(),
        ],
      ),
    );
  }
}

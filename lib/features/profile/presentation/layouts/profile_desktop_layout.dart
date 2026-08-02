import 'package:flutter/material.dart';
import '../../../../core/constants/breakpoints.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_section.dart';
import '../widgets/profile_menu_section.dart';

class ProfileDesktopLayout extends StatelessWidget {
  const ProfileDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.horizontalPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.maxContentWidth,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 1, child: ProfileHeader(avatarRadius: 60)),
              SizedBox(width: context.spacing),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const ProfileInfoSection(),
                    SizedBox(height: context.spacing),
                    const ProfileMenuSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

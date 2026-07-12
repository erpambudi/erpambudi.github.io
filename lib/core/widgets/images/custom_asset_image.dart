import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../feedback/skeleton_widget.dart';

class CustomAssetImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;

  const CustomAssetImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = assetPath.toLowerCase().endsWith('.svg');

    Widget imageWidget;

    if (isSvg) {
      imageWidget = SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) => _buildPlaceholder(),
      );
    } else {
      imageWidget = Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => _buildError(),
      );
    }

    if (borderRadius > 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildPlaceholder() {
    return SkeletonWidget(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      borderRadius: 0, // Border radius handled by parent ClipRRect
    );
  }

  Widget _buildError() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: const Center(
        child: Icon(Icons.broken_image_outlined, color: Colors.grey),
      ),
    );
  }
}

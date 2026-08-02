import 'package:flutter/material.dart';
import '../../constants/breakpoints.dart';

/// A responsive grid that automatically adjusts the number of columns
/// based on the available width.
///
/// Uses [LayoutBuilder] to respond to parent constraints, making it
/// work correctly even when the window is resized.
///
/// Usage:
/// ```dart
/// ResponsiveGrid(
///   children: [
///     MyCard(),
///     MyCard(),
///     MyCard(),
///   ],
/// )
/// ```
class ResponsiveGrid extends StatelessWidget {
  /// The list of children to display in the grid.
  final List<Widget> children;

  /// The spacing between grid items.
  final double? spacing;

  /// The aspect ratio of each grid item (width / height).
  final double childAspectRatio;

  /// Optional fixed column count. If null, columns are determined by
  /// breakpoints.
  final int? columns;

  /// Optional padding around the grid.
  final EdgeInsetsGeometry? padding;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing,
    this.childAspectRatio = 1.5,
    this.columns,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final effectiveSpacing = spacing ?? Breakpoints.getSpacing(width);
        final effectiveColumns = columns ?? Breakpoints.getGridColumns(width);

        return GridView.builder(
          padding:
              padding ??
              EdgeInsets.all(Breakpoints.getHorizontalPadding(width)),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: effectiveColumns,
            crossAxisSpacing: effectiveSpacing,
            mainAxisSpacing: effectiveSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}

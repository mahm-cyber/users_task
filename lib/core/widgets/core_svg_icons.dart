import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users/core/sources/svg_icons.dart';
import 'package:users/core/utils/responsive_builder.dart';

class CoreSvgIcons extends StatelessWidget {
  const CoreSvgIcons({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.color,
  });

  final String icon;
  final double? width;
  final double? height;
  final Color? color;

  factory CoreSvgIcons.calendar() {
    return CoreSvgIcons(icon: SvgIcons.calendar);
  }

  factory CoreSvgIcons.arrowDown() {
    return CoreSvgIcons(icon: SvgIcons.arrowDown);
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      icon,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      colorMapper: const _MyColorMapper(),
      width: ResponsiveBuilder.value(context: context, initial: width),
      height: ResponsiveBuilder.value(context: context, initial: height),
    );
  }
}

class _MyColorMapper extends ColorMapper {
  const _MyColorMapper();

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (color == const Color(0xFFFF0000)) {
      return Colors.blue;
    }
    if (color == const Color(0xFF00FF00)) {
      return Colors.yellow;
    }
    return color;
  }
}

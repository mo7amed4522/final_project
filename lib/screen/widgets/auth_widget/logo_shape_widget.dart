import 'package:final_project/core/constant/link_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoAuthWidget extends StatelessWidget {
  const LogoAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppLinkImage.logo,
        height: 200,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }
}

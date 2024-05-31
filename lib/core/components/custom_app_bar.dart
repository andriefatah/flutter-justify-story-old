import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onBackButtonPressed;
  final Color textColor; // Added text color property
  final Color iconColor; // Added icon color property
  final Color backgroundColor; // Added background color property
  final Brightness statusBarBrightness; // Added status bar brightness property

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.bold,
    this.onBackButtonPressed,
    this.textColor = Colors.black, // Default text color
    this.iconColor = Colors.black, // Default icon color
    this.backgroundColor = Colors.white, // Default background color
    this.statusBarBrightness =
        Brightness.light, // Default status bar brightness
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: onBackButtonPressed != null
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: iconColor), // Use icon color
              onPressed: onBackButtonPressed,
            )
          : null,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor, // Use text color
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor, // Use background color
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

library code_util;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static init() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static Widget startLoading(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black26,
        child: Center(
          child: Utils.appCircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            stokeWidth: 3,
            size: 30,
          ),
        ),
      ),
    );
  }

  static appCircularProgressIndicator({required Color color, required double stokeWidth, required double size}) {
    return Container(
      color: Colors.transparent,
      height: size,
      width: size,
      child: CircularProgressIndicator(
        color: Colors.transparent,
        strokeWidth: stokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  static String capitalLetter(List<String> language) {
    return language.map((str) => str.toCapitalized()).join(', ');
  }

  static screenHeight(BuildContext context) {}

  static showSnackBar(String text, {bool isError = false, int? seconds}) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: Theme.of(scaffoldKey.currentState!.context).colorScheme.primary.withOpacity(.1),
          child: Center(
            child: Text(
              text,
              style: Theme.of(scaffoldKey.currentState!.context).textTheme.bodyMedium?.copyWith(
                    color: isError ? Theme.of(scaffoldKey.currentState!.context).colorScheme.error : Theme.of(scaffoldKey.currentState!.context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        duration: Duration(seconds: seconds ?? 5),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
  String removeComma() => replaceAll(RegExp(r'^,+|,+$'), '');
}

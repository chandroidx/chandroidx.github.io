import 'dart:ui';

enum ChandroidColors { primaryColor, secondaryColor, textColor, footerColor }

extension ColorsExtension on ChandroidColors {
  Color get color {
    switch (this) {
      case ChandroidColors.primaryColor:
        return const Color.fromARGB(255, 3, 201, 136);
      case ChandroidColors.secondaryColor:
        return const Color.fromARGB(255, 28, 130, 173);
      case ChandroidColors.textColor:
        return const Color.fromARGB(255, 51, 62, 76);
      case ChandroidColors.footerColor:
        return const Color.fromARGB(255, 140, 152, 169);
    }
  }
}

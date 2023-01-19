import 'dart:ui';

enum ChandroidColors { primaryColor, textColor }

extension ColorsExtension on ChandroidColors {
  Color get color {
    switch (this) {
      case ChandroidColors.primaryColor:
        return const Color.fromARGB(255, 60, 207, 78);
      case ChandroidColors.textColor:
        return const Color.fromARGB(255, 51, 62, 76);
    }
  }
}

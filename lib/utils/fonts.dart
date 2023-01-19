enum FontFamily { notoSans, notoSansKr, sourceSansPro, appleSDGothicNeo }

extension FontFamilyExtension on FontFamily {
  String get fontFamily {
    switch (this) {
      case FontFamily.notoSans:
        return 'NotoSans';
      case FontFamily.notoSansKr:
        return 'NotoSansKr';
      case FontFamily.sourceSansPro:
        return 'SourceSansPro';
      case FontFamily.appleSDGothicNeo:
        return 'AppleSDGothicNeo';
    }
  }
}

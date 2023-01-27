enum Category { kotlin, develop, blog, android }

extension CategoryExtension on Category {
  String get title {
    switch (this) {
      case Category.kotlin:
        return 'Kotlin';
      case Category.develop:
        return 'Develop';
      case Category.blog:
        return 'Blog';
      case Category.android:
        return 'Android';
    }
  }
}

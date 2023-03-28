// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar_SA = {
  "no_data_found": " لا توجد بيانات",
  "movies_app": " تطبيق أفلام",
  "genres": "التصنيف",
  "now_playing": "متوفر الأن",
  "popular": "الأكثر مشاهدة",
  "see_more": "مشاهدة المزيد",
  "top_rated": "الأعلي تقييم",
  "more_like_this": "اقتراحات مشابهة",
  "dark_mode": "الوضع الداكن ",
  "light_mode": "الوضع المضحك ",
  "settings": "الإعدادات",
  "change_language": "تغيير اللغة"
};
static const Map<String,dynamic> en_US = {
  "no_data_found": "No Data Found",
  "movies_app": "Movies App",
  "genres": "Genres",
  "now_playing": "Now Playing",
  "popular": "Popular",
  "see_more": "See More",
  "top_rated": "Top Rated",
  "more_like_this": "More Like This",
  "dark_mode": "Dark Mode",
  "light_mode": "Light Mode",
  "settings": "Settings",
  "change_language": "Change Language"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar_SA": ar_SA, "en_US": en_US};
}

import 'package:get/get.dart';
import 'package:wasfati/localization/arabic.dart';
import 'package:wasfati/localization/english.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en': english,
    'ar': arabic
  };

}
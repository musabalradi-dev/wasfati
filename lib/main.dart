import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasfati/app.dart';
import 'package:wasfati/utils/dio/dio_helper.dart';

void main() async {
  // todo: WidgetsFlutterBinding
  WidgetsFlutterBinding.ensureInitialized();
  // todo: storage initialization
  await GetStorage.init();
  // todo: dio initialization
  await DioHelper.init();

  runApp(MyApp());
}

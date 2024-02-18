import 'package:crypto_coins_list/repositories/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'crypto_coins_list_app.dart';

void main() {
  final dio = Dio();
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: dio));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
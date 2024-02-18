import 'package:crypto_coins_list/features/crypto_coin/view/coin_screen.dart';
import 'package:crypto_coins_list/repositories/abstract_coins_repository.dart';
import 'package:get_it/get_it.dart';

import '../features/crypto_list/view/view.dart';

final routes = {
  '/': (context) => CryptoListScreen(coinsRepository: GetIt.I<AbstractCoinsRepository>()),
  '/coin': (context) => const CoinScreen(),
};
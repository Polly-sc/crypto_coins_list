import 'package:crypto_coins_list/repositories/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository{
  CryptoCoinsRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async{
    final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,'
        'ETH,SOL,FDUSD,USDT,USDC,XRP,BNB,SEI,DOGE,AVAX,ADA,CKB,STX,LINK,VTHO,APT,SUI,VET&tsyms=USD');
    debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      debugPrint(usdData.toString());
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin( name: e.key,
                         imageUrl: 'https://www.cryptocompare.com/$imageUrl',
                         priceInUSD: usdData['PRICE']);
    }).toList();
    return cryptoCoinsList;
  }
}
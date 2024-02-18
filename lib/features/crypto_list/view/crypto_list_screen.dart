import 'package:crypto_coins_list/repositories/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/models/models.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.coinsRepository});

  final AbstractCoinsRepository coinsRepository;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadingCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoCurrenciesList'),
      ),
      body: (_cryptoCoinsList == null)
      ? Center(child: CircularProgressIndicator())
      : ListView.separated(
        padding: EdgeInsets.only(top: 16),
        itemCount: _cryptoCoinsList!.length,
        itemBuilder: (BuildContext context, int index) {
          return CryptoCoinTile(coin: _cryptoCoinsList![index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.download),
      //   onPressed: () async{
      //     _cryptoCoinsList = await widget.coinsRepository.getCoinsList();
      //     setState(() {});
      //   },
      // ),
    );
  }

  Future<void> _loadingCryptoCoins() async {
    _cryptoCoinsList = await widget.coinsRepository.getCoinsList();
    setState(() {});
  }
}
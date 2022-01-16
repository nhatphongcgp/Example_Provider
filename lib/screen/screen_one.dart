import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_app/provider/quote_provider.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<QuoteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('ScreenOne')),
      body: SizedBox(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: _provider.quote,
            builder: (context, value, child) {
              return Text('$value');
            },
          ),
        ),
      ),
    );
  }
}

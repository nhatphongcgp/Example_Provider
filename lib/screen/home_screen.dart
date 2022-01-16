import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_app/provider/example_provider.dart';
import 'package:provider_api_app/provider/quote_provider.dart';
import 'package:provider_api_app/screen/screen_one.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<QuoteProvider>(context, listen: false);
    final _exampleProvider = Provider.of<ExampleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () => _provider.getData(),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Text('Random'),
              ),
            ),
          ),
          Consumer<QuoteProvider>(
            builder: (context, value, child) {
              return Text(value.author.value);
            },
          ),
          ValueListenableBuilder(
            valueListenable: _provider.author,
            builder: (context, value, child) {
              return Text('$value');
            },
          ),
          ValueListenableBuilder(
            valueListenable: _provider.quote,
            builder: (context, value, child) {
              return Text('$value');
            },
          ),
          InkWell(
            onTap: () => _exampleProvider.doSomething(),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('Provider'),
              ),
            ),
          ),
          Consumer<ExampleProvider>(
            builder: (context, value, child) {
              return Text(value.text);
            },
          ),
          InkWell(
            onTap: () => _provider.getUpdateAuthor(),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('ProviderPRoxy'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                  value: _provider,
                  builder: (context, child) => ScreenOne(),
                ),
              ),
            ),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Text('Move to next page'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_app/provider/example_provider.dart';
import 'package:provider_api_app/provider/quote_provider.dart';
import 'package:provider_api_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ExampleProvider(),
          ),
          ChangeNotifierProxyProvider<ExampleProvider, QuoteProvider>(
            create: (context) => QuoteProvider(exampleProvider: Provider.of<ExampleProvider>(context, listen: false)),
            update: (context, ExampleProvider exampleProvider, QuoteProvider? quoteProvider) {
              return QuoteProvider(exampleProvider: exampleProvider);
            },
          )
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

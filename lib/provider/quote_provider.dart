import 'package:flutter/material.dart';
import 'package:provider_api_app/model/quote_model.dart';
import 'package:provider_api_app/provider/example_provider.dart';
import 'package:provider_api_app/repo/repo_quote.dart';

class QuoteProvider extends ChangeNotifier {
  QuoteProvider({required this.exampleProvider});

  ValueNotifier<String> author = ValueNotifier<String>('Chua co ten');
  ValueNotifier<String> quote = ValueNotifier<String>('Chua co noi dung');
  List<QuoteModel> listData = [];
  final ExampleProvider exampleProvider;

  String getUpdateAuthor() => author.value = exampleProvider.text;
  final RepoQuote _repoQuote = RepoQuote();
  void getData() async {
    listData = await _repoQuote.getQuoteData();
    author.value = listData.first.a!;
    quote.value = listData.first.q!;
    notifyListeners();
    debugPrint(listData.first.a.toString());
  }
}

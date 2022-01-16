import 'package:provider_api_app/api/quote_api.dart';
import 'package:provider_api_app/model/quote_model.dart';

class RepoQuote {
  final QuoteApi _quoteApi = QuoteApi();

  Future<List<QuoteModel>> getQuoteData() async {
    final data = await _quoteApi.fetchDataFromHttp();
    List<QuoteModel> _list = [];
    data.forEach((v) {
      _list.add(QuoteModel.fromJson(v));
    });
    return _list;
  }
}

class QuoteModel {
  String? q;
  String? a;
  String? h;

  QuoteModel({this.q, this.a, this.h});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    q = json['q'] ?? "";
    a = json['a'] ?? "";
    h = json['h'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['q'] = q;
    data['a'] = a;
    data['h'] = h;
    return data;
  }
}

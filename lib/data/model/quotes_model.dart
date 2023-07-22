class QuotesModel {
  String? anime;
  String? character;
  String? quote;

  QuotesModel({this.anime, this.character, this.quote});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    anime = json['anime'];
    character = json['character'];
    quote = json['quote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['anime'] = anime;
    data['character'] = character;
    data['quote'] = quote;
    return data;
  }
}

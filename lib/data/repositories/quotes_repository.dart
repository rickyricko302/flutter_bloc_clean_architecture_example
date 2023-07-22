import 'dart:convert';

import 'package:flutter_bloc_clean_architecture_example/data/model/quotes_model.dart';
import 'package:flutter_bloc_clean_architecture_example/utils/helper.dart';
import 'package:http/http.dart' as http;

abstract class QuotesRepository {
  Future<List<QuotesModel>> getRandomQuotes();
}

class QuotesRepositoryImp implements QuotesRepository {
  final http.Client client;
  QuotesRepositoryImp(this.client);

  @override
  Future<List<QuotesModel>> getRandomQuotes() async {
    var response = await client.get(
        Uri.parse("https://animechan.xyz/api/quotes"),
        headers: {'accept': 'application/json'});
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }
    Iterable data = jsonDecode(response.body);
    List<QuotesModel> model = [];
    for (var element in data) {
      model.add(QuotesModel.fromJson(element));
    }

    return model;
  }
}

import 'dart:convert';

import 'package:flutter_bloc_clean_architecture_example/data/model/quotes_model.dart';
import 'package:flutter_bloc_clean_architecture_example/utils/helper.dart';
import 'package:http/http.dart' as http;

abstract class QuotesRepository {
  Future<QuotesModel> getRandomQuotes();
}

class QuotesRepositoryImp implements QuotesRepository {
  final http.Client client;
  QuotesRepositoryImp(this.client);

  @override
  Future<QuotesModel> getRandomQuotes() async {
    var response = await client.get(
        Uri.parse("https://katanime.vercel.app/api/getrandom"),
        headers: {'accept': 'application/json'});
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }

    return QuotesModel.fromJson(jsonDecode(response.body));
  }
}

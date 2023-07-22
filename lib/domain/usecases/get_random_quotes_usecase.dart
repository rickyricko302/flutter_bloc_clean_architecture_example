import 'package:flutter_bloc_clean_architecture_example/data/model/quotes_model.dart';
import 'package:flutter_bloc_clean_architecture_example/data/repositories/quotes_repository.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/quotes_entity.dart'
    as entity;

class GetRandomQuotesUseCase {
  final QuotesRepositoryImp quotesRepositoryImp;
  GetRandomQuotesUseCase({required this.quotesRepositoryImp});

  Future<entity.QuotesEntity> getRandomQuotes() async {
    QuotesModel data = await quotesRepositoryImp.getRandomQuotes();
    List<entity.Result> res = [];
    for (Result item in data.result ?? []) {
      res.add(entity.Result(
          anime: item.anime,
          character: item.character,
          english: item.english,
          id: item.id,
          indo: item.indo));
    }
    entity.QuotesEntity model =
        entity.QuotesEntity(sukses: data.sukses, result: res);
    return model;
  }
}

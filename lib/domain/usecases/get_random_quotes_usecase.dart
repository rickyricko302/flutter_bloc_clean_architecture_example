import 'package:flutter_bloc_clean_architecture_example/data/model/quotes_model.dart';
import 'package:flutter_bloc_clean_architecture_example/data/repositories/quotes_repository.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/quotes_entity.dart';

class GetRandomQuotesUseCase {
  final QuotesRepositoryImp quotesRepositoryImp;
  GetRandomQuotesUseCase({required this.quotesRepositoryImp});

  Future<List<QuotesEntity>> getRandomQuotes() async {
    List<QuotesModel> data = await quotesRepositoryImp.getRandomQuotes();
    List<QuotesEntity> model = [];
    for (var e in data) {
      model.add(
          QuotesEntity(anime: e.anime, character: e.character, quote: e.quote));
    }
    return model;
  }
}

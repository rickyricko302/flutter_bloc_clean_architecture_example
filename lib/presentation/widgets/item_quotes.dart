import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/quotes_entity.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/widgets/poppins_text.dart';

class ItemQuotesWidget extends StatelessWidget {
  const ItemQuotesWidget({Key? key, required this.quotesEntity})
      : super(key: key);
  final QuotesEntity quotesEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.cyan),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const PoppinsText(text: "❝", fontSize: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PoppinsText(
              text: quotesEntity.quote ?? "",
              fontSize: 18,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          PoppinsText(
            textAlign: TextAlign.center,
            text:
                "- ${quotesEntity.character ?? ""}\n(${quotesEntity.anime ?? ""})",
            fontSize: 18,
            color: Colors.grey,
          ),
          const PoppinsText(text: "❞", fontSize: 18),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

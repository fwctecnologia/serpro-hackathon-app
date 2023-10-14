import 'package:flutter/material.dart';

import '../theme.dart';

class CardConquistasWidget extends StatefulWidget {
  final String titulo;
  final String descricao;
  final int quantidade;
  const CardConquistasWidget({
    Key? key,
    required this.titulo,
    required this.descricao,
    required this.quantidade,
  }) : super(key: key);

  @override
  State<CardConquistasWidget> createState() => _CardConquistasWidgetState();
}

class _CardConquistasWidgetState extends State<CardConquistasWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.kDefaultColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titulo,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppTheme.kDarkGreen),
          ),
          RichText(
            text: TextSpan(
              text: '${widget.quantidade}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppTheme.kDefaultColor),
              children: <TextSpan>[
                TextSpan(
                    text: ' ${widget.descricao}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16)),
              ],
            ),
          ),
          Container(height: 5),
          Container(
            padding: const EdgeInsets.only(right: 120),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: AppTheme.kDefaultColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Container(height: 5),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.kDefaultColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                widget.quantidade == 0 ? "Iniciar" : "Continuar",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

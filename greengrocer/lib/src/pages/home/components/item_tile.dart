import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/product/product_page.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({super.key, required this.item});

  final ItemModel item;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductPage(item: item);
                },
              ),
            );
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                // Imagem
                Expanded(
                  child: Hero(tag: item.imgUrl, child: Image.asset(item.imgUrl)),
                ),

                // Nome
                Text(
                  item.itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Valor - Unidade
                Row(
                  children: [
                    Text(
                      utilsServices.priceToCurrency(item.price),
                      style: TextStyle(
                        fontSize: 20,
                        color: CustomColors.customSwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/${item.unit}',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),

        // Botão Adicionar ao Carrinho
        Positioned(
            top: 4,
            right: 4,
            child: Container(
              width: 35,
              height: 40,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ))
      ],
    );
  }
}

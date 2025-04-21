import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:flutter/material.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cabinet Market'),
        backgroundColor: ColorPalette.accentColor,
      ),
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Recuerda aprovechar nuestras ofertas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: ColorPalette.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Test 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: ColorPalette.textColor,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Test 2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: ColorPalette.textColor,
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}


class ShopItem extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  const ShopItem({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        trailing: Text('\$$price'),
      ),
    );
  }
}

import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:cabinetmaker_app/screen/profile_screen.dart';
import 'package:cabinetmaker_app/screen/shop/map_sale_points_screen.dart';
import 'package:flutter/material.dart';

class ShopHomeScreen extends StatelessWidget {
  const ShopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                ShopItem(name: "Item 1", description: "Desc 1", price: 1000),
                SizedBox(width: 20),
                ShopItem(name: "Item 2", description: "Desc 2", price: 2000),
              ],
            ),
          ],
        ),
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
    return SizedBox(
      height: 300,
      width: 180,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image(
                  image: const AssetImage('assets/images/logo.png'),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                description,
                style: TextStyle(fontSize: 14, color: ColorPalette.textColor),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '\$$price COP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopMenuNavigation extends StatefulWidget {
  const ShopMenuNavigation({super.key});

  @override
  State<ShopMenuNavigation> createState() => _BottomNavigationBar();
}

class _BottomNavigationBar extends State<ShopMenuNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final List<Widget> _widgetOptions = <Widget>[
    const ShopHomeScreen(),
    const MapSalePointsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CabinetMarket'),
        backgroundColor: ColorPalette.accentColor,
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Tienda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Puntos de venta',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

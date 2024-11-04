import 'package:flutter/material.dart';
import 'product.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  ProductDescription({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(fontFamily: 'NightinTokyo'), // Custom font
        ),
        backgroundColor: Color(0xFFCCB69A), // Warna kuah ramen
      ),
      body: Stack(
        children: [
          Positioned(
            top: -40,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 360,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 300),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'NightinTokyo',
                          color: Colors.brown[600],
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'Rp ${product.price}',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NightinTokyo',
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFE0B2), // Warna latar belakang sesuai tema kuah ramen
    );
  }
}

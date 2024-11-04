import 'package:flutter/material.dart';
import 'product.dart';
import 'product_descriptions.dart';
import 'cart.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map<String, dynamic>> cartItems = [];
  final List<Product> products = [
    Product(
      name: 'tempura-set',
      description: 'berbagai macam jenis tempura jepang.',
      price: 20000,
      imageUrl: 'assets/images/list_set5.jpg',
    ),
    Product(
      name: 'Shio Ramen',
      description: 'Ramen dengan rasa gurih yg sangat menyengah pero.',
      price: 45000,
      imageUrl: 'assets/images/list_set3.jpg',
    ),
    Product(
      name: 'Shouyu Ramen',
      description: 'Ramen dengan rasa gurih dan pekat yg sangat menyengah pero.',
      price: 50000,
      imageUrl: 'assets/images/list_set4.jpg',
    ),
    Product(
      name: 'full set Ramen',
      description: 'Semua jenis ramen di Sini.',
      price: 250000,
      imageUrl: 'assets/images/list_set1.jpg',
    ),
    Product(
      name: 'Sushi Set',
      description: 'Berbagai macam sushi segar.',
      price: 30000,
      imageUrl: 'assets/images/list_set2.jpg',
    ),
    Product(
      name: 'Abura Soba',
      description: 'Mie Soba dengan kuah terpisah dilengkapi dengan tempura.',
      price: 35000,
      imageUrl: 'assets/images/list_set6.jpg',
    ),
    Product(
      name: 'Bento',
      description: 'Makanan lengkap dari jepang buat Bekal.',
      price: 40000,
      imageUrl: 'assets/images/bento1.jpg',
    ),
    Product(
      name: 'Ocha',
      description: 'teh jepang tanpa pemanis.',
      price: 5000,
      imageUrl: 'assets/images/set10.jpg',
    ),
  ];

  List<int> quantities = List.filled(8, 0); // Ukuran quantities untuk 8 produk

  void addToCart(Product product, int quantity) {
    for (var item in cartItems) {
      if (item['product'] == product) {
        item['quantity'] += quantity;
        return;
      }
    }
    cartItems.add({'product': product, 'quantity': quantity});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk', style: TextStyle(fontFamily: 'NightinTokyo')),
        backgroundColor: Color(0xFFCCB69A), // Warna kuah ramen
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFCCB69A), // Warna kuah ramen
              Color(0xFFE1F5FE), // Warna lembut untuk kontras
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Mengatur jumlah kolom menjadi 4
            childAspectRatio: 0.7, // Rasio aspek untuk kotak
            crossAxisSpacing: 8.0, // Jarak antar kolom
            mainAxisSpacing: 8.0, // Jarak antar baris
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDescription(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                        child: AspectRatio(
                          aspectRatio: 1, // Mengatur rasio aspek agar gambar tidak condong
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.cover, // Mengatur gambar agar mengisi area dengan baik
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NightinTokyo',
                            ),
                          ),
                          Text(
                            product.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.brown[600],
                              fontFamily: 'NightinTokyo',
                            ),
                          ),
                          Text(
                            'Rp ${product.price}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.green[700],
                              fontFamily: 'NightinTokyo',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (quantities[index] > 0) quantities[index]--;
                                  });
                                },
                              ),
                              Text(quantities[index].toString(),
                                  style: TextStyle(fontFamily: 'NightinTokyo')),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    quantities[index]++;
                                  });
                                },
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (quantities[index] > 0) {
                                addToCart(product, quantities[index]);
                                setState(() {
                                  quantities[index] = 0;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Ditambahkan ke keranjang')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFCCB69A), // Warna kuah ramen
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              'Tambahkan ke Keranjang',
                              style: TextStyle(fontFamily: 'NightinTokyo'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFCCB69A), // Warna kuah ramen
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(cartItems: cartItems),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 8.0),
              Text(
                'Keranjang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NightinTokyo',
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent, // Mengubah warna latar belakang menjadi transparan
    );
  }
}

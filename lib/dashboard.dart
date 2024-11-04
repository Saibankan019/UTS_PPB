import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'product_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
        child: SingleChildScrollView(
          padding: EdgeInsets.zero, // Menghilangkan padding di sini
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan semua elemen di kolom
            children: [
              Center(
                child: Text(
                  'Mau Pesan Makanan Jepang? Blangkis 日本 Tempatnya!',
                  textAlign: TextAlign.center, // Pusatkan teks ini
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCCB69A),
                    fontFamily: 'NightinTokyo',
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'Blangkis 日本 adalah UMKM lokal yang bangga menyajikan makanan Jepang berkualitas tinggi di Indonesia! Kami percaya bahwa makanan adalah pengalaman, dan kami ingin berbagi cita rasa otentik Jepang dengan Anda.\n\n'
                      '🍜 Apa yang Kami Tawarkan?\n'
                      '- Sushi Segar: Nikmati berbagai pilihan sushi yang dibuat dengan bahan terbaik dan teknik penyajian yang ahli.\n'
                      '- Ramen Hangat: Ramen kami disiapkan dengan kaldu kaya rasa, mie lembut, dan topping segar yang menggugah selera.\n'
                      '- Tempura Renyah: Cicipi tempura kami yang digoreng dengan sempurna, memberikan rasa gurih dan tekstur yang ringan.\n'
                      '- Dessert Tradisional: Jangan lewatkan dessert khas Jepang, seperti mochi dan dorayaki, yang akan memanjakan lidah Anda!',
                  textAlign: TextAlign.center, // Pusatkan teks deskripsi
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.brown[600],
                    fontFamily: 'NightinTokyo',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFoodImage(context, 'assets/images/bento1.jpg', 'Bento'),
                  _buildFoodImage(context, 'assets/images/list1.jpg', 'Sushi'),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCCB69A),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductList(),
                      ),
                    );
                  },
                  child: Text(
                    'Menu Produk',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'NightinTokyo',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildFoodImage(BuildContext context, String imagePath, String label) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth * 0.4; // Set image size to 40% of screen width

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: imageSize * 0.67, // Maintain aspect ratio (2:3)
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFFCCB69A),
            fontFamily: 'NightinTokyo',
          ),
        ),
      ],
    );
  }
}

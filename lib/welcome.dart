import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay selama 5 detik sebelum navigasi ke halaman login
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB2FF59), // Hijau muda untuk bagian atas
              Color(0xFF76FF03), // Hijau lebih dalam untuk bagian tengah
              Color(0xFF388E3C), // Hijau gelap untuk bagian bawah
            ],
          ),
        ),
        child: Stack(
          children: [
            // Gambar penuh layar
            Image.asset(
              'assets/images/wallwel.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Konten di atas gambar
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Blangkis 日本 (Blankon Pakis Jepang).',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NightinTokyo',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '"UMKM Local yang menyajikan Masakan Jepang dengan Kualitas Terbaik!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'NightinTokyo',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

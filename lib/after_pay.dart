import 'package:flutter/material.dart';
import 'dart:async';

class AfterPay extends StatefulWidget {
  @override
  _AfterPayState createState() => _AfterPayState();
}

class _AfterPayState extends State<AfterPay> {
  late Timer _timer;
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/set14.jpg',
    'assets/images/set13.jpg',
    'assets/images/set15.jpg',
    'assets/images/set20.jpg',
    'assets/images/set12.jpg',
    'assets/images/set6.jpg',
    'assets/images/set7.jpg',
    'assets/images/set8.jpg',
    'assets/images/set9.jpg',
    'assets/images/set10.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length; // Ganti gambar
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Go chūmon arigatōgozaimasu.',
              style: TextStyle(fontFamily: 'NightinTokyo'),
            ),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/product_list'); // Mengganti halaman ke product_list
              },
              child: Text(
                'Pesan lagi',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                backgroundColor: Colors.brown, // Warna tombol
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF8D6E63), // Warna app bar
      ),
      body: Container(
        color: Colors.white, // Mengubah warna latar belakang menjadi putih
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Image.asset(
              _images[_currentIndex],
              key: ValueKey<int>(_currentIndex),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}

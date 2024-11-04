import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.lock_outline,
                  color: Colors.brown[800],
                  size: 80,
                ),
                SizedBox(height: 20),
                Text(
                  'Yōkoso!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NightinTokyo',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Masuk untuk melanjutkan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.brown[700],
                    fontFamily: 'NightinTokyo',
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.brown[800]),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.brown[700], fontFamily: 'NightinTokyo'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.brown[800]),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.brown[700], fontFamily: 'NightinTokyo'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCCB69A), // Warna kuah ramen
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                  child: Text(
                    'Masuk',
                    style: TextStyle(fontSize: 18, fontFamily: 'NightinTokyo'),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Belum punya akun? Daftar di sini',
                    style: TextStyle(color: Colors.brown[800], fontFamily: 'NightinTokyo'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

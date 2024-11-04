import 'package:flutter/material.dart';
import 'welcome.dart';
import 'login.dart';
import 'dashboard.dart';
import 'update_user.dart';
import 'register.dart';
import 'cart.dart';
import 'checkout.dart';
import 'after_pay.dart';
import 'product_list.dart'; // Pastikan halaman ProductList ada

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blangkis X KEM-Saiba',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Rute awal adalah splash screen
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/dashboard': (context) => Dashboard(),
        '/update-user': (context) => UpdateUser(),
        '/cart': (context) => Cart(cartItems: []),
        '/checkout': (context) => Checkout(),
        '/after_pay': (context) => AfterPay(),
        '/product_list': (context) => ProductList(), // Tambahkan rute ke product_list
      },
    );
  }
}

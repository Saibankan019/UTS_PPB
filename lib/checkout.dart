import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'after_pay.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = ModalRoute.of(context)!
        .settings
        .arguments as List<Map<String, dynamic>>;
    double totalAmount = 0;

    cartItems.forEach((item) {
      totalAmount += item['product'].price * item['quantity'];
    });

    final formattedTotal = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(totalAmount);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(fontFamily: 'NightinTokyo')),
        backgroundColor: Color(0xFFCCB69A), // Warna kuah ramen untuk AppBar
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFCCB69A), Color(0xFFCCB69A)], // Warna kuah ramen
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran:',
                      style: TextStyle(fontSize: 20, color: Colors.brown[800], fontFamily: 'NightinTokyo'),
                    ),
                    Text(
                      formattedTotal,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                        fontFamily: 'NightinTokyo',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                _buildTextField(
                  controller: nameController,
                  labelText: 'Nama',
                  icon: Icons.person,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: cardController,
                  labelText: 'Nomor Kartu Kredit',
                  icon: Icons.credit_card,
                  isNumber: true,
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (nameController.text.isEmpty || cardController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Harap isi semua kolom!')),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Pembayaran Berhasil!')),
                      );

                      nameController.clear();
                      cardController.clear();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AfterPay()),
                      );
                    },
                    icon: Icon(Icons.check_circle_outline, color: Colors.brown[800]),
                    label: Text('Bayar', style: TextStyle(fontSize: 18, fontFamily: 'NightinTokyo')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.brown[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required IconData icon,
    required TextEditingController controller,
    bool isNumber = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey[600], fontFamily: 'NightinTokyo'),
        prefixIcon: Icon(icon, color: Colors.brown[800]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(fontFamily: 'NightinTokyo'),
    );
  }
}
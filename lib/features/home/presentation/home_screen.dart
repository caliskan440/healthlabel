import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Etiket Asistanı'),
      ),
      body: const Center(
        child: Text('Barkod okutma ve analiz ekranı buraya gelecek.'),
      ),
    );
  }
}
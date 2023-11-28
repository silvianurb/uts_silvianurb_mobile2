import 'package:flutter/material.dart';

class KelasScreen extends StatefulWidget {
  const KelasScreen({Key? key}) : super(key: key);

  @override
  _KelasScreenState createState() => _KelasScreenState();
}

class _KelasScreenState extends State<KelasScreen> {
  String selectedCategory = 'Pemula Pecinta Kopi'; // Kategori default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espresso Edu - Kelas Virtual'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildCategoryButtons(),
          ),
          Expanded(
            child: _buildClassList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryButton('Pemula Pecinta Kopi'),
        _buildCategoryButton('Seni Seduh Kopi'),
        _buildCategoryButton('Kopi Sebagai Profesi')
      ],
    );
  }

  Widget _buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = category;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: selectedCategory == category
            ? Color.fromARGB(255, 119, 190, 244)
            : null,
      ),
      child: Text(category),
    );
  }

  Widget _buildClassList() {
    List<String> classes = [];

    // Menentukan kelas berdasarkan kategori yang dipilih
    if (selectedCategory == 'Pemula Pecinta Kopi') {
      classes = [
        'Dasar-Dasar Membuat Kopi Dirumah',
        'Pengenalan Jenis-jenis Biji Kopi',
        'Teknik Seduh Sederhana untuk Pemula',
        'Memahami Tingkat Pengepresan Kopi'
      ];
    } else if (selectedCategory == 'Seni Seduh Kopi') {
      classes = [
        'Mendalami Teknik Pour-Over',
        'Menyempurnakan Teknik Espresso',
        'Keindahan Siphon Brewing',
        'Latte Art Untuk Pemula'
      ];
    } else if (selectedCategory == 'Kopi Sebagai Profesi') {
      classes = [
        'Membuka Warung Kopi Kreatif',
        'Menjadi Barista Profesional',
        'Merintis Bisnis Roastery Kopi',
        'Menilai Kualitas Kopi: Cupping 101'
      ];
    }

    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(classes[index]),
          onTap: () {
            // Tambahkan aksi ketika kelas diklik
          },
        );
      },
    );
  }
}

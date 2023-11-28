import 'package:flutter/material.dart';

class Panduan extends StatelessWidget {
  const Panduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espresso Edu'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
          crossAxisSpacing: 8.0, // Jarak antara kolom
          mainAxisSpacing: 8.0, // Jarak antara baris
        ),
        itemCount: kopiList.length,
        itemBuilder: (context, index) {
          return GridItem(
            kopi: kopiList[index],
          );
        },
      ),
    );
  }
}

class Kopi {
  final String nama;
  final String imageUrl;

  Kopi({
    required this.nama,
    required this.imageUrl,
  });
}

class GridItem extends StatelessWidget {
  final Kopi kopi;

  const GridItem({Key? key, required this.kopi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(
                kopi.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              kopi.nama,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Daftar contoh data kopi
List<Kopi> kopiList = [
  Kopi(
    nama: 'Espresso',
    imageUrl:
        'https://i.pinimg.com/474x/d4/5e/7a/d45e7abc19d3a09ab4fab3c974ef77fd.jpg',
  ),
  Kopi(
    nama: 'Americano',
    imageUrl:
        'https://i.pinimg.com/474x/bc/0c/ff/bc0cffc8b21c24b4b571e98b9ab5da12.jpg',
  ),
  Kopi(
    nama: 'Cappuccino',
    imageUrl:
        'https://i.pinimg.com/474x/33/44/2e/33442e58a74503c7cef4fc437a4ebc8e.jpg',
  ),
  Kopi(
    nama: 'Latte',
    imageUrl:
        'https://i.pinimg.com/564x/7f/e9/e3/7fe9e35f3d62602515ce3ec9014ac69e.jpg',
  ),
  Kopi(
    nama: 'Cold Brew',
    imageUrl:
        'https://i.pinimg.com/564x/bd/59/96/bd59967bb1ef51b9583b0e0a91bf820c.jpg',
  ),
  Kopi(
    nama: 'Affogato',
    imageUrl:
        'https://i.pinimg.com/474x/73/b8/75/73b875f675f6f4d81f4d53efbc3e857a.jpg',
  ),
  Kopi(
    nama: 'Matcha Latte',
    imageUrl:
        'https://i.pinimg.com/564x/63/85/5f/63855f1c6de9cd3e997926f88fb5f76e.jpg',
  ),
  Kopi(
    nama: 'Mocha Latte',
    imageUrl:
        'https://i.pinimg.com/564x/fd/c5/18/fdc5187d196db36cfc74bc4681cde7cb.jpg',
  ),
  Kopi(
    nama: 'Kopi Susu',
    imageUrl:
        'https://i.pinimg.com/564x/7f/e9/e3/7fe9e35f3d62602515ce3ec9014ac69e.jpg',
  ),
  Kopi(
    nama: 'Caramel Latte',
    imageUrl:
        'https://i.pinimg.com/564x/7f/e9/e3/7fe9e35f3d62602515ce3ec9014ac69e.jpg',
  ),
  Kopi(
    nama: 'Pandan Latte',
    imageUrl:
        'https://i.pinimg.com/564x/b5/7c/c7/b57cc7a7deb1b92beb28f86c9081f07d.jpg',
  ),
  Kopi(
    nama: 'Kopi Susu Hazelnut',
    imageUrl:
        'https://i.pinimg.com/564x/7f/e9/e3/7fe9e35f3d62602515ce3ec9014ac69e.jpg',
  ),
];

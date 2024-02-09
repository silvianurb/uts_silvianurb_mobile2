import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArtikelScreen(),
    );
  }
}

class ArtikelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: AppText.title('Espresso Edu'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/download.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SizedBox(height: 25),

                // INI BUAT ARTICLE LIST
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  child: Image.network(
                                    article.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (article.chipLabel.isNotEmpty)
                                      CustomChipSmall(
                                        label: article.chipLabel,
                                        color: getRandomColor(),
                                      ),
                                    Text(
                                      article.title,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${DateTime.now().difference(article.createdAt).inHours} Hari Lalu',
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                            const SizedBox(width: 20),
                                            Icon(
                                              Icons.visibility,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '${article.views} Dilihat',
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.white,
                                              size:
                                                  18, //Tangani klik tombol (navigasi ke artikel penuh, dll.)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 25,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 100), // Atur sesuai kebutuhan
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  // Menghasilkan warna acak
  final random = Random();
  return Color.fromARGB(
    255,
    200 + random.nextInt(56),
    200 + random.nextInt(56),
    200 + random.nextInt(56),
  );
}

class AppText extends Text {
  AppText.title(
    String data, {
    Key? key,
    Color? color,
    FontWeight? fontWeight,
    double fontSize = 30,
  }) : super(
          data,
          key: key,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize,
          ),
        );
}

class CustomChip extends StatefulWidget {
  final String label;
  const CustomChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 33, 150, 243)
              : const Color.fromARGB(255, 197, 196, 196),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Center(
          child: AppText2.small(
            widget.label,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class AppText2 extends Text {
  AppText2.small(
    String data, {
    Key? key,
    Color? color,
    FontWeight? fontWeight,
    double fontSize = 12,
  }) : super(
          data,
          key: key,
          style: TextStyle(
            color: color,
            fontFamily: 'Roboto',
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize,
          ),
        );
}

class CustomChipSmall extends StatelessWidget {
  final String label;
  final Color color;

  const CustomChipSmall({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: AppText2.small(
        label,
        color: Colors.black,
      ),
    );
  }
}

class Article {
  final String imageUrl;
  final String title;
  final int views;
  final DateTime createdAt;
  final String chipLabel;

  Article({
    required this.imageUrl,
    required this.title,
    required this.createdAt,
    required this.views,
    this.chipLabel = '',
  });

  static List<Article> articles = [
    Article(
      imageUrl:
          'https://i.pinimg.com/564x/4f/51/08/4f5108e66e8284cc1fd883f3c374c6bf.jpg',
      title:
          'Melacak Jejak Kopi Lokal: Menelusuri Keindahan Warung Kopi Kreatif',
      createdAt: DateTime.now().subtract(Duration(hours: 2)),
      views: 100,
      chipLabel: 'Matcha Latte',
    ),
    Article(
      imageUrl:
          'https://i.pinimg.com/564x/77/d5/cb/77d5cb72d328d4b4802c94ce221d4d57.jpg',
      title: 'Perjalanan Panjang Kopi Robusta: Dari Kebun ke Cangkir',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      views: 1453,
      chipLabel: 'Biji Kopi',
    ),
    Article(
      imageUrl:
          'https://i.pinimg.com/564x/7e/01/74/7e017416bb8cead28c77d5bb12fcdfca.jpg',
      title:
          'Cara Memilih Grinder Kopi yang Tepat untuk Pengalaman Seduh Terbaik',
      createdAt: DateTime.now().subtract(Duration(days: 7)),
      views: 786,
      chipLabel: 'Coffe Latte',
    ),
    Article(
      imageUrl:
          'https://i.pinimg.com/564x/0b/fc/1c/0bfc1c0cd1afdd69f81e8be6f189fef7.jpg',
      title: 'Teknik Pour-Over: Seni Seduh Kopi yang Memikat Lidah',
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      views: 345,
      chipLabel: 'Americano',
    ),
    Article(
      imageUrl:
          'https://i.pinimg.com/564x/7f/e9/e3/7fe9e35f3d62602515ce3ec9014ac69e.jpg',
      title: 'Cold Brew: Kelezatan Kopi yang Merupakan Kenikmatan Dingin',
      createdAt: DateTime.now().subtract(Duration(days: 11)),
      views: 3457,
      chipLabel: 'Kopi Susu',
    ),
    // Tambahkan artikel lainnya sesuai kebutuhan
  ];
}

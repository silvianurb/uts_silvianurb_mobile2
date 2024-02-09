import 'package:flutter/material.dart';

class MenikmatiKopi extends StatelessWidget {
  const MenikmatiKopi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espresso Edu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/download.jpeg"), // Ganti dengan path gambar yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Menikmati kopi bukan hanya sekadar meminumnya, tetapi juga tentang menciptakan pengalaman yang memuaskan dan menikmati setiap nuansa cita rasa yang ditawarkan.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Pertama-tama, pilih biji kopi berkualitas tinggi, karena kualitas biji kopi sangat mempengaruhi hasil akhir. Giling biji kopi Anda secara fresh agar aroma yang khas dapat terlepas dengan maksimal.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Saat menyeduh, pertimbangkan metode penyeduhan yang sesuai dengan selera Anda, apakah itu pour-over, French press, atau metode lainnya.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Saat menuangkan air mendidih ke atas kopi, nikmati aroma yang muncul dan lihat bagaimana remasan kopi tercampur dalam air panas.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Setelah penyeduhan selesai, ambil waktu sejenak untuk mencium aroma kopi yang segar sebelum pertama kali menyeruput.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Saat menyeruput, biarkan kopi melintasi seluruh lidah Anda, mencari nuansa rasa yang berbeda mulai dari rasa manis hingga pahit.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Selama menikmati kopi, hindari menambahkan terlalu banyak gula atau susu, karena hal tersebut dapat mengaburkan cita rasa alami kopi.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Nikmati kopi secara perlahan-lahan, sambil menciptakan momen santai di mana Anda dapat benar-benar terhubung dengan sensasi kopi yang Anda minum. Apakah itu sambil membaca buku, mendengarkan musik, atau berbicara dengan teman, menjadikan ritual menikmati kopi sebagai pengalaman yang dinantikan dapat meningkatkan kebahagiaan dan kepuasan.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

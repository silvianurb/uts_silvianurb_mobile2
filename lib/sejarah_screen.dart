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
                '"Kopi adalah peluk hangat di pagi yang dingin, sebuah kisah yang mengalir dalam setiap tegukan. Ia membuka mata kita, mengajak kita untuk menghirup dunia dengan lebih dalam. Kopi bukan sekadar minuman, tapi teman yang setia dalam perjalanan hidup kita."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Saat air mendidih dan aroma kopi mengepul di udara, dunia seolah menemukan irama baru. Seperti musik yang meresap ke setiap celah, kopi menyentuh hati dan membuka pintu rahasia kenangan yang terlupakan."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Kopi adalah seni yang mengalir dalam setiap coraknya. Dari biji yang rupa-rupanya biasa, lahirlah keajaiban dalam secangkir. Setiap tegukan seperti kisah hidup, dengan pahit dan manis yang berpadu harmonis."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Di balik setiap cangkir kopi, terdapat petualangan yang tak terlukiskan. Dari tanaman kopi yang menari di bawah matahari hingga proses sang barista yang menjadi penari rahasia, kopimu adalah perjalanan yang tiada akhir."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Cinta seperti kopi, hangat dan menyeduh hati. Saat kita mencicipinya, kita merasakan kehangatan sentuhan yang lembut. Kopi, seperti cinta, mampu membangunkan jiwa dan memancarkan cahaya di setiap sudut gelap."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Dalam setiap titik hitam kopi, tersimpan rahasia kehidupan. Sebuah kisah yang tertulis dalam serbuk halus dan aroma yang menghipnotis. Kopi mengajarkan kita untuk menikmati setiap momen, meski pahit terkadang menyelinap."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Seiring waktu berjalan, cangkir kopi menjadi cermin perasaan. Dari aroma yang menenangkan hingga kenangan yang mendalam, kita dapat membaca sejarah hidup dalam setiap tetes kopi yang jatuh."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Kopi bukan hanya minuman, tapi perjalanan yang tak terlupakan. Dari daun kopi yang menari di angin hingga cangkir di tangan, setiap momen adalah bagian dari simfoni rasa yang tiada duanya."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Setiap cangkir kopi adalah kisah perjalanan biji yang melintasi gunung, sungai, hingga tiba di genggaman kita. Ia seperti petualangan yang terasa di setiap sudut lidah, membawa kita melewati pemandangan indah cita rasa."',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                '"Kopi adalah waktu yang berjalan lebih lambat. Saat kita duduk di sudut kedai, menatap cangkir yang menghiasi meja, waktu seolah berhenti sejenak. Kopi membangunkan rasa hidup, memberikan kita kesempatan untuk menikmati momen yang sederhana namun penuh makna."',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

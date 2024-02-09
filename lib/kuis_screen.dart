import 'package:flutter/material.dart';

class Kuis extends StatefulWidget {
  const Kuis({Key? key}) : super(key: key);

  @override
  _KuisState createState() => _KuisState();
}

class _KuisState extends State<Kuis> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool quizFinished = false;

  List<Map<String, dynamic>> questions = [
    {
      'question': 'Apa nama biji kopi yang paling populer?',
      'options': ['Arabica', 'Robusta', 'Liberica', 'Excelsa'],
      'correctAnswer': 'Arabica',
    },
    {
      'question': 'Berapa lama waktu ideal penyeduhan kopi pour-over?',
      'options': ['30 detik', '2 menit', '4 menit', '10 menit'],
      'correctAnswer': '2 menit',
    },
    {
      'question': 'Apa perbedaan utama antara Arabica dan Robusta?',
      'options': [
        'Arabica memiliki lebih banyak kafein',
        'Robusta memiliki lebih banyak kafein',
        'Arabica memiliki rasa lebih pahit',
        'Robusta memiliki rasa lebih asam',
      ],
      'correctAnswer': 'Arabica memiliki lebih banyak kafein',
    },
    {
      'question': 'Negara manakah yang terkenal dengan produksi kopi terbaik?',
      'options': ['Brazil', 'India', 'Ethiopia', 'Vietnam'],
      'correctAnswer': 'Ethiopia',
    },
    {
      'question':
          'Apa yang membedakan Cold Brew dengan metode penyeduhan lainnya?',
      'options': [
        'Cold Brew diseduh dengan air panas',
        'Cold Brew memiliki rasa lebih manis',
        'Cold Brew diseduh dengan air dingin',
        'Cold Brew menggunakan biji kopi berbeda',
      ],
      'correctAnswer': 'Cold Brew diseduh dengan air dingin',
    },
    // Tambahin pertanyaan kuis disini
  ];

  @override
  Widget build(BuildContext context) {
    if (quizFinished) {
      return _buildQuizFinishedScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Espresso Edu - Kuis Kopi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: List.generate(
                questions[currentQuestionIndex]['options'].length,
                (index) {
                  return ElevatedButton(
                    onPressed: () {
                      _checkAnswer(
                        questions[currentQuestionIndex]['options'][index],
                      );
                    },
                    child: Text(
                      questions[currentQuestionIndex]['options'][index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkAnswer(String selectedAnswer) {
    String correctAnswer =
        questions[currentQuestionIndex]['correctAnswer'].toString();

    if (selectedAnswer == correctAnswer) {
      // Jawaban benar,
      _showSnackbar('Jawaban Benar!');
      correctAnswers++;
    } else {
      // Jawaban salah,
      _showSnackbar('Jawaban Salah. Coba lagi!');
    }

    _moveToNextQuestion();
  }

  void _moveToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Jika sudah mencapai pertanyaan terakhir, selesai kuis
        _showQuizFinishedScreen();
      }
    });
  }

  void _showQuizFinishedScreen() {
    setState(() {
      quizFinished = true;
    });
  }

  Widget _buildQuizFinishedScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espresso Edu - Kuis Selesai'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kuis Selesai!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Skor Anda: $correctAnswers / ${questions.length}',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _resetQuiz();
                },
                child: Text('Ulang Kuis'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      correctAnswers = 0;
      quizFinished = false;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Kuis(),
    ),
  );
}

import 'package:flutter/material.dart';

class Jenis extends StatefulWidget {
  const Jenis({Key? key}) : super(key: key);

  @override
  _JenisState createState() => _JenisState();
}

class _JenisState extends State<Jenis> {
  TextEditingController _jenisController = TextEditingController();
  List<String> _jenisList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espresso Edu - Jenis Kopi'),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _jenisController,
                decoration: InputDecoration(
                  hintText: 'Masukkan jenis kopi...',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  tambahJenis();
                },
                child: const Text('Tambah'),
              ),
              const SizedBox(height: 16.0),
              for (String jenis in _jenisList) _buildJenisItem(jenis),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJenisItem(String jenis) {
    return Dismissible(
      key: Key(jenis),
      onDismissed: (direction) {
        hapusJenis(jenis);
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        alignment: AlignmentDirectional.centerStart,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(jenis),
        ),
      ),
    );
  }

  void tambahJenis() {
    String inputJenis = _jenisController.text.trim();
    if (inputJenis.isNotEmpty) {
      setState(() {
        _jenisList.add(inputJenis);
        _jenisController.clear();
      });
    }
  }

  void hapusJenis(String jenis) {
    setState(() {
      _jenisList.remove(jenis);
    });
  }
}

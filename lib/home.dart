import 'package:flutter/material.dart';
import 'package:uts_pm2_silvianurb/header_drawer.dart';
import 'package:uts_pm2_silvianurb/artikel_screen.dart';
import 'package:uts_pm2_silvianurb/pages/panduan_screen.dart';
import 'package:uts_pm2_silvianurb/sejarah_screen.dart';
import 'package:uts_pm2_silvianurb/jenis_screen.dart';
import 'package:uts_pm2_silvianurb/kelas_screen.dart';
import 'package:uts_pm2_silvianurb/kuis_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title:
            const Text("Espresso Edu", style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Beranda"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArtikelScreen()));
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.article,
                      size: 60,
                      color: Colors.brown,
                    ),
                    Text("Artikel Kopi", style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Panduan()));
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.coffee_maker,
                      size: 60,
                      color: Colors.brown,
                    ),
                    Text("Panduan Brew", style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MenikmatiKopi()));
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.coffee,
                      size: 60,
                      color: Colors.brown,
                    ),
                    Text("Penikmat Kopi", style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Jenis()));
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.coffee,
                      size: 60,
                      color: Colors.brown,
                    ),
                    Text("Jenis Kopi", style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KelasScreen()));
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.class_,
                      size: 60,
                      color: Colors.brown,
                    ),
                    Text("Kelas Virtual", style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Kuis()));
              },
              splashColor: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.quiz_sharp,
                      size: 60,
                      color: Colors.brown,
                    ),
                    Text("Kuis Kopi", style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

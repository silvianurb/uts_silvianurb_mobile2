import 'package:flutter/material.dart';
import 'package:uts_pm2_silvianurb/data/datasource/remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_pm2_silvianurb/splashscreen.dart';
import 'package:uts_pm2_silvianurb/pages/bloc/user_bloc.dart';
import 'package:uts_pm2_silvianurb/pages/panduan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => UserBloc(remoteDataSource: RemoteDataSource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Espresso Edu',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}

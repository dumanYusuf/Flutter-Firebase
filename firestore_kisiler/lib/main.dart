import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notdefteri/cubit/anaSayfaCubit.dart';
import 'package:firebase_notdefteri/cubit/detay_sayfa_cubbit.dart';
import 'package:firebase_notdefteri/cubit/kayitSayfaCubit.dart';
import 'package:firebase_notdefteri/views/anaSayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KayitSayfaCubit()),
        BlocProvider(create: (context) => DetaySayfaCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}


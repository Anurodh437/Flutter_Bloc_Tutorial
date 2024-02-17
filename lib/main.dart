import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_block_tutorial/Blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_block_tutorial/Cubit/internet_cubit.dart';
// import 'package:flutter_block_tutorial/Pages/Home_page.dart';
import 'package:flutter_block_tutorial/Pages/cubit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,

          ),
          debugShowCheckedModeBanner: false,
          home: const CubitPage()
      ),
    );
  }
}

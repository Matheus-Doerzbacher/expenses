import 'package:expenses/layers/presentation/pages/expense_page.dart';
import 'package:flutter/material.dart';

void main() {
  /* CÓDIGO PARA DEIXAR O APP APENAS NA VERTICAL */

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((function) {
  runApp(const MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var kColorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 96, 59, 181),
      // seedColor: Colors.deepOrange,
    );

    var kDarkColorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 5, 99, 125),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark().copyWith(
        iconTheme: IconThemeData(
          color: kDarkColorScheme.primary,
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primary,
          foregroundColor: kDarkColorScheme.primaryContainer,
          centerTitle: false,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.background,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kDarkColorScheme.onSecondaryContainer,
                fontSize: 18,
              ),
              bodyMedium: const TextStyle(color: Colors.white),
            ),
        colorScheme: kDarkColorScheme,
      ),
      theme: ThemeData(useMaterial3: true).copyWith(
        iconTheme: IconThemeData(
          color: kColorScheme.primary,
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.primaryContainer,
          centerTitle: false,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.background,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 18,
              ),
            ),
        colorScheme: kColorScheme,
      ),
      themeMode: ThemeMode.system,
      home: const ExpensePage(),
    );
  }
}

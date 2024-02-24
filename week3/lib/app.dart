import 'package:flutter/material.dart';
import 'backdrop.dart'; // New code
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart'; // New code
import 'category_menu_page.dart';
import 'supplemental/cut_corners_border.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => Backdrop(
              // TODO: Make currentCategory field take _currentCategory (104)
              currentCategory: _currentCategory,
              // TODO: Pass _currentCategory for frontLayer (104)
              frontLayer: HomePage(),
              // TODO: Change backLayer field value to CategoryMenuPage (104)
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('Paulina'),
              backTitle: const Text('MENU'), 
              backgroundColor: kShrineBrown900,
            ),
        // TODO: Pass _currentCategory for frontLayer (104)
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      // TODO: Customize the theme (103)
      theme: _buildShrineTheme(),
    );
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor:
        kShrineSurfaceWhite, // Adding backgroundColor parameter
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePurple,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrinePurple,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrinePurple,
      ),
    ),
    colorScheme: base.colorScheme
        .copyWith(
          primary: kShrinePurple,
          secondary: kShrinePurple,
          error: kShrineErrorRed,
        )
        .copyWith(background: kShrinePink100),
  );
}

// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}

import 'package:bookvir/screens/display_character.dart';
import 'package:bookvir/screens/home.dart';
import 'package:bookvir/screens/search.dart';
import 'package:bookvir/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/onboarding.dart';

String? globalUserId;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  globalUserId = AuthService.instance.getCurrentUserId();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: globalUserId == null
          ? const OnboardingPageWidget()
          : const HomePageWidget(),
      debugShowCheckedModeBanner: false,
      title: 'Bookvir App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //fontFamily: 'Urbanist',
      ),
      // initialRoute: '/',
      routes: {
        'SearchResultsPageWidget': (context) => const SearchResultsPageWidget(),
        'DisplayCharacterPage': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as CharacterArguments;
          return DisplayCharacterPageWidget(
            characterId: args.characterId,
            characterImage: args.characterImage,
            characterName: args.characterName,
            characterTag: args.characterTag,
            characterTitle: args.characterTitle,
          );
        },
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/character') {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args != null) {
            return MaterialPageRoute(
              builder: (context) => DisplayCharacterPageWidget(
                characterId: args['characterId'] ?? '',
                characterImage: args['characterImage'] ?? '',
                characterName: args['characterName'] ?? '',
                characterTag: args['characterTag'] ?? '',
                characterTitle: args['characterTitle'] ?? '',
              ),
            );
          }
        }
        return null; // If no match found, return null or fallback route
      },
    );
  }
}

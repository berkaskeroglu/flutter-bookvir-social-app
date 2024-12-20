import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService instance = AuthService._privateConstructor();
  AuthService._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      // google - successful
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // firebase - validation
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // getting user id
      String userId = userCredential.user!.uid;

      // firebase - save user data
      saveUserDataToFirebase(userId, googleUser);

      return userCredential;
    } else {
      throw Exception('Google Sign-In failed');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> saveUserDataToFirebase(
      String userId, GoogleSignInAccount googleUser) async {
    DatabaseReference usersRef = FirebaseDatabase.instance
        .ref("users"); // firebase - realtime database instance

    // insert user data
    await usersRef.child(userId).set({
      'name': googleUser.displayName,
      'email': googleUser.email,
      'photoUrl': googleUser.photoUrl,
      'lastSignIn': DateTime.now().toString(),
      'googleUserId': googleUser.id,
    }).then((_) {
      print('success');
    }).catchError((error) {
      print('$error');
    });
  }

  Future<void> getUserDataFromFirebase(String userId) async {
    DatabaseReference userRef = FirebaseDatabase.instance.ref('users/$userId');

    userRef.once().then((snapshot) {
      DataSnapshot dataSnapshot = snapshot.snapshot;

      if (dataSnapshot.exists) {
        Map<dynamic, dynamic> userData =
            dataSnapshot.value as Map<dynamic, dynamic>;
        String userName = userData['name'];
        String userEmail = userData['email'];
        String userPhotoUrl = userData['photoUrl'];

        print('$userName');
        print('$userEmail');
        print('$userPhotoUrl');
      } else {
        print('not found');
      }
    }).catchError((error) {
      print('$error');
    });
  }

  Future<List<Character>> getUserCharacters(String userId) async {
    DatabaseReference charactersRef =
        FirebaseDatabase.instance.ref('characters/$userId/character_general');

    final snapshot = await charactersRef.get();

    if (snapshot.exists) {
      Map<dynamic, dynamic> charactersData =
          snapshot.value as Map<dynamic, dynamic>;
      List<Character> charactersList = [];

      //converts any single element to 'Character' object -> important
      charactersData.forEach((characterId, characterData) {
        charactersList.add(Character.fromMap(characterData));
      });

      return charactersList;
    } else {
      throw Exception("not found");
    }
  }

  Future<List<CharacterStat>> fetchCharacterStats(String characterId) async {
    final DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('characters/$characterId/character_details').get();

    if (!snapshot.exists) {
      throw Exception('Data not found');
    }

    final data = snapshot.value as Map<dynamic, dynamic>;

    return data.keys
        .where((key) => [
              'intelligence',
              'charisma',
              'ambition',
              'strength',
              'general_knowledge'
            ].contains(key))
        .map((key) => CharacterStat.fromJson(key, data[key]))
        .toList();
  }

  String? getCurrentUserId() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return currentUser?.uid;
  }
}

class Character {
  final String id;
  final String image;
  final String name;
  final String tag;
  final String title;

  Character({
    required this.id,
    required this.image,
    required this.name,
    required this.tag,
    required this.title,
  });

  // factory Character.fromMap(Map<dynamic, dynamic> map) {
  //   return Character(
  //     id: map['id'],
  //     image: map['image'],
  //     name: map['name'],
  //     tag: map['tag'],
  //     title: map['title'],
  //   );
  // }

  factory Character.fromMap(Map<dynamic, dynamic> map) {
    return Character(
      id: map['id'] != null ? map['id'] as String : 'Unknown ID',
      image:
          map['image'] != null ? map['image'] as String : 'default_image_url',
      name: map['name'] != null ? map['name'] as String : 'Unnamed Character',
      tag: map['tag'] != null ? map['tag'] as String : 'No Tag',
      title: map['title'] != null ? map['title'] as String : 'No Title',
    );
  }
}

class CharacterStat {
  final String category;
  final Map<String, int> stats;

  CharacterStat({required this.category, required this.stats});

  factory CharacterStat.fromJson(String category, Map<dynamic, dynamic> json) {
    return CharacterStat(
      category: category,
      stats: Map<String, int>.from(json),
    );
  }
}



//lazim olabilecek çağrilar

// await _authService.getUserDataFromFirebase(globalUserId!);       // Bu çağri ile User datasi çekilecek
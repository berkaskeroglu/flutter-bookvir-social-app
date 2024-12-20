import 'package:bookvir/main.dart';
import 'package:bookvir/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '/widgets/dialog.dart';

class SignInPageWidget extends StatefulWidget {
  const SignInPageWidget({super.key});

  @override
  State<SignInPageWidget> createState() => _SignInPageWidgetState();
}

class _SignInPageWidgetState extends State<SignInPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _authService = AuthService.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFEAEAEA),
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, -1),
            child: Image.asset(
              'lib/assets/images/signIn-1.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 210, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 10),
                              child: GradientText(
                                'bookvir',
                                style: const TextStyle(
                                  fontFamily: 'Urbanist',
                                  color: Color(0xFF231D1D),
                                  fontSize: 50,
                                  letterSpacing: 0.0,
                                ),
                                colors: const [
                                  Color(0xFF2A082E),
                                  Color(0xFFCD28B4)
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ),
                            ),
                            const Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: Text(
                                  'Connect to your virtual town.',
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    color: Color(0xFF252A34),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 15),
                                    child: Container(
                                      width: 300,
                                      height: 44,
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: ElevatedButton.icon(
                                                onPressed: () async {
                                                  try {
                                                    UserCredential
                                                        userCredential =
                                                        await _authService
                                                            .signInWithGoogle();
                                                    globalUserId =
                                                        userCredential
                                                            .user?.uid;
                                                    print(
                                                        "Kullanıcı ID: $globalUserId");
                                                    print(
                                                        "Giriş başarılı: ${userCredential.user?.displayName}");
                                                  } catch (e) {
                                                    print("Hata oluştu: $e");
                                                  }
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.transparent,
                                                  size: 20,
                                                ),
                                                label: Text(
                                                  'Sign in with Google',
                                                  style: GoogleFonts.urbanist(
                                                    color:
                                                        const Color(0xFF606060),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize:
                                                      const Size(300, 44),
                                                  backgroundColor: Colors
                                                      .white, // Width and Height
                                                  padding: EdgeInsets
                                                      .zero, // Button color
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  side: const BorderSide(
                                                      color: Colors
                                                          .transparent), // Border style
                                                ),
                                              )),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    -0.83, 0),
                                            child: Container(
                                              width: 22,
                                              height: 22,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'lib/assets/images/google-logo.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => TextButton(
                                    onPressed: () async {
                                      await showDialog(
                                        barrierColor: const Color(0x62383838),
                                        context: context,
                                        builder: (dialogContext) {
                                          return const Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            child:
                                                DialogWidget(), // Your custom dialog widget
                                          );
                                        },
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      backgroundColor: Colors
                                          .transparent, // No background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      shadowColor:
                                          Colors.transparent, // No shadow
                                    ),
                                    child: const Text(
                                      'Why should I sign in?',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF2A082E),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
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
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF222831),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 15, 2, 5),
                                child: Text(
                                  'Signing in is essential to create and manage your characters. By signing in, you’ll be able to save your progress and access your personalized characters.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    color: Color(0xFFF5F5F5),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: const AlignmentDirectional(1, -1),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close_sharp,
                            color: Color(0xFFEAEAEA),
                            size: 24,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          iconSize: 40, // button size
                          padding: const EdgeInsets.all(
                              0), // no padding, similar to borderRadius: 8
                        )),
                  ],
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 15),
                  child: Text(
                    'Once logged in, you can build unique characters, customize them, and invite them to live in your village. Your characters will grow and interact in your world, and your progress will be securely saved, allowing you to return anytime and continue building your community.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      color: Color(0xFF3FC1C9),
                      fontSize: 16,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

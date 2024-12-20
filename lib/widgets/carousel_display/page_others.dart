import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CarouselPageOthersContent extends StatelessWidget {
  const CarouselPageOthersContent({Key? key}) : super(key: key);

  List<Widget> getPages() {
    final Map<String, List<String>> data = {
      'Intelligence': ['Emotional Stability', 'Empathy', 'Persuasion'],
      'Charisma': ['Appearance', 'Communication', 'Humor'],
      'General Knowledge': ['Art', 'Books', 'Movies'],
      'Strength': ['Endurance', 'Fitness', 'Power'],
      'Wisdom': ['Insight', 'Experience', 'Cleverness']
    };

    List<Widget> pages = [];

    data.forEach((title, subtitles) {
      print('Adding Page: $title');
      pages.add(
        Material(
          color: Colors.transparent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFAA994), Color(0xFFFBCEC2)],
                stops: [0, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 6, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 2),
                      child: GradientText(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          color: Color(0xFF1C1503),
                          fontSize: 25,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                        colors: const [Color(0xFFE3E2DE), Color(0xFFF4F2ED)],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      ),
                    ),
                  ),
                  ...subtitles.map((subTitle) {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4, 0, 4, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                width: 100,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEAEAEA),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Text(
                                    subTitle, // Sub title
                                    style: const TextStyle(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF252A34),
                                      fontSize: 11,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Container(
                              width: 230,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFEC8A6A6),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFD83018),
                                            Color(0xFFDF5540)
                                          ],
                                          stops: [0, 0.5],
                                          begin: AlignmentDirectional(-1, 0),
                                          end: AlignmentDirectional(1, 0),
                                        ),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFEC8A6A6),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  Align(
                    alignment: const AlignmentDirectional(-1, 1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFC550C), Color(0xFFF8804C)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 2, 2, 2),
                                  child: Text(
                                    'AVG:',
                                    style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFFDCD4D4),
                                      fontSize: 15,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 5, 2),
                                    child: Text(
                                      '9.7',
                                      style: TextStyle(
                                        fontFamily: 'Urbanist',
                                        color: Color(0xFFE0EB0A),
                                        fontSize: 25,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

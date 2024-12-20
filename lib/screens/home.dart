// import '/backend/api_requests/api_calls.dart';
import 'package:bookvir/main.dart';
// import 'home_page_model.dart';
// export 'home_page_model.dart';
import 'package:bookvir/models/home_model.dart';
import 'package:bookvir/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late Future<List<Character>> _characters;
  late HomePageModel _model;
  List<String> _choices = [];
  String? _selectedChoice;

  final User? currentUser = FirebaseAuth.instance.currentUser;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _characters = AuthService.instance.getUserCharacters(globalUserId!);

    _model = HomePageModel();

    _model.initState();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? userName = currentUser?.displayName;
    return FutureBuilder<List<Character>>(
        future: _characters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Color(0xFFF1F4F8),
              body: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.purple,
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: const Color(0xFFF1F4F8),
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Scaffold(
              backgroundColor: Color(0xFFF1F4F8),
              body: Center(
                child: Text('Character not found'),
              ),
            );
          } else {
            final characters = snapshot.data!;
            final filteredCharacters = _selectedChoice == null
                ? characters
                : characters.where((character) {
                    return character.tag == _selectedChoice;
                  }).toList();
            final tags =
                characters.map((character) => character.tag).toSet().toList();
            _choices = tags;
            return Scaffold(
              key: scaffoldKey,
              backgroundColor: const Color(0xFFF1F4F8),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                              child: Image.asset(
                                'lib/assets/images/home-1.jpg',
                                width: double.infinity,
                                height: 270,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 60, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 40, 0, 0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xC4FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 5, 0),
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
                                                gradientDirection:
                                                    GradientDirection.ltr,
                                                gradientType:
                                                    GradientType.linear,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Text(
                                                'your virtual people.',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Supermercado One',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            25, 40, 25, 15),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0,
                                              2,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(15, 0, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                // Navigator.pushNamed(
                                                //   context,
                                                //   'SearchResultsPageWidget',
                                                //   arguments: {
                                                //     'searchTerm': _model
                                                //         .textController!.text,
                                                //   },
                                                // );
                                                Navigator.pushNamed(
                                                  context,
                                                  '/character',
                                                  arguments: {
                                                    'characterId': "1",
                                                    'characterImage': "man-1",
                                                    'characterName': "berk",
                                                    'characterTag': "very",
                                                    'characterTitle':
                                                        "iyi adam",
                                                  },
                                                );
                                              },
                                              child: const Icon(
                                                Icons
                                                    .location_searching_rounded,
                                                color: Colors.grey,
                                                size: 24,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(5, 0, 0, 2),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  validator: _model
                                                      .textControllerValidator,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onFieldSubmitted: (_) async {
                                                    Navigator.pushNamed(
                                                      context,
                                                      'SearchResultsPageWidget',
                                                      arguments: {
                                                        'searchTerm': _model
                                                            .textController!
                                                            .text,
                                                      },
                                                    );
                                                  },
                                                  obscureText: false,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'Search a friend, or maybe an enemy...',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: const TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    color: Color(0xFFA0A9B2),
                                                    fontSize: 12,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //const SizedBox(height: 15),
                                  //const HomePageChoiceChips(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 15, 0), // Baş ve sona padding
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        spacing: 12,
                                        runSpacing: 12,
                                        children: [
                                          const SizedBox(width: 8),
                                          ..._choices.map((choice) {
                                            return ChoiceChip(
                                              label: Text(
                                                choice,
                                                style: TextStyle(
                                                  fontFamily: 'Figtree',
                                                  color: _selectedChoice ==
                                                          choice
                                                      ? const Color.fromARGB(
                                                          255, 62, 62, 65)
                                                      : const Color(0xFF606A85),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              selected:
                                                  _selectedChoice == choice,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _selectedChoice =
                                                      selected ? choice : null;
                                                });
                                              },
                                              selectedColor:
                                                  const Color.fromARGB(
                                                      77, 94, 96, 99),
                                              backgroundColor:
                                                  const Color(0xFFF1F4F8),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                  color: _selectedChoice ==
                                                          choice
                                                      ? const Color.fromARGB(
                                                          255, 79, 78, 86)
                                                      : const Color(0xFFE5E7EB),
                                                  width:
                                                      _selectedChoice == choice
                                                          ? 2
                                                          : 1,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                    //const SizedBox(width: 16),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 15, 15, 0),
                                    child: Builder(
                                      builder: (context) {
                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.78,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: filteredCharacters.length,
                                          itemBuilder: (context, index) {
                                            final characterItem =
                                                filteredCharacters[index];

                                            String imageName =
                                                '${characterItem.image}.jpg';
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                Navigator.pushNamed(
                                                  context,
                                                  'DisplayCharacterPage',
                                                  arguments: {
                                                    'characterId':
                                                        Uri.encodeComponent(
                                                            characterItem.id),
                                                    'characterImage':
                                                        Uri.encodeComponent(
                                                            characterItem
                                                                .image),
                                                    'characterName':
                                                        Uri.encodeComponent(
                                                            characterItem.name),
                                                    'characterTag':
                                                        Uri.encodeComponent(
                                                            characterItem.tag),
                                                    'characterTitle':
                                                        Uri.encodeComponent(
                                                            characterItem
                                                                .title),
                                                  },
                                                );
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: const Color(0xFFEEEFF1),
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          // const EdgeInsets.all(
                                                          //     2),
                                                          const EdgeInsets
                                                              .fromLTRB(
                                                              2, 2, 2, 5),
                                                      child: Container(
                                                        width: 150,
                                                        height: 150,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          child: Image.asset(
                                                            'lib/assets/images/$imageName',
                                                            width: 50,
                                                            height: 50,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(8,
                                                                    1, 8, 12),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0,
                                                                          3,
                                                                          5,
                                                                          0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        8,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0xFFFCC737),
                                                                        borderRadius:
                                                                            BorderRadius.circular(6),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .fromLTRB(
                                                                              4,
                                                                              2,
                                                                              4,
                                                                              2),
                                                                          child:
                                                                              Text(
                                                                            characterItem.title,
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontFamily: 'Urbanist',
                                                                              color: Color(0xFF31302E),
                                                                              fontSize: 12,
                                                                              letterSpacing: 0.3,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10,
                                                                    5,
                                                                    0,
                                                                    4),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 4,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: Text(
                                                                      characterItem
                                                                          .name,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        color: Color(
                                                                            0xFF31302E),
                                                                        fontSize:
                                                                            15,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        shadows: [
                                                                          Shadow(
                                                                            color:
                                                                                Color(0xFFF1F4F8),
                                                                            offset:
                                                                                Offset(2.0, 2.0),
                                                                            blurRadius:
                                                                                2.0,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Flexible(
                                                                  flex: 1,
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1,
                                                                            0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_forward_ios,
                                                                      color: Color(
                                                                          0x80080808),
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 50, 0, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 0, 5, 15),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'welcome, ',
                                            style: TextStyle(
                                              fontFamily: 'Urbanist',
                                              color: Color(0xFFF4EAEA),
                                              fontSize: 20,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            '$userName' '.',
                                            style: const TextStyle(
                                              fontFamily: 'Urbanist',
                                              color: Color(0xFFF4EAEA),
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          // const Text(
                                          //   '.',
                                          //   style: TextStyle(
                                          //         fontFamily: 'Urbanist',
                                          //         color:Color(0xFFF4EAEA),
                                          //         fontSize: 20,
                                          //         letterSpacing: 0.0,
                                          //         fontWeight: FontWeight.w600,
                                          //       ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}

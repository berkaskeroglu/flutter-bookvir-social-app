import 'package:flutter/material.dart';

class CarouselPage1Content extends StatelessWidget {
  const CarouselPage1Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF2E63), Color(0xFFFD638A)],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      color: Color(0xFFFFDE7D),
                      fontSize: 25,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Text(
                'ABOUTABOUTABOUT',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  color: Color(0xFFF8F3D4),
                  fontSize: 13,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

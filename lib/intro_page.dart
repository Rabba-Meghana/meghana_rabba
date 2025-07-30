import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.8,
      width: screenWidth*0.6,
      
      child: Stack(
        children: [
          // Bottom Image (positioned at bottom)
          Positioned(left: screenWidth*0.2,top:screenHeight*0.4,child:Image.asset(
  'assets/videos/bottom#.gif',
  width: screenWidth*0.5, // optional
  height: screenHeight*0.4, // optional
  fit: BoxFit.cover, // optional
)),

          // Name Container (left side - rounded rectangle)
          Positioned(
            left: screenWidth * 0.09,
            top: screenHeight * 0.2,
            child: Container(
              height: screenHeight * 0.6,
              width: screenWidth * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 41, 57).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'MEGHANA RABBA',
                      style: GoogleFonts.gravitasOne(
                        fontSize:min(screenWidth,screenHeight) * 0.09,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // About Me Container (right side - more rounded)
          Positioned(
            left: screenWidth * 0.5,
            top: screenHeight * 0.3,
            child: Container(
              height: screenHeight * 0.6,
              width: screenWidth * 0.3,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 46, 68).withOpacity(0.8),
                borderRadius: BorderRadius.circular(40), // More rounded than left
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'ABOUT ME',
                      style: GoogleFonts.exo2(
                        fontSize:  min(screenSize.width,screenSize.height)*0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.04),
                  Flexible(
                    child: Text( 
                    '''
Computer science engineer with expertise in AI-driven solutions and scalable software systems. Experience spans real-time detection models, large language model applications, and high‑performance backend architectures.Recognised at national hackathons for delivering innovative solutions that combine strong technical depth with real‑world impact.''',                    style: GoogleFonts.poiretOne(
                        fontSize:  min(screenSize.width,screenSize.height)*0.02,
                        color: Colors.white.withOpacity(0.9),
                        
                      
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
  }
}
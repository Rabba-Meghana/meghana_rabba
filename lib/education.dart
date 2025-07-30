import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationPage extends StatelessWidget {
   EducationPage({super.key});
 
  @override
  Widget build(BuildContext context)
   {
       final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return   Center(
        child: Container(height:screenHeight*0.8,width:screenWidth*0.7,
               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 29, 33, 56).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              
                child:Column(
                  children: [
                    Text(textAlign:TextAlign.center,
                                  'Education',
                                  style: GoogleFonts.gravitasOne(
                          fontSize:min(screenWidth,screenHeight) * 0.06,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                                ),
                                SizedBox(height: screenHeight*0.01,),
                                Row(
                                  children: [ Positioned(left: screenWidth*0.2,top:screenHeight*0.4,child:Image.asset(
  'videos/illinois_tech.jpeg',
  width: screenWidth*0.09, // optional
  height: screenHeight*0.09, // optional
  fit: BoxFit.cover, // optional
)),
SizedBox(width: screenWidth*0.03),
                                    Flexible(
                                      child: Text(textAlign:TextAlign.left,
                                        'Illinois Institute of Technology ',
                                        style: GoogleFonts.exo2(
                                                                fontSize:min(screenWidth,screenHeight) * 0.05,
                                                                color: Colors.white,
                                                                letterSpacing: 1.5,
                                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Row(
                                    children: [SizedBox(width: screenWidth*0.14),
                                      Flexible(
                                        child: Text(textAlign:TextAlign.center,
                                          'Chicago ,Illinois ,United States',
                                                  style: GoogleFonts.poiretOne(
                                                              fontSize: min(screenWidth,screenHeight) * 0.03,
                                                              color: Colors.white.withOpacity(0.9),
                                                              height: 1.5,
                                                            ),
                                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [SizedBox(width: screenWidth*0.14),
                                      Flexible(
                                        child: Text(textAlign:TextAlign.center,
                                          "Master's Degree : Computer Science",
                                                  style: GoogleFonts.poiretOne(
                                                              fontSize: min(screenWidth,screenHeight) * 0.03,
                                                              color: Colors.white.withOpacity(0.9),
                                                              height: 1.5,
                                                            ),
                                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [SizedBox(width: screenWidth*0.14),
                                      Flexible(
                                        child: Text(textAlign:TextAlign.center,
                                          'GPA :4.0',
                                                  style: GoogleFonts.poiretOne(
                                                              fontSize: min(screenWidth,screenHeight) * 0.03,
                                                              color: Colors.white.withOpacity(0.9),
                                                              height: 1.5,
                                                            ),
                                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [SizedBox(width: screenWidth*0.14),
                                      Flexible(
                                        child: Text(textAlign:TextAlign.center,
                                          '2024-2026',
                                                  style: GoogleFonts.poiretOne(
                                                              fontSize: min(screenWidth,screenHeight) * 0.03,
                                                              color: Colors.white.withOpacity(0.9),
                                                              height: 1.5,
                                                            ),
                                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight*0.02,),
                                Row(
                                  children: [ Positioned(left: screenWidth*0.2,top:screenHeight*0.4,child:Image.asset(
  'assets/videos/jss.jpeg',
  width: screenWidth*0.09, // optional
  height: screenHeight*0.09, // optional
  fit: BoxFit.cover, // optional
)),
SizedBox(width: screenWidth*0.03),
                                    Flexible(
                                      child: Text(textAlign:TextAlign.left,
                                        'JSS Academy Of Technical Education',
                                        style: GoogleFonts.exo2(
                                                                fontSize:min(screenWidth,screenHeight) * 0.05,
                                                                color: Colors.white,
                                                                letterSpacing: 1.5,
                                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [SizedBox(width: screenWidth*0.14),
                                    Flexible(
                                      child: Text(textAlign:TextAlign.center,
                                        'Bengaluru ,Karnataka ,India',
                                                style: GoogleFonts.poiretOne(
                                                            fontSize: min(screenWidth,screenHeight) * 0.03,
                                                            color: Colors.white.withOpacity(0.9),
                                                            height: 1.5,
                                                          ),
                                                        ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Row(
                                    children: [SizedBox(width: screenWidth*0.14),
                                      Flexible(
                                        child: Text(textAlign:TextAlign.center,
                                          "Bachelor's Degree: Computer Science and Engineering",
                                                  style: GoogleFonts.poiretOne(
                                                              fontSize: min(screenWidth,screenHeight) * 0.03,
                                                              color: Colors.white.withOpacity(0.9),
                                                              height: 1.5,
                                                            ),
                                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [SizedBox(width: screenWidth*0.14),
                                    Flexible(
                                      child: Text(textAlign:TextAlign.center,
                                        'GPA :3.9',
                                                style: GoogleFonts.poiretOne(
                                                            fontSize: min(screenWidth,screenHeight) * 0.03,
                                                            color: Colors.white.withOpacity(0.9),
                                                            height: 1.5,
                                                          ),
                                                        ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [SizedBox(width: screenWidth*0.14),
                                    Flexible(
                                      child: Text(textAlign:TextAlign.center,
                                        '2020-2024',
                                                style: GoogleFonts.poiretOne(
                                                            fontSize: min(screenWidth,screenHeight) * 0.03,
                                                            color: Colors.white.withOpacity(0.9),
                                                            height: 1.5,
                                                          ),
                                                        ),
                                    ),
                                  ],
                                ),
                  ],
                ),
          ),
        
      
    );
  }
}
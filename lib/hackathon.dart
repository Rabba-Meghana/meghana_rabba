import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HackathonAchievement extends StatelessWidget {
  const HackathonAchievement({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: GestureDetector(
        onTap: () => _showHackathonDetails(context),
        child: Container(
          height: screenHeight * 0.8,
          width: screenWidth * 0.7,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03, vertical: screenHeight * 0.03),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 29, 33, 56).withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                'Hackathon Winner',
                textAlign: TextAlign.center,
                style: GoogleFonts.gravitasOne(
                  fontSize: min(screenWidth, screenHeight) * 0.06,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () => _showHackathonDetails(context),
                child: Image.asset(
                  'assets/videos/mlh1.png',
                  height: screenHeight * 0.5,
                  width: screenWidth * 0.4,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Flexible(
                child: Text(
                  'Uncommon Hacks\nMajor League Hacking',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.exo2(
                    fontSize: min(screenWidth, screenHeight) * 0.03,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHackathonDetails(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(screenSize.width * 0.02),
          child: Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 37, 61, 89),
            ),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/videos/mlh1.png',
                        height: screenSize.height * 0.2,
                        width: screenSize.height * 0.2,
                      ),
                      Expanded(
                        child: Text(
                          'Uncommon Hacks - Major League Hacking',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.exo2(
                            fontSize:
                                min(screenSize.width, screenSize.height) * 0.07,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),

                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextBlock(
                          screenSize,
                          'Title: PyroWatch: From First Spark to First Response',
                        ),
                        _buildTextBlock(
                          screenSize,
                          'Award: Best Overall Project Award Winner',
                        ),
                        _buildTextBlock(
                          screenSize,
                          'Conducted: March 29-30, 2025 by UNIVERSITY OF CHICAGO, Illinois, United States',
                        ),
                        _buildTextBlock(
                          screenSize,
                          'PyroWatch is an AI-powered wildfire detection system that reduces response times by 78% compared to traditional methods. Our solution combines:\n\n• Real-time satellite imagery analysis\n• On-ground IoT sensor networks\n• Predictive modeling for fire spread\n• Automated emergency alerts\n\nBuilt with TensorFlow Lite for edge devices and Firebase for real-time coordination with fire departments.',
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        Row(
                          children: [
                            _buildProjectImage(
                                'assets/videos/Screenshot 2025-07-28 at 8.11.35 PM.png'),
                            SizedBox(width: screenSize.width * 0.05),
                            _buildProjectImage(
                                'assets/videos/Screenshot 2025-07-28 at 8.11.44 PM.png'),
                            
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Helper to style text blocks consistently with padding
  Widget _buildTextBlock(Size screenSize, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        text,
        style: GoogleFonts.exo2(
          fontSize: min(screenSize.width, screenSize.height) * 0.03,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildProjectImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        path,
        width: 280,
        fit: BoxFit.cover,
      ),
    );
  }
}

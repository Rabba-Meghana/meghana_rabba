import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InternshipCard extends StatelessWidget {
  final String companyName;
  final String description;
  final String role;
  final List<String> backendTools;
  final List<String> methods;
  final List<String> frameworks;
  final List<String> insights; // Changed to List<String>
  final String certificateImage;
  final String companyLogo;
  final String completionDate;

  const InternshipCard({
    super.key,
    required this.role,
    required this.companyName,
    required this.description,
    required this.backendTools,
    required this.methods,
    required this.frameworks,
    required this.insights,
    required this.certificateImage,
    required this.companyLogo,
    required this.completionDate,
  });

  void _showInternshipDetails(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(screenSize.width * 0.02),
          child: Container(
            width: screenSize.width * 0.75,
            height: screenSize.height * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenSize.width * 0.02),
              color: const Color.fromARGB(255, 37, 61, 89),
            ),
            child: Column(
              children: [
                // Header with company logo and close button
                Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            companyLogo,
                            height: screenSize.height * 0.09,
                            width: screenSize.height * 0.09,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                companyName,
                                style: GoogleFonts.exo2(
                                  fontSize: min(screenWidth, screenHeight) * 0.05,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              Text(
                                'Completed: $completionDate',
                                style: GoogleFonts.exo2(
                                  fontSize: min(screenWidth, screenHeight) * 0.02,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.close, 
                          size: screenSize.width * 0.03,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.white.withOpacity(0.3)),
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(screenSize.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Description Section
                        Text(
                          'Role',
                          style: GoogleFonts.poiretOne(
                            fontSize: min(screenWidth, screenHeight) * 0.03,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.01),
                        Text(
                          role,
                          style: GoogleFonts.exo2(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                        Text(
                          'Project Overview:',
                          style: GoogleFonts.poiretOne(
                            fontSize: min(screenWidth, screenHeight) * 0.03,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.01),
                        Text(
                          description,
                          style: GoogleFonts.exo2(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.03),

                        // Technologies Sections
                        _buildTechSection(
                          context,
                          'Backend Tools',
                          backendTools,
                        ),
                        if (frameworks.isNotEmpty)
                          _buildTechSection(
                            context,
                            'Frameworks',
                            frameworks,
                          ),
                        _buildTechSection(
                          context,
                          'Methods',
                          methods,
                        ),

                        // Insights Section
                        _buildInsightsSection(context),

                        // Certificate Image
                        Container(
                          padding: EdgeInsets.all(screenSize.width * 0.02),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(screenSize.width * 0.01),
                            child: Image.asset(
                              certificateImage,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: screenSize.height * 0.5,
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
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

  Widget _buildTechSection(BuildContext context, String title, List<String> items) {
    final screenSize = MediaQuery.of(context).size;
    if (items.isEmpty) return SizedBox.shrink();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: GoogleFonts.poiretOne(
            fontSize: min(screenSize.width, screenSize.height) * 0.03,
            color: Colors.white.withOpacity(0.9),
            height: 1.5,
          ),
        ),
        SizedBox(height: screenSize.height * 0.01),
        Wrap(
          spacing: screenSize.width * 0.02,
          runSpacing: screenSize.width * 0.02,
          children: items.map((tech) => Chip(
            backgroundColor: const Color.fromARGB(255, 180, 189, 230).withOpacity(0.5),
            label: Text(
              tech,
              style: GoogleFonts.exo2(
                color: Colors.white,
                fontSize: min(screenSize.width, screenSize.height) * 0.02,
              ),
            ),
          )).toList(),
        ),
        SizedBox(height: screenSize.height * 0.03),
      ],
    );
  }

  Widget _buildInsightsSection(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Insights:',
          style: GoogleFonts.poiretOne(
            fontSize: min(screenSize.width, screenSize.height) * 0.03,
            color: Colors.white.withOpacity(0.9),
            height: 1.5,
          ),
        ),
        SizedBox(height: screenSize.height * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: insights.map((insight) => Padding(
            padding: EdgeInsets.only(bottom: screenSize.height * 0.015),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height * 0.005,
                    right: screenSize.width * 0.02,
                  ),
                  child: Text(
                    '•',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: min(screenSize.width, screenSize.height) * 0.025,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    insight,
                    style: GoogleFonts.exo2(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: min(screenSize.width, screenSize.height) * 0.02,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ),
        SizedBox(height: screenSize.height * 0.02),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => _showInternshipDetails(context),
      child: Container(
        width: screenSize.width * 0.3,
        margin: EdgeInsets.all(screenSize.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenSize.width * 0.02),
          color: const Color.fromARGB(255, 27, 42, 86),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: screenSize.width * 0.01,
              offset: Offset(0, screenSize.width * 0.005),
            ),
          ],
        ),
        child: Flexible(
          child: Column(
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenSize.width * 0.02),
                    topRight: Radius.circular(screenSize.width * 0.02),
                  ),
                  child: Image.asset(
                    companyLogo,
                    height: screenSize.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.02),
                  child: Column(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          companyName,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.exo2(
                            fontWeight: FontWeight.bold,
                            fontSize: min(screenSize.width, screenSize.height) * 0.02,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          completionDate,
                          style: GoogleFonts.exo2(
                            fontSize: min(screenSize.width, screenSize.height) * 0.015,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





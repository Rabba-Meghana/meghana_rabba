import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String certificateImage;
  final String companyLogo;
  final String completionDate;
  final String companyName;

  const AchievementCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.certificateImage,
    required this.companyLogo,
    required this.completionDate,
    required this.companyName,
  });

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  final ScrollController _marqueeController = ScrollController();
  Timer? _marqueeTimer;

  @override
  void initState() {
    super.initState();
    _startMarquee();
  }

  @override
  void dispose() {
    _marqueeTimer?.cancel();
    _marqueeController.dispose();
    super.dispose();
  }

  void _startMarquee() {
    _marqueeTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_marqueeController.hasClients) {
        final maxScroll = _marqueeController.position.maxScrollExtent;
        final currentScroll = _marqueeController.position.pixels;
        
        if (currentScroll >= maxScroll) {
          _marqueeController.jumpTo(0);
        } else {
          _marqueeController.animateTo(
            currentScroll + 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  void _showAchievementDetails(BuildContext context) {
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
                // Header with marquee
                Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.03),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Image.asset(
                              widget.companyLogo,
                              height: screenSize.height * 0.2,
                              width: screenSize.height * 0.2,
                            ),
                          ),Flexible(
                            child: Container(
                                                    height: screenSize.height*0.17,
                                                    child: SingleChildScrollView(
                            controller: _marqueeController,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            child: Text(
                               widget.title,
                              style: GoogleFonts.exo2(
                                fontSize: min(screenSize.width, screenSize.height) * 0.07,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                                                    ),
                                                  ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Completed: ${widget.completionDate}',
                                  style: GoogleFonts.exo2(
                                    fontSize: min(screenSize.width, screenSize.height) * 0.02,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      
                    ],
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(screenSize.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.description,
                          style: GoogleFonts.exo2(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: min(screenSize.width, screenSize.height) * 0.028,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                        // Technologies
                        Text(
                          'Technologies Used:',
                          style: GoogleFonts.poiretOne(
                            fontSize: min(screenSize.width, screenSize.height) * 0.035,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.015),
                        Wrap(
                          spacing: screenSize.width * 0.03,
                          runSpacing: screenSize.width * 0.02,
                          children: widget.technologies.map((tech) => Chip(
                            backgroundColor: const Color.fromARGB(255, 180, 189, 230).withOpacity(0.7),
                            label: Text(
                              tech,
                              style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontSize: min(screenSize.width, screenSize.height) * 0.025,
                              ),
                            ),
                          )).toList(),
                        ),
                        SizedBox(height: screenSize.height * 0.04),
                        // Certificate Image with clear label
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Certificate of Completion',
                                style: GoogleFonts.exo2(
                                  fontSize: min(screenSize.width, screenSize.height) * 0.03,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.02),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  widget.certificateImage,
                                  height: screenSize.height * 0.45,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => _showAchievementDetails(context),
      child: Container(
        width: screenSize.width * 0.45,
        margin: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.02,
          vertical: screenSize.height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 27, 42, 86),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenSize.height * 0.02),
            Image.asset(
              widget.companyLogo,
              width:screenSize.width * 0.08,
              height: screenSize.height * 0.2,
              fit: BoxFit.cover
              ,
            ),
            SizedBox(height: screenSize.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.exo2(
                  color: Colors.white,
                  fontSize: min(screenSize.width, screenSize.height) * 0.035,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.015),
            Text(
              widget.companyName,
              textAlign: TextAlign.center,
              style: GoogleFonts.exo2(
                color: Colors.white.withOpacity(0.8),
                fontSize: min(screenSize.width, screenSize.height) * 0.02,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
          ],
        ),
      ),
    );
  }
}
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String projectImage;
  final String completionDate;
  final String projectLink;
  final List<String> galleryImages;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.projectImage,
    required this.completionDate,
    required this.projectLink,
    required this.galleryImages,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final ScrollController _marqueeController = ScrollController();
  Timer? _marqueeTimer;
  bool _isHovered = false;

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

  Future<void> _launchProjectLink() async {
    final Uri url = Uri.parse(widget.projectLink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showProjectDetails(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(255, 37, 61, 89),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: screenSize.width * 0.8,
            height: screenSize.height * 0.85,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header with title and close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          height: screenSize.height * 0.1,
                          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                          child: SingleChildScrollView(
                            controller: _marqueeController,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            child: Text(
                              widget.title,
                              style: GoogleFonts.exo2(
                                fontSize: min(screenSize.width, screenSize.height) * 0.06,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(color: Colors.white54),

                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Main project image
                        Container(
                          height: screenSize.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(widget.projectImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height*0.04),

                        // Project description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            widget.description,
                            style: GoogleFonts.exo2(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: min(screenSize.width, screenSize.height) * 0.028,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: screenSize.height*0.04),

                        // Technologies used
                        Text(
                          'Technologies Used',
                          style: GoogleFonts.poiretOne(
                            fontSize: min(screenSize.width, screenSize.height) * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       SizedBox(height: screenSize.height*0.04),
                        Wrap(
                          spacing: 12,
                          runSpacing: 10,
                          children: widget.technologies.map((tech) => Chip(
                            backgroundColor: const Color.fromARGB(255, 180, 189, 230).withOpacity(0.3),
                            label: Text(
                              tech,
                              style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontSize: min(screenSize.width, screenSize.height) * 0.025,
                              ),
                            ),
                          )).toList(),
                        ),
                        SizedBox(height: screenSize.height*0.04),

                        // Project link
                        MouseRegion(
                          onEnter: (_) => setState(() => _isHovered = true),
                          onExit: (_) => setState(() => _isHovered = false),
                          child: GestureDetector(
                            onTap: _launchProjectLink,
                            child: Text(
                              'View Project → ${widget.projectLink}',
                              style: GoogleFonts.exo2(
                                color: _isHovered ? Colors.blue.shade200 : Colors.blue.shade300,
                                fontSize: min(screenSize.width, screenSize.height) * 0.025,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                       SizedBox(height: screenSize.height*0.04),

                        // Completion date
                        Text(
                          'Completed: ${widget.completionDate}',
                          style: GoogleFonts.exo2(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: min(screenSize.width, screenSize.height) * 0.025,
                          ),
                        ),
                        SizedBox(height: screenSize.height*0.04),

                        // Gallery images
                        // Text(
                        //   'Project Gallery',
                        //   style: GoogleFonts.poiretOne(
                        //     fontSize: min(screenSize.width, screenSize.height) * 0.04,
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(height: screenSize.height*0.04),
                        SizedBox(
                          height: screenSize.height * 0.2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.galleryImages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.only(right: screenSize.height * 0.1),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    widget.galleryImages[index],
                                    width: screenSize.width * 0.3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
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
      onTap: () => _showProjectDetails(context),
      child: Container(
        width: screenSize.width * 0.4,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 27, 42, 86),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade900.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Project image
            Flexible(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  widget.projectImage,
                  width: double.infinity,
                  height: screenSize.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Project title
            Padding(
              padding: EdgeInsets.all(screenSize.height * 0.03),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.exo2(
                      color: Colors.white,
                      fontSize: min(screenSize.width, screenSize.height) * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenSize.height*0.04),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
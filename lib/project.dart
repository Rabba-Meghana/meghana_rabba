// projects_page.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_get_an_internship/project_widget.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  bool _isScrollingRight = true;
  bool _isHovered = false;
  final double _scrollSpeed = 100.0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_isHovered || !_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      if (_isScrollingRight) {
        if (currentScroll < maxScroll) {
          _scrollController.jumpTo(currentScroll + (_scrollSpeed / 60));
        } else {
          _isScrollingRight = false;
        }
      } else {
        if (currentScroll > 0) {
          _scrollController.jumpTo(currentScroll - (_scrollSpeed / 60));
        } else {
          _isScrollingRight = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          height: screenHeight * 0.8,
          width: screenWidth * 0.7,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 36, 42, 70).withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                'Projects',
                textAlign: TextAlign.center,
                style: GoogleFonts.gravitasOne(
                  fontSize:min(screenWidth,screenHeight) * 0.06,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
             SizedBox(height: screenHeight*0.04),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        SizedBox(width: screenWidth*0.04),ProjectCard(
  title: "Road Damage Detection",
  description:
      "Implemented a road damage detection system using YOLOv7 enhanced with Coordinate Attention modules in PyTorch. Achieved over 90% precision and recall in detecting cracks and potholes, reducing manual inspection times by 70%. The project spanned 4 months, including data collection, model training, and validation, significantly speeding up infrastructure maintenance workflows.",
  technologies: ["Python", "PyTorch", "YOLOv7", "Coordinate Attention", "OpenCV"],
  projectImage: "assets/videos/road_damage.jpeg",
  completionDate: "April 2025",
  projectLink: "https://github.com/Rabba-Meghana/Road-Damage-Detection",
  galleryImages: [
    "assets/videos/rd1.png",
    "assets/videos/rd3.png",
    "assets/videos/Screenshot 2025-07-29 at 12.06.13 PM.png",
  ],
),
            SizedBox(width: screenWidth*0.04),             ProjectCard(
  title: "Real Estate App",
  description:
      "Developed a cross-platform real estate application using Flutter and Dart, integrating REST APIs and Firebase for backend services. Enhanced user experience by optimizing data loading, reducing load times by 40%, and improving UI responsiveness. The project was completed in 3 months, streamlining property search and filtering from hours to seconds.",
  technologies: ["Flutter", "Dart", "REST APIs", "Firebase"],
  projectImage: "assets/videos/real_estate.jpeg",
  completionDate: "February 2025",
  projectLink: "https://github.com/Rabba-Meghana/Real-estate-app",
  galleryImages: [
    
  ],
),

ProjectCard(
  title: "PI-Crop",
  description:
      "Built an AI and IoT powered smart farming assistant using Python, TensorFlow, and Raspberry Pi. Leveraged real-time sensor data for soil and climate monitoring, combined with AI-driven crop recommendations. Reduced manual monitoring time by 60%, accelerating farmer decision-making from days to hours. The integrated system was developed over 5 months with comprehensive hardware-software synergy.",
  technologies: ["Python", "TensorFlow", "Raspberry Pi", "IoT", "Flask"],
  projectImage: "assets/videos/pi_crop.jpeg",
  completionDate: "January 2025",
  projectLink: "https://github.com/Rabba-Meghana/Pi-crop",
  galleryImages: [
   
  ],
),
SizedBox(width: screenWidth*0.04),

SizedBox(width: screenWidth*0.04),
ProjectCard(
  title: "Machine Health Prediction",
  description:
      "Developed a predictive maintenance system for brake manufacturing machines using Python and XGBoost. Forecasted machine health and failure points, reducing unexpected downtime by 35% and optimizing maintenance scheduling from reactive to proactive within 3 months. The project improved plant efficiency and minimized costly production halts.",
  technologies: ["Python", "XGBoost", "Scikit-learn", "Pandas", "Jupyter"],
  projectImage: "assets/videos/machine.jpeg",
  completionDate: "March 2024",
  projectLink: "https://github.com/Rabba-Meghana/Machine-Health-Prediction",
  galleryImages: [
    "assets/videos/line_graph.png",
    "assets/videos/pie_chart.png",
  ],
),

                        SizedBox(width: screenWidth*0.04),
                      ],
                    ),
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
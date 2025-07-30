import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_get_an_internship/internship_card.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<InternshipPage> createState() => _InternshipPageState();
}

class _InternshipPageState extends State<InternshipPage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  bool _isScrollingRight=true;
  bool _isScrollingDown = true;
  bool _isHovered = false;
  final double _scrollSpeed = 100.0; // pixels per second

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
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 39, 68).withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Fixed Header
                Text(
                  textAlign: TextAlign.center,
                  'Work Experience',
                  style: GoogleFonts.gravitasOne(
                    fontSize:min(screenWidth,screenHeight) * 0.06,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                
                // Scrollable Content
               Expanded(
        child: ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false, ),// This explicitly hides scrollbars
        
                  child: SingleChildScrollView(
                    scrollDirection:Axis.horizontal,
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        
      
      InternshipCard(
                        role: 'Software Engineering',
                        companyName: "Wells Fargo",
                        description: "Completed an intensive virtual simulation focused on financial systems modernization using Spring Boot microservices and cloud technologies. Gained hands-on experience designing REST APIs for high-volume transaction processing and implementing fraud detection patterns. Learned industry best practices for CI/CD pipelines and Agile development in banking systems.",
                        backendTools: ["Spring Boot", "JPA/Hibernate", "H2 Database", "REST APIs"],
                        frameworks: ["Microservices Architecture", "Spring Cloud", "Apache Kafka", "Docker"],
                        methods: ["Agile Scrum", "CI/CD Pipelines", "Schema Validation Protocols", "TDD"],
                        insights: [
                          "Streamlined high-volume batch processing operations from 15 minutes down to just 11 minutes per job...",
                          "Eliminated 8 weekly staff hours of manual work...",
                          "Mastered advanced fraud detection patterns..."
                        ],
                        certificateImage: "assets/videos/wells_certificate.png",
                        companyLogo: "assets/videos/wells.png",
                        completionDate: "July 2025",
                      ),
                      
                      SizedBox(height: screenHeight * 0.03),
                      
                      InternshipCard(
                        role: 'Software Engineering',
                        companyName: "Deloitte Technology", 
                        description: "Participated in a virtual consulting simulation focused on manufacturing data automation using Python and machine learning. Developed analytical dashboards and predictive models while learning Deloitte's approach to client communication. Gained practical experience in translating technical solutions into business recommendations.",
                        backendTools: ["Python", "Pandas", "NumPy", "Jupyter Notebooks"],
                        frameworks: ["Scikit-learn", "TensorFlow", "Flask"],
                        methods: ["Design Thinking", "Agile Methodology", "Stakeholder Communication"],
                        insights: [
                          "Reduced daily data processing time from 4 hours to 45 minutes...",
                          "Identified potential equipment failures 3 weeks in advance...",
                          "Transformed technical findings into executive-ready presentations..."
                        ],
                        certificateImage: "assets/videos/deloitte_certifcate.png",
                        companyLogo: "assets/videos/deloitte.png",
                        completionDate: "July 2025",
                      ), SizedBox(height: screenHeight * 0.03),InternshipCard(
        role: 'Mobile App Developer & AI Specialist',
        companyName: "AGRI TYPE Research Lab",
        description: "Developed an AI-powered mobile application for crop disease detection using Flutter and TensorFlow Lite. Optimized machine learning models for low-end devices and implemented real-time data processing with Firebase. Contributed to a solution currently used by farmers in rural communities",
      
        backendTools: ["Python", "TensorFlow Lite", "ONNX Runtime"],
        frameworks: ["Flutter", "OpenCV", "Firebase"],
        methods: ["Mobile AI Integration", "Model Optimization", "Edge Computing"],
      
        insights: [
      "Reduced model size from 58MB to 23MB enabling deployment on farmer mobile devices",
      "Decreased image processing time from 2.1s to 0.9s in the field analysis app",
      "Cut API response latency from 420ms to 190ms for real-time sensor data",
      "Designed mobile interfaces that reduced manual data entry by 8 hours/week"
        ],
      
        certificateImage: "assets/videos/agritype.png",
        companyLogo: "assets/videos/jss2.png",
        completionDate: "May 2024",
      )
                      ],
                    ),
                  ),
                ),
            )],
            ),
          ),
        ),
      );
  }
}
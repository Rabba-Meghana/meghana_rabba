import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_get_an_internship/achievementCard.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
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

      if (_isScrollingDown) {
        if (currentScroll < maxScroll) {
          _scrollController.jumpTo(currentScroll + (_scrollSpeed / 60));
        } else {
          _isScrollingDown = false;
        }
      } else {
        if (currentScroll > 0) {
          _scrollController.jumpTo(currentScroll - (_scrollSpeed / 60));
        } else {
          _isScrollingDown = true;
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
                  'Certifications',
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
                    scrollDirection:Axis.vertical,
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                  
                     SizedBox(height: screenWidth * 0.03),
          AchievementCard(
  title: "Machine Learning Foundations",
  companyName: "AWS Educate",
  description: "Mastered core machine learning concepts on AWS infrastructure, "
      "including data preprocessing, model training, and evaluation techniques. "
      "Gained hands-on experience with AWS AI/ML services for building scalable solutions.",
  technologies: [
    "SageMaker",
    "Data Wrangler",
    "Linear Learner",
    "XGBoost",
    "Model Deployment"
  ],
  certificateImage: "assets/videos/aws-educate-machine-learning-foundations.png",
  companyLogo: "assets/videos/aws.jpeg",
  completionDate: "July 2025", // Update with your completion date
),
               SizedBox(height: screenWidth * 0.03),         
                        AchievementCard(
  title: "MLOps for Generative AI",
  companyName: "Google Cloud Skills Boost",
  description: "Completed advanced training in MLOps for Generative AI, gaining expertise in Vertex AI workflows, "
      "model deployment automation, and scalable AI operations. Mastered techniques to overcome unique challenges "
      "in managing generative models.",
  technologies: [
    "Vertex AI",
    "ML Pipelines",
    "Model Deployment",
    "Generative AI",
    "Cloud Automation"
  ],

  certificateImage: "assets/videos/mlops for genai.png",
  companyLogo: "assets/videos/google.jpg",
  completionDate: "July 2025",
),
    SizedBox(height: screenWidth * 0.03),
          AchievementCard(
            title: "Attention Mechanism",
            companyName: "Google Cloud Skills Boost",
            description: "Architected transformer-based systems using advanced attention "
                "patterns. Optimized self-attention layers for complex NLP and multimodal "
                "learning tasks.",
            technologies: [
              "Transformers",
              "Self-Attention",
              "BERT",
              "Contextual Embeddings"
            ],
            certificateImage: "assets/videos/attention_mechanism.png",
            companyLogo: "assets/videos/google.jpg",
            completionDate: "June 2025",
          ),
         SizedBox(height: screenWidth * 0.03),
          AchievementCard(
            title: "Introduction to Responsible AI",
            companyName: "Google Cloud Skills Boost",
            description: "Implemented ethical AI frameworks meeting Google's principles. "
                "Designed fairness metrics and bias mitigation strategies for production "
                "machine learning systems.",
            technologies: [
              "AI Ethics",
              "Fairness Indicators",
              "Explainability",
              "Bias Detection"
            ],
            certificateImage: "assets/videos/Inro to responsible AI.png",
            companyLogo: "assets/videos/google.jpg",
            completionDate: "May 2025",
          ),
          SizedBox(height: screenWidth * 0.03),
          AchievementCard(
            title: "Introduction to Security in AI",
            companyName: "Google Cloud Skills Boost",
            description: "Hardened AI systems against adversarial attacks and data "
                "vulnerabilities. Established security protocols for model serving and "
                "data pipelines.",
            technologies: [
              "Model Encryption",
              "Adversarial Defense",
              "Privacy Preservation",
              "Secure Serving"
            ],
            certificateImage: "assets/videos/Introduction to security in the world of AI.png",
            companyLogo: "assets/videos/google.jpg",
            completionDate: "March 2025",
          ),
         SizedBox(height: screenWidth * 0.03),
          AchievementCard(
            title: "Introduction to Generative AI",
            companyName: "Google Cloud Skills Boost",
            description: "Built and deployed creative AI systems producing novel content. "
                "Specialized in diffusion models and GAN architectures for media generation.",
            technologies: [
              "GANs",
              "Diffusion Models",
              "Creative AI",
              "Content Generation"
            ],
            certificateImage: "assets/videos/introduction to genAI.png",
            companyLogo: "assets/videos/google.jpg",
            completionDate: "February 2025",
          ),
         SizedBox(height: screenWidth * 0.03),
          AchievementCard(
            title: "Innovating with Google Cloud AI",
            companyName: "Google Cloud Skills Boost",
            description: "Pioneered cloud-native AI solutions leveraging Google's "
                "cutting-edge infrastructure. Accelerated model development using AutoML "
                "and TPU optimization.",
            technologies: [
              "AutoML",
              "TPUs",
              "Cloud AI",
              "Solution Architecture"
            ],
            certificateImage: "assets/videos/innovating with Google cloud ai.png",
            companyLogo: "assets/videos/google.jpg",
            completionDate: "January 2025",
          ),
          SizedBox(height: screenWidth * 0.03),
          AchievementCard(
            title: "Introduction to Large Language Models",
            companyName: "Google Cloud Skills Boost",
            description: "Engineered LLM applications with advanced prompt engineering "
                "and fine-tuning techniques. Deployed scalable NLP solutions using "
                "transformer architectures.",
            technologies: [
              "LLMs",
              "Prompt Engineering",
              "Text Generation",
              "NLP"
            ],
            certificateImage: "assets/videos/intro to LLM.png",
            companyLogo: "assets/videos/google.jpg",
            completionDate: "Decemeber 2025",
          ),
          SizedBox(height: screenWidth * 0.03),
          AchievementCard(
            title: "Applying AI Principles",
            companyName: "Google Cloud Skills Boost",
            description: "Operationalized responsible AI practices across the ML "
                "lifecycle. Implemented governance frameworks for compliant model "
                "deployment.",
            technologies: [
              "AI Governance",
              "Compliance",
              "Ethical AI",
              "Responsible Deployment"
            ],
            certificateImage: "assets/videos/Applying AI Priciples with Google Cloud.png",
            companyLogo: "assets/videos/google.jpg",
            completionDate: "November 2024",
          ),
          SizedBox(height: screenWidth * 0.03),
          AchievementCard(
  title: "Machine Learning Foundations",
  companyName: "AWS Educate",
  description: "Mastered core machine learning concepts on AWS infrastructure, "
      "including data preprocessing, model training, and evaluation techniques. "
      "Gained hands-on experience with AWS AI/ML services for building scalable solutions.",
  technologies: [
    "SageMaker",
    "Data Wrangler",
    "Linear Learner",
    "XGBoost",
    "Model Deployment"
  ],
  certificateImage: "assets/videos/aws-educate-machine-learning-foundations.png",
  companyLogo: "assets/videos/aws.jpeg",
  completionDate: "October 2024", // Update with your completion date
),
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
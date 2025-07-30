import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html; // for web download

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  final String linkedInUrl = 'https://www.linkedin.com/in/meghanarabba/';
  final String email = 'mrabba@illinoistech.edu';
  final String pdfAssetPath = 'assets/resume/meghana_rabba_ai_1.pdf';

  // --- Open LinkedIn ---
  Future<void> _launchLinkedIn() async {
    final Uri url = Uri.parse(linkedInUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch LinkedIn');
    }
  }

  // --- Send Email ---
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(emailUri)) {
      debugPrint('Could not launch email');
    }
  }

  // --- Download/Open PDF ---
  Future<void> _downloadResume() async {
    final data = await rootBundle.load(pdfAssetPath);
    final Uint8List bytes = data.buffer.asUint8List();

    if (kIsWeb) {
      // For Web: trigger file download
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "Meghana_Rabba_Resume.pdf")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // For Mobile/Desktop: open PDF in external viewer
      final Uri fileUri = Uri.dataFromBytes(bytes, mimeType: 'application/pdf');
      if (!await launchUrl(fileUri)) {
        debugPrint('Could not open PDF');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: screenHeight * 0.7,
        width: screenWidth * 0.7,
        padding:  EdgeInsets.symmetric(horizontal: screenHeight * 0.1,vertical:screenWidth * 0.1),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 29, 33, 56).withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // Title
            Text(
              'Contact Info',
              textAlign: TextAlign.center,
              style: GoogleFonts.gravitasOne(
                fontSize:min(screenWidth,screenHeight) * 0.06,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
           SizedBox(height: screenHeight * 0.06),

            // Action Buttons
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: _buildActionButton(
                      icon: Icons.download,
                      label: 'Download Resume',
                      onPressed: _downloadResume,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  ),SizedBox(height: screenHeight * 0.04),
                  Flexible(
                    child: _buildActionButton(
                      icon: Icons.link,
                      label: 'LinkedIn',
                      onPressed: _launchLinkedIn,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  ),SizedBox(height: screenHeight * 0.04),
                  Flexible(
                    child: _buildActionButton(
                      icon: Icons.email,
                      label: 'Email',
                      onPressed: _launchEmail,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Button Widget
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required double screenWidth,
    required double screenHeight,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenHeight * 0.015,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: GoogleFonts.exo2(
          fontSize: min(screenWidth, screenHeight) * 0.025,
          color: Colors.white,
        ),
      ),
    );
  }
}

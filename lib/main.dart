import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sameen Collections',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ComingSoonPage(),
    );
  }
}

const imgWeb =
    "https://images.pexels.com/photos/5119940/pexels-photo-5119940.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
const imgMobile =
    "https://images.pexels.com/photos/23223845/pexels-photo-23223845/free-photo-of-elegant-red-purse.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width < 600.0;
    return Scaffold(
      body: Container(
        // Adding a background network image with a loader
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Network Image with a loader
            Image.network(
              size ? imgMobile : imgWeb, // Replace with your image URL
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                // Check if the image is still loading
                if (loadingProgress == null) {
                  return child; // Once image is loaded, display it
                } else {
                  // Show a loader while the image is loading
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
            ),

            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            // Overlay content on top of the background image
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),

                  // Title "SAMEEN" in Arima font with vintage style
                  Text(
                    'SAMEEN',
                    style: GoogleFonts.arima(
                      textStyle: TextStyle(
                        fontSize: size ? 36 : 46,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 8,
                        decoration: TextDecoration.none,
                        height: 0.5,
                      ),
                    ),
                  ),
                  Text(
                    'COLLECTIONS',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: size ? 16 : 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: size ? 7.4 : 7.5,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Spacer(),

                  // "COMING SOON" in the middle
                  Text(
                    'COMING SOON',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontSize: size ? 32 : 42,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Classy description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'We are working hard to bring something exciting to you. Stay tuned!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size ? 18 : 36,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Spacer(),

                  // Footer with copyright symbol
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     '© 2024 SAMEENS - All Rights Reserved',
                  //     style: TextStyle(
                  //       color: Colors.white54,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          '© 2024 SAMEENS',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

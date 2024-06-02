import 'dart:convert'; // Add this import for base64 decoding
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final int age;
  final String country;
  final List<String> imagePaths;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.age,
    required this.country,
    required this.imagePaths,
  }) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  int currentIndex = 0;

  void _cyclePhotos() {
    setState(() {
      int nextIndex = (currentIndex + 1) % widget.imagePaths.length;
      if (widget.imagePaths[nextIndex].isNotEmpty) {
        currentIndex = nextIndex;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Next image is not available!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _cyclePhotos,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: MemoryImage(base64Decode(widget.imagePaths[currentIndex])),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(38, 158, 158, 158),
              height: MediaQuery.of(context).size.width * 1.5
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Text content with padding
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Name and age
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          widget.country,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.h,
                          ),
                        ),
                        SizedBox(height: 22.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      currentIndex = (currentIndex + 1) % widget.imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _cyclePhotos,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: AssetImage(widget.imagePaths[currentIndex]),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: Stack(
          children: [
            // Transparent container for bottom gradient
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
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
            // Text content with padding
            Positioned(
              bottom: 60,
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
                          "${widget.age} years old",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.h,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.country,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.h,
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
  }
}
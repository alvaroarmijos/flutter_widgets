import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(height: 20, width: 200),
                SizedBox(
                  height: 24,
                ),
                Skeleton(
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(height: 24, width: 250),
                      SizedBox(
                        height: 12,
                      ),
                      Skeleton(height: 16, width: 194),
                      SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: Skeleton(height: 200, width: 160),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Skeleton(height: 40, width: double.infinity),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Skeleton(
                  height: 110,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 16,
                ),
                Skeleton(height: 20, width: 250),
                SizedBox(
                  height: 16,
                ),
                Skeleton(height: 36, width: double.infinity),
                SizedBox(
                  height: 16,
                ),
                Skeleton(height: 36, width: double.infinity),
                SizedBox(
                  height: 16,
                ),
                Skeleton(height: 36, width: double.infinity),
                SizedBox(
                  height: 16,
                ),
                Skeleton(height: 36, width: double.infinity),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

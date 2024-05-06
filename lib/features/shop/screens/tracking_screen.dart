import 'package:flutter/material.dart';
import 'package:nova_mobile/features/shop/components/tracking_progress.card.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const TrackingProgressCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle
                        ),
                      ),
                    )
                ],
              ),
            ),
            const TrackingProgressCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle
                        ),
                      ),
                    )
                ],
              ),
            ),
            const TrackingProgressCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle
                        ),
                      ),
                    )
                ],
              ),
            ),
            const TrackingProgressCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle
                        ),
                      ),
                    )
                ],
              ),
            ),
            const TrackingProgressCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle
                        ),
                      ),
                    )
                ],
              ),
            ),
            const TrackingProgressCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle
                        ),
                      ),
                    )
                ],
              ),
            ),
            const TrackingProgressCard(),
          ],
        ),
      ),
    );
  }
}

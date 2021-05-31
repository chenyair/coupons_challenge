import 'dart:math';

import 'package:coupons_challenge/home_screen/widgets/discover.dart';
import 'package:flutter/material.dart';

final random = Random();

class DiscoverList extends StatelessWidget {
  final BoxConstraints constraints;

  const DiscoverList({
    required this.constraints,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Discover',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
            ),
            Row(
              children: [
                Text(
                  'view all',
                  style: TextStyle(
                    color: Colors.black12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 22,
                    color: Colors.black12,
                  ),
                )
              ],
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: discoverOptions.length,
            padding: EdgeInsets.only(left: 16.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth / 2.5,
                      decoration: BoxDecoration(
                        color: discoverOptions[index].color,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: ClipRRect(
                        child: RectanglesBackgorund(),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: SizedBox(
                        width: constraints.maxWidth / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              discoverOptions[index].title,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${discoverOptions[index].couponsNumber} coupons',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: Icon(
                        discoverOptions[index].icon,
                        color: Colors.white.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final Rect rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 100,
      height: 200,
    );
    final paint = Paint()..color = Colors.white.withAlpha(50);
    // canvas.rotate(random.nextDouble() * pi - pi / 2);
    // canvas.rotate();
    canvas.drawRect(rect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RectanglesBackgorund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RectanglePainter(),
    );
  }
}

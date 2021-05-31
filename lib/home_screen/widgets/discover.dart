import 'package:flutter/material.dart';

class Discover {
  final String title;
  final Color color;
  final IconData icon;
  final int couponsNumber;

  Discover({
    required this.couponsNumber,
    required this.title,
    required this.color,
    required this.icon,
  });
}

final List<Discover> discoverOptions = [
  Discover(
    title: 'Most Favourites',
    color: Color(0xFFE8A530),
    icon: Icons.favorite_border,
    couponsNumber: 26,
  ),
  Discover(
    title: 'Newest',
    color: Color(0xFF3DB7F4),
    icon: Icons.new_releases_outlined,
    couponsNumber: 20,
  ),
  Discover(
    title: 'Super Cool',
    color: Color(0xFFA8D4F8),
    icon: Icons.fingerprint_outlined,
    couponsNumber: 10,
  ),
];

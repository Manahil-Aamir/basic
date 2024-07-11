import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color color;

  Category({required this.name, required this.color});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.name == name &&
        other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:math';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class CatalogModel {
  static List<String> itemNames = [
    'Arroz',
    'Huevos',
    'Frijol',
    'Leche',
    'Pan',
    'Salchicha',
    'Queso',
    'Mortadela ',
    'Panela',
    'Chocolate'
  ];
  
  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  // Item getById(int id) => Item(id, itemNames[id]);

	
 Item getById(int id) {
    if (id >= 0 && id < itemNames.length) {
      return Item(id, itemNames[id]);
    } else {
      throw RangeError('Index out of range: $id');
    }
  }

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}
int generarNumeroAleatorio(int min, int max) {
  return Random().nextInt(max - min) + min;
} 
@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = generarNumeroAleatorio(0, 200);

  Item(this.id, this.name)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

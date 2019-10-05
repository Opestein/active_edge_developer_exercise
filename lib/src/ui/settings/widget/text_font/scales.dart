// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ActiveEdgeTextScaleValue {
  const ActiveEdgeTextScaleValue(this.scale, this.label);

  final double scale;
  final String label;

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final ActiveEdgeTextScaleValue typedOther = other;
    return scale == typedOther.scale && label == typedOther.label;
  }

  @override
  int get hashCode => hashValues(scale, label);

  @override
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<ActiveEdgeTextScaleValue> kAllActiveEdgeTextScaleValues =
    <ActiveEdgeTextScaleValue>[
  ActiveEdgeTextScaleValue(null, 'System Default'),
  ActiveEdgeTextScaleValue(0.8, 'Small'),
  ActiveEdgeTextScaleValue(1.0, 'Normal'),
  ActiveEdgeTextScaleValue(1.2, 'Large'),
//  TimbalaTextScaleValue(2.0, 'Huge'),
];

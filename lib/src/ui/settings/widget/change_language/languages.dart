// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ActiveEdgeLanguages {
  const ActiveEdgeLanguages(this.index, this.label);

  final int index;
  final String label;

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final ActiveEdgeLanguages typedOther = other;
    return index == typedOther.index && label == typedOther.label;
  }

  @override
  int get hashCode => hashValues(index, label);

  @override
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<ActiveEdgeLanguages> kAllActiveEdgeLanguageValues =
    <ActiveEdgeLanguages>[
  ActiveEdgeLanguages(0, 'English'),
  ActiveEdgeLanguages(1, 'French'),
];

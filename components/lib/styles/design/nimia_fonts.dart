import 'package:flutter/material.dart';

import '../styles.dart';

abstract class NimiaFonts {
  static const description = TextStyle(
    fontSize: 14,
    height: 1.2,
    fontFamily: 'Itau-Display',
    color: NimiaColors.lead130,
    fontWeight: FontWeight.w400,
  );

  static final descriptionBold = description.copyWith(fontWeight: FontWeight.bold);

  static final highlightedDescription = descriptionBold.copyWith(
    color: NimiaColors.green100,
  );

  static final link = descriptionBold.copyWith(color: NimiaColors.blue110);
}

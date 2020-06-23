import 'package:flutter/material.dart';

/// The base api url.
const String kApiUrl = 'https://jsonplaceholder.typicode.com';

/// Basic colors for the app.
const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

/// Default Padding for widgets.
/// 
/// Can be used like: `EdgeInsets.all(kDefaultPadding)` or `SizedBox(height: kDefaultPadding / 2)`
const kDefaultPadding = 20.0;

/// The default shadow in the app.
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12,
);
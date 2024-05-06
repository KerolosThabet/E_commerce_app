import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  ApiManager.init();
  runApp(const MyApp());


}


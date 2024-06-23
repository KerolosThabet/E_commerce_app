import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/DI/di.dart';
import 'core/myobserver.dart';
import 'my_app.dart';

void main() {

  ApiManager.init();
  Bloc.observer =MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());


}


import 'package:ecommerce/core/constant/route.dart';
import 'package:flutter/cupertino.dart';

import '../../view/Screens/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login : (context) => const login()
};
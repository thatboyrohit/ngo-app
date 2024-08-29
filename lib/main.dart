import 'package:flutter/material.dart';
import 'package:ngo/common/widgets/bottom_bar.dart';
import 'package:ngo/constants/global_variables.dart';
import 'package:ngo/features/admin/screen/admin_screen.dart';
import 'package:ngo/features/auth/screens/auth_screen.dart';
import 'package:ngo/features/auth/services/auth_service.dart';

import 'package:ngo/providers/user_provider.dart';
import 'package:ngo/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NGO',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ?
      Provider.of<UserProvider>(context).user.type == 'user' 
          ? const BottomBar() 
          : const BottomBar()
          : const BottomBar(),
    );
  }
}

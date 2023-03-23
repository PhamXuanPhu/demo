import 'package:bloc/bloc.dart';
import 'package:conasi/blocs/lead/lead_bloc.dart';
import 'package:conasi/screens/login_screen.dart';
import 'package:conasi/services/app_loading.dart';
import 'package:conasi/services/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
    )),
  );
  Loading.configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LeadBloc()),
      ],
      child: MaterialApp(
        title: 'Conasi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
        builder: EasyLoading.init(),
      ),
    );
  }
}

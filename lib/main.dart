import 'package:cakey_portfolio/Presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Presentation/shared/screen_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();
  runApp(CakeyApp(appRouter: appRouter,),);
}


class CakeyApp extends StatelessWidget {
  final AppRouter appRouter;
  const CakeyApp({
    required this.appRouter,
    super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Config.figmaDesignSize,
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }
}

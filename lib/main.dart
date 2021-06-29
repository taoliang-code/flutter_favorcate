import 'package:flutter/material.dart';
import 'package:flutter_favorcate/common/app_theme.dart';
import 'package:flutter_favorcate/common/size_fit.dart';
import 'package:flutter_favorcate/generated/l10n.dart';
import 'package:flutter_favorcate/provider/providers_config.dart';
import 'package:flutter_favorcate/router/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: ProvidersConfig.providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    return MaterialApp(
      title: '美食广场',
      theme: AppTheme.defaultTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: CustomRouter.initialRoute,
      routes: CustomRouter.routes,
      onGenerateRoute: CustomRouter.generateRoute,
      onUnknownRoute: CustomRouter.unknownRoute,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
    );
  }
}

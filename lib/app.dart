import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/locale/locale_cubit.dart';
import 'core/config/flavor_config.dart';
import 'core/widgets/dialogs/unauthorized_dialog.dart';
import 'l10n/app_localizations.dart';
import 'core/network/api_client.dart';
import 'core/theme/app_theme.dart';
import 'config/routes/app_router.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'injection_container.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthCubit _authCubit;
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _authCubit = sl<AuthCubit>();
    _appRouter = AppRouter(
      authCubit: _authCubit,
      navigatorKey: rootNavigatorKey,
    );
    _authCubit.checkAuthStatus();

    _setupUnauthorizedHandler();
  }

  void _setupUnauthorizedHandler() {
    final apiClient = sl<ApiClient>();
    apiClient.onUnauthorized = () {
      showSessionExpiredDialog(_authCubit);
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(value: _authCubit),
        BlocProvider<LocaleCubit>(create: (_) => sl<LocaleCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            title: FlavorConfig.appName,
            debugShowCheckedModeBanner: FlavorConfig.isDevelopment,
            theme: AppTheme.lightTheme,
            locale: locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('id', 'ID'),
              Locale('en', 'US'),
            ],
            routerConfig: _appRouter.router,
            builder: (context, child) {
              if (FlavorConfig.isDevelopment) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Banner(
                    color: Colors.red,
                    message: 'DEV',
                    location: BannerLocation.topEnd,
                    child: child,
                  ),
                );
              }
              return child!;
            },
          );
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/locale/locale_cubit.dart';
import 'core/bloc/theme/theme_cubit.dart';
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
        BlocProvider<ThemeCubit>(create: (_) => sl<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                title: 'Rizki Pambudi | Senior Flutter & Mobile Developer',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
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
              );
            },
          );
        },
      ),
    );
  }
}

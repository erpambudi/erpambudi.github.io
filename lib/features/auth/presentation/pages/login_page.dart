import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/responsive/responsive_builder.dart';
import '../../../../core/widgets/snackbar/app_snackbar.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../layouts/login_desktop_layout.dart';
import '../layouts/login_mobile_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            AppSnackBar.showError(context, message: state.message);
          } else if (state is AuthUnauthenticatedState &&
              state.message != null) {
            AppSnackBar.showInfo(context, message: state.message!);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoadingState;

          return ResponsiveBuilder(
            mobile: (context, constraints) => LoginMobileLayout(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              isLoading: isLoading,
              onLoginPressed: _onLoginPressed,
            ),
            desktop: (context, constraints) => LoginDesktopLayout(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
              isLoading: isLoading,
              onLoginPressed: _onLoginPressed,
            ),
          );
        },
      ),
    );
  }
}

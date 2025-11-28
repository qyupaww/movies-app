import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: ColorPallete.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: BlocProvider.of<AuthBloc>(context)..add(AuthInitEvent()),
        builder: (context, state) {
          if (state.status == AuthStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                  color: ColorPallete.white, strokeWidth: 2),
            );
          }
          if (state.status == AuthStatus.authenticated && state.user != null) {
            final email = state.user!['email'] ?? '';
            final name = state.user!['name'] ?? 'User';
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: ColorPallete.grey,
                        child: Icon(Icons.person, color: ColorPallete.white),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: const TextStyle(
                                  color: ColorPallete.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text(email,
                              style: const TextStyle(
                                  color: ColorPallete.grey, fontSize: 14)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.primaryColor),
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: ColorPallete.white),
                    ),
                  )
                ],
              ),
            );
          }

          return const _LoginForm();
        },
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Login',
              style: TextStyle(
                  color: ColorPallete.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            style: const TextStyle(color: ColorPallete.white),
            decoration: const InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(color: ColorPallete.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPallete.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPallete.white)),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _emailController,
            style: const TextStyle(color: ColorPallete.white),
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: ColorPallete.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPallete.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPallete.white)),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _passwordController,
            obscureText: true,
            style: const TextStyle(color: ColorPallete.white),
            decoration: const InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: ColorPallete.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPallete.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPallete.white)),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent(
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                  name: _nameController.text.trim().isEmpty
                      ? null
                      : _nameController.text.trim(),
                ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.primaryColor),
              child: const Text(
                'Login',
                style: TextStyle(color: ColorPallete.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

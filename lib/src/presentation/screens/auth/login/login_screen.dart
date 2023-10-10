import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:trackstar_web/src/data/datasource/auth/signup.dart';
import 'package:trackstar_web/src/presentation/screens/auth/widgets/widgets.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackGroundAuth(
            svgRoute: 'assets/svg/login.svg',
          ),
          _Elements(),
        ],
      ),
    );
  }
}

class _Elements extends StatelessWidget {
  const _Elements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FadeInRight(
            duration: const Duration(seconds: 3),
            child: const LogoAuth(),
          ),
          _Form(),
          const SizedBox(
            height: 50,
          ),
          const LabelsAuth(
            route: '/forgot',
            textLabel: '¿Olvidaste tu Contraseña?',
          ),
        ],
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginAuthProvider(),
      child: Builder(builder: (context) {
        final auth = context.watch<LoginAuthProvider>();
        return Center(
          child: Container(
            height: 350,
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                FormCustomWidget(
                  prefixIcon: const Icon(Icons.person_4_rounded,
                      color: Color(0xff01091D)),
                  hintText: 'Email',
                  controller: controllerEmail,
                  onChanged: (p0) {
                    setState(() {});
                  },
                ),
                FormCustomWidget(
                  prefixIcon: const Icon(Icons.lock, color: Color(0xff01091D)),
                  hintText: 'Password',
                  obscureText: true,
                  controller: controllerPassword,
                  onChanged: (p0) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                CustomButtonWidget(
                  onPressed: () async {
                    final loginOk = await auth.signUp(
                      email: controllerEmail.text,
                      password: controllerPassword.text,
                    );

                    if (context.mounted) {
                      if (loginOk) {
                        context.go('/home');
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: SnackbarCustomWidget(),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                      }
                    }
                  },
                  child: const Center(
                      child: Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      }),
    );
  }
}

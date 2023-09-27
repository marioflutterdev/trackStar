import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:trackstar_web/src/presentation/screens/auth/widgets/widgets.dart';

import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackGroundAuth(),
          Center(child: _Elements()),
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
    //final auth = Provider.of<AuthService>(context);
    //final focus = FocusScope.of(context);
    return Center(
      child: Container(
        height: 350,
        width: 400,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
              prefixIcon:
                  const Icon(Icons.person_4_rounded, color: Color(0xff01091D)),
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
              onPressed: () {
                //todo fincionalidad con el back end
                if (context.mounted) {
                  Navigator.popAndPushNamed(context, '/home');
                }
              },
              child: const Center(
                  child: Text(
                'Iniciar sesión',
                style: TextStyle(fontSize: 20),
              )),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

/* 
onPressed: auth.autenticando
                      ? null
                      : () async {
                          final loginOk = await auth.login(
                            controllerEmail.text.trim(),
                            controllerPassword.text.trim(),
                          );
                          focus.unfocus();
                          if (context.mounted) {
                            if (loginOk == true) {
                              Navigator.popAndPushNamed(context, 'user');
                            } else {
                              alertSnakbar(context, Text(loginOk));
                            }

                            auth.autenticando = false;
                          }
                        },
                  child: auth.autenticando
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                          ),
                        )
                      : const Center(
                          child: Text(
                            'Ingresar',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ), */

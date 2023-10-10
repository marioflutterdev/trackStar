import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trackstar_web/src/data/datasource/auth/reset_password.dart';
import 'package:trackstar_web/src/presentation/screens/auth/widgets/widgets.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

class ForgotPassawordScreen extends StatelessWidget {
  const ForgotPassawordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackGroundAuth(
            svgRoute: 'assets/svg/forgot.svg',
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
            route: '/login',
            textLabel: '¿Quieres Iniciar Sesión?',
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResetPasswordProvider(),
      child: Builder(builder: (context) {
        final reset = context.watch<ResetPasswordProvider>();
        return Center(
          child: Container(
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Recuperar Contraseña',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  FormCustomWidget(
                    prefixIcon: const Icon(Icons.person_4_rounded,
                        color: Color(0xff01091D)),
                    hintText: 'Email',
                    controller: controllerEmail,
                    validator: (value) {
                      const pattern =
                          r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                      final regex = RegExp(pattern);
                      if (value!.isEmpty || !regex.hasMatch(value)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: SnackbarCustomWidget(
                              sudErroloText: 'Esto no parece un correo',
                              color: Colors.orangeAccent,
                              svg: 'assets/svg/mail.svg',
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                        return '';
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButtonWidget(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final resetOk = await reset.resetPassword(
                          email: controllerEmail.text,
                        );

                        if (context.mounted) {
                          if (resetOk) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: SnackbarCustomWidget(
                                  color: Colors.green,
                                  erroText: '¡Enviado!',
                                  sudErroloText:
                                      'Su correo fue enviado exitosamente',
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                context.go('/login');
                              },
                            );
                            controllerEmail.clear();
                          } else {
                            print('no.........................');
                          }
                        }
                      }
                    },
                    child: const Center(
                        child: Text(
                      'Enviar',
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
          ),
        );
      }),
    );
  }
}

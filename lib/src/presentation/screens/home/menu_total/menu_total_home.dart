import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:trackstar_web/src/data/data.dart';
import 'package:trackstar_web/src/presentation/widgets/widgets.dart';

import '../../../../config/config.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../provider/providers.dart';
import '../../screens.dart';

class MenuTotalHome extends StatelessWidget {
  const MenuTotalHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movile = AppResponsive.isLargeMobile(context);
    final providerTheme = context.watch<ThemeProvider>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(
          movile ? 15 : 100, movile ? 15 : 15, 15, movile ? 15 : 50),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          _ButtonMenu(
            movile: movile,
            providerTheme: providerTheme,
          ),
          const _CategoriesView()
        ],
      ),
    );
  }
}

class _CategoriesView extends StatelessWidget {
  const _CategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: PageView(
          controller: menuController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const UserScreen(),
            const ProductsScreen(),
            const CenterDistribucionScreen(),
            const CartScreen(),
            const SolicitudesScreen(),
            const NotificationsScreen(),
            InventarioScreen(inventory: menuController.inventory),
            const EntradasSalidasScreen(),
          ],
        ),
      ),
    );
  }
}

class _ButtonMenu extends StatelessWidget {
  const _ButtonMenu({
    super.key,
    required this.movile,
    required this.providerTheme,
  });

  final bool movile;
  final ThemeProvider providerTheme;

  @override
  Widget build(BuildContext context) {
    final menuController = context.watch<NavegacionDrawerProvider>();
    final nameCategoria = context.watch<NavegacionDrawerProvider>();
    return Row(
      children: [
        Visibility(
          visible: menuController.paginaActual == 6 ||
                  menuController.paginaActual == 7
              ? true
              : false,
          child: ButtonWidget(
            icon: Icons.arrow_back_ios_new_outlined,
            onTap: () {
              menuController.paginaActual = 2;
            },
          ),
        ),
        if (movile) const OpenDrawer(),
        if (!movile)
          const SizedBox(
            width: 15,
          ),
        Expanded(
            child: !movile
                ? Center(
                    child: Text(
                      nameCategoria.nombreCategoria,
                      style: const TextStyle(fontSize: 60),
                    ),
                  )
                : const SizedBox()),
        Visibility(
          visible: menuController.paginaActual == 1 ? true : false,
          child: const SearchProduct(),
        ),
        ButtonWidget(
          icon: providerTheme.themeData == dartMode
              ? Icons.light_mode
              : Icons.dark_mode_outlined,
          onTap: () {
            providerTheme.toggleMode();
          },
        ),
        ButtonWidget(
          icon: Icons.leave_bags_at_home,
          onTap: () => showDialog(
            context: context,
            builder: (context) => YesOrNotWidget(
              title: '¿Deseas cerrar tu sesion?',
              content: 'Estas seguro de cerrar tu sesion',
              onPressed: () {
                context.go('/login');
              },
            ),
          ),
        )
      ],
    );
  }
}

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final nameProduct = context.watch<GetProducts>();
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: 300,
          height: 60,
          child: FormCustomWidget(
            controller: textController,
            hintText: 'Buscar',
            onChanged: (value) {
              if (value.isEmpty) {
                nameProduct.getProducts();
              }
            },
          ),
        ),
        ButtonWidget(
          icon: Icons.search,
          onTap: () {
            nameProduct.searchProducts(textController.text);
          },
        ),
      ],
    );
  }
}

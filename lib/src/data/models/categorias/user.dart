import 'dart:math';

class UserTest {
  final String name;
  final int edad;
  final String genero;
  final String imageUrl;
  final String descripcion;

  UserTest({
    required this.imageUrl,
    required this.name,
    required this.edad,
    required this.genero,
    required this.descripcion,
  });
}

List<UserTest> users = List.generate(20, (index) {
  final randomImageUrl =
      'https://via.placeholder.com/${100 + Random().nextInt(200)}x${100 + Random().nextInt(200)}';
  return UserTest(
    imageUrl: randomImageUrl,
    name: 'Usuario ${index + 1}',
    edad: 18 + Random().nextInt(50),
    genero: Random().nextBool() ? 'Hombre' : 'Mujer',
    descripcion: 'Soy un usuario ficticio.',
  );
});

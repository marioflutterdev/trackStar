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
  const randomImageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSez5Hhwz8qtjcctv1WFL6Td8NVdHUtSw12hw&usqp=CAU';
  return UserTest(
    imageUrl: randomImageUrl,
    name: 'Usuario ${index + 1}',
    edad: 18 + Random().nextInt(50),
    genero: Random().nextBool() ? 'Hombre' : 'Mujer',
    descripcion: 'Soy un usuario ficticio.',
  );
});

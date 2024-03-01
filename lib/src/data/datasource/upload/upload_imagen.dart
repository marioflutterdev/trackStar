import 'package:image_picker/image_picker.dart';
import 'package:supabase/supabase.dart';
import 'dart:math';

import '../../../config/constans/constans.dart';

Future<String> addImage(XFile path) async {
  const supabaseUrl = baseUrl;
  const supabaseKey = apikey;
  final random = Random();
  final randomNumber = random.nextInt(90000) + 10000;
  final supabase = SupabaseClient(supabaseUrl, supabaseKey);
  final imageFile = await path.readAsBytes();
  final name = path.name;

  await supabase.storage
      .from('avatars')
      .uploadBinary('${name}_$randomNumber', imageFile);

  final urlResponse = supabase.storage.from('avatars').getPublicUrl(name);

  return urlResponse;
}

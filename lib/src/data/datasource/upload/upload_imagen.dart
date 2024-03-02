import 'package:image_picker/image_picker.dart';
import 'package:supabase/supabase.dart';

import '../../../config/constans/constans.dart';

Future<String> addImage(XFile path) async {
  const supabaseUrl = baseUrl;
  const supabaseKey = apikey;
  final supabase = SupabaseClient(supabaseUrl, supabaseKey);
  final imageFile = await path.readAsBytes();
  final name = path.name;

  await supabase.storage.from('avatars').uploadBinary(name, imageFile);

  final urlResponse = supabase.storage.from('avatars').getPublicUrl(name);

  return urlResponse;
}

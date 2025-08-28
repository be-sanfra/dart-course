import 'dart:convert';

Map<String, dynamic> parseJson(String content) {
  return jsonDecode(content);
}


// try {
//   return jsonDecode(content);
// } catch (e) {
//   throw FormatException('Contenuto non è un JSON valido');
// }

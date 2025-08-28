import 'read_file.dart';
import 'parse_json.dart';

String processReadFile(String filename) {
  String functionData = "Data in Process Read File";
  try {
    String data = readFile(filename);
    return data;
  } catch (e) {
    print(functionData);
    print('⚠️  Errore in processReadFile: $e');
    rethrow;
  }
}

Map<String, dynamic> processParseJson(String data) {
  String functionData = "Data in Process Parse Json";
  try {
    Map<String, dynamic> json = parseJson(data);
    return json;
  } catch (e) {
    print(functionData);
    print('⚠️  Errore in processParseJson: $e');
    rethrow;
  }
}

// void processFile(String filename) {
//   String functionData = "Data in Process File";
//   try {
//     String data = readFile(filename);
//     Map<String, dynamic> json = parseJson(data);
//     print('✅ JSON parsato correttamente: $json');
//   } catch (e) {
//     print(functionData);
//     print('⚠️  Errore in processFile: $e');
//     rethrow;
//   }
// }

import 'process_file.dart';
import 'dart:io';

void main() {
  try {
    // processFile('bin/correct_data.json');
    String contentFile = processReadFile('bin/correct_data.json');
    Map<String, dynamic> contentJson = processParseJson(contentFile);
    print('✅ JSON parsato correttamente: $contentJson');
  } on FileSystemException catch (e) {
    print('📁 Errore di file: ${e.message}');
  } on FormatException catch (e) {
    print('🧾 Errore di formato JSON: ${e.message}');
  } catch (e) {
    print('❌ Errore sconosciuto: $e');
  }
}

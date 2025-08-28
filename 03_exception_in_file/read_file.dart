import 'dart:io';

String readFile(String filename) {
  // Simuliamo un errore se il file non esiste
  if (!File(filename).existsSync()) {
    throw FileSystemException('File non trovato', filename);
  }

  // In un caso reale, leggeremmo il contenuto
  return File(filename).readAsStringSync();
}

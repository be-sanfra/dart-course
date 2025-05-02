library input;

/*
  Libreria dedicata alla gestione dell'input da tastiera.

  Contiene metodi per la lettura di valori inseriti dall’utente,
  tra cui stringhe, numeri interi e numeri decimali (double).
*/

import 'dart:io';

/*
Funzione per leggere una stringa da tastiera
*/
String? inputString() => stdin.readLineSync();

/*
Funzione per leggere un intero da tastiera
*/
int? inputInt() => int.parse(stdin.readLineSync()!);

/*
Funzione per leggere un double da tastiera
*/
double? inputDouble() => double.parse(stdin.readLineSync()!);

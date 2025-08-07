library input;

/*
  Libreria dedicata alla gestione dell'input da tastiera.

  Contiene funzioni dedicate alla lettura dei valori inseriti da tastiera dall’utente.
  Le funzioni di input da tasiera sono dedicate a stringhe, numeri interi e numeri decimali (double).
*/

import 'dart:io';

/*
Costante privata _EXCEPTION.
Indicatore per il limite di ripetizioni consentite all'utente nell'inserimento di dati da tastiera.
 */
const int _EXCEPTION = 10;

/*
Funzione per leggere una stringa da tastiera.
Nel caso in cui la stringa fosse nulla
la funzione domanderà nuovamente all'utente di inserire i dati da tasitera.
Se i dati inseriti saranno errati più di 10 volte il valore di ritorno sarà una stringa vuota.
 */
String inputString() {
  int ERR = 0;

  while (ERR < _EXCEPTION) {
    String? str = stdin.readLineSync();
    if (str != null) {
      return str;
    }
    ERR++;
    _error();
  }

  return "";
}


/*
Funzione per leggere un intero da tastiera.
Nel caso in cui la stringa fosse nulla o non abbia caratteri decimali
la funzione domanderà nuovamente all'utente di inserire i dati da tasitera.
Se i dati inseriti saranno errati più di 10 volte il valore di ritorno sarà 0.
*/
int inputInt() {
  int ERR = 0;

  while (ERR < _EXCEPTION) {
    String? str = stdin.readLineSync();
    if (str != null && _verificaCaratteriInteri(str)) {
      return int.parse(str);
    }
    ERR++;
    _error();
  }

  return 0;
}


/*
Funzione per leggere un double da tastiera.
Nel caso in cui la stringa fosse nulla o non abbia caratteri in virgola mobile
la funzione domanderà nuovamente all'utente di inserire i dati da tasitera.
Se i dati inseriti saranno errati più di 10 volte il valore di ritorno sarà 0.0.
*/
double inputDouble() {
  int ERR = 0;

  while (ERR < _EXCEPTION) {
    String? str = stdin.readLineSync();
    if (str != null && _verificaCaratteriDouble(str)) {
      return double.parse(str);
    }
    ERR++;
    _error();
  }

  return 0.0;
}

/*
 * Funzione privata (realizzata con chatGPT) per verificare se una stringa rappresenta un numero intero valido.
 * Restituisce true solo se la stringa contiene esclusivamente cifre decimali come:
 * es. "123", "-45", "0"
 *
 * L'espressione regolare usata è:
 * - ^     : inizio della stringa
 * - -?    : presenza opzionale di un segno meno
 * - \d+   : una o più cifre decimali (0-9)
 * - $     : fine della stringa
 */
bool _verificaCaratteriInteri(String str) {
  return RegExp(r'^-?\d+$').hasMatch(str);
}

/*
 * Funzione privata (realizzata con chatGPT) per verificare se una stringa rappresenta un numero decimale (double) valido.
 * Restituisce true se la stringa contiene esclusivamente cifre in virgola mobile come:
 *
 * - Numeri interi:       "123", "-456"
 * - Numeri con punto:    "123.45", "-0.78"
 * - Valori senza cifra prima del punto: ".5", "-.9"
 * - Valori senza cifra dopo il punto:   "5.", "-2."
 *
 * NON accetta input incompleti o non validi come:
 * - Solo punto:          "."
 * - Solo segno meno:     "-"
 * - Stringa vuota:       ""
 *
 * Dettaglio della regex: ^-?(\d+(\.\d*)?|\.\d+)$
 * - ^           : inizio della stringa
 * - -?          : segno meno opzionale
 * - \d+         : una o più cifre (obbligatorie nel primo caso)
 * - (\.\d*)?    : punto con cifre opzionali dopo (es. "123." o "123.45")
 * - |\.\d+      : oppure, punto seguito da almeno una cifra (es. ".5")
 * - $           : fine della stringa
 */
bool _verificaCaratteriDouble(String str) {
  return RegExp(r'^-?(\d+(\.\d*)?|\.\d+)$').hasMatch(str);
}

/*
Funzione privata per avvisare l'utente che il dato inserito da tastiera non è accettato.
 */
void _error() => print("[!valore non accettato!]");

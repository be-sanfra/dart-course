/*
 * Libreria 'function_autori' dedicata alle funzioni
 * utilizzate esclusivamente per l'attributo autore della classe libro
 */
library function_autori;

/*
Funzione privata per verificare se una lista di autori non sia vuota.
- Restituisce 'true' se la lista non è vuota
- Restituisce 'false' se la lista è vuota
 */
bool _esiste(List<String> autori) {
  return autori.isNotEmpty;
}

/*
Funzione pubblica dedicata all'ordinamento alfabetico della lista 'autori'.
Ordina alfabeticamente (dalla A alla Z) tutti gli autori presenti in lista
 */
List<String> ordinaAutori(List<String> autori) {
  if (_esiste(autori)) {
    for (int i = 0; i < autori.length - 1; i++) {
      //si ferma a due celle prima dalla fine
      for (int j = i + 1; j < autori.length; j++) {
        //si ferma a una cella prima dalla fine
        if (autori[i].compareTo(autori[j]) > 0) {
          //compareTo() > 0 se la prima stringa viene dopo la seconda (cioè è “maggiore”)
          String temp;
          temp = autori[j];
          autori[j] = autori[i];
          autori[i] = temp;
        }
      }
    }
  }
  return autori;
}

/*
 * Variabile globale dedicata alla collezione degli autori duplicati in una singola lista
 */
List<String>? autoriDuplicati;

/*
 * Funzione privata per l'aggiornamento della varibile 'autoriDuplicati'
 */
void _autoreDuplicato(String autore) {
  autoriDuplicati?.add(autore);
}

/*
 * Funzione pubblica per il controllo di duplicati all'interno della lista 'autori'
 */
bool verifaDuplicati(List<String> autori) {
  if (_esiste(autori)) {
    autoriDuplicati = [];
    for (int i = 0; i < autori.length - 1; i++) {
      for (int j = i + 1; j < autori.length; j++) {
        if (autori[i] == autori[j]) {
          _autoreDuplicato(autori[i]);
          return true;
        }
      }
    }
  }
  return false;
}


/*
 * Funzione per controllare la corretta dicitura del nome dell'autore
 */
bool verificaNome(String autore) {
  if (!verificaCaratteri(autore)) {
    _avvisa(autore,
        "non è stato inserito correttamente! (solo lettere e uno spazio)");
    return true;
  }

  if (!autore.contains(" ")) {
    _avvisa(autore,
        "non è stato inserito correttamente! (inserire 'nome cognome')");
    return true;
  }

  List<String> divisore = autore.split(" ");
  if (divisore[0].length < 3 || divisore[1].length < 3) {
    _avvisa(autore,
        "non è stato inserito correttamente! (nome/cognome troppo corto)");
    return true;
  }

  return false;
}

/*
Funzione privata per inviare all'utente messassi d'avviso
 */
void _avvisa(String value, String msg) {
  print("\n$value $msg");
}

/*
 * Funzione pubblica (realizzata con chatGPT) per verificare se una stringa contiene solo caratteri alfabetici e spazi.
 *
 * Viene usata un'espressione regolare tramite la classe RegExp di Dart.
 *
 * - RegExp(r'^[A-Za-z ]+$') crea un pattern che rappresenta:
 *     ^         → inizio della stringa
 *     [A-Za-z ] → solo lettere maiuscole (A-Z), minuscole (a-z) e spazi
 *     +         → uno o più di questi caratteri
 *     $         → fine della stringa
 *
 * - hasMatch(str) è un metodo che controlla se la stringa 'str' corrisponde
 *   completamente al pattern definito.
 *
 * Restituisce true se tutta la stringa rispetta le regole,
 * altrimenti false.
 *
 */
bool verificaCaratteri(String str) {
  return RegExp(r"^[A-Za-z ]+$").hasMatch(str);
}




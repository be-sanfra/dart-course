import "libro.dart";
import 'input.dart';
import 'function_autori.dart';

/*
Indice costante privato. Riferimento al numero massimo di autori registrabili su un solo libro
 */
const int _MAX_AUTORI = 5;

/*
 Lista privata generale dei libri (o del singolo libro)
*/
List<Libro> _libri = [];

/*
 Indice privato per avere segno dell'ultimo libro inserito
*/
int _libroCorrente = -1;

/*
 Funzione pubblica per avviare e utilizzare il gestionale dedicato ai libri
*/
void usaLibro() {
  _avviaMenuScelta();
}

/*
 Funzione privata per avviare il menù a scelta dedicato all'utilizzo del gestionale
*/
void _avviaMenuScelta() {
  int scelta = 0;
  do {
    _watchMenu();
    scelta = inputInt();
    switch (scelta) {
      case 1:
        _creaLibroSenzaAutori();
        break;
      case 2:
        _creaLibroConAutori();
        break;
      case 3:
        _mostraTitoloLibro();
        break;
      case 4:
        _mostraPrezzoLibro();
        break;
      case 5:
        _mostraAutoriLibro();
        break;
      case 6:
        _aggiungiAutore();
        break;
      case 7:
        _rimuoviAutore();
        break;
      case 8:
        _cercaAutore();
        break;
      case 9:
        _confrontaAutori();
        break;
      case 10:
        _mostraLibro();
        break;
      case 0:
        print("\nUscita dal programma avvenuta con successo!");
        break;
      default:
        print("\nl'opzione $scelta non è disponibile...");
    }
  } while (scelta != 0);
}

/*
 Funzione privata di controllo per verificare che almeno un libro sia stato creato.
*/
bool _verificaPresenzaLibro() {
  if (_libri.isEmpty || _libroCorrente == -1) {
    print(
        "\n⚠️ Nessun libro disponibile. Crea prima un libro per usare questa funzione.");
    return false;
  }
  return true;
}

/*
 Funzione privata per stampare a video le funzioni utilizzabili con la classe libro
*/
void _watchMenu() {
  print('''\n===== CREA LIBRO =====
PREMI [1] Crea libro (senza autori)
PREMI [2] Crea libro (con autori)
\n===== MOSTRA LIBRO =====
PREMI [3] Mostra titolo
PREMI [4] Mostra prezzo
PREMI [5] Mostra autori
\n===== USA LIBRO =====
PREMI [6] Aggiungi autore
PREMI [7] Rimuovi autore
PREMI [8] Cerca autore
PREMI [9] Autori in comune
PREMI [10] Info libro
\n===== USCITA =====
PREMI [0] Esci
======================
''');

  print("Scegli un'opzione:");
}

/*
 Funzione privata per creare un libro con solo titolo e prezzo (senza autori)
*/
void _creaLibroSenzaAutori() {
  _libroCorrente++;

  print("\n===== CREA LIBRO =====");

  print("\nInserire il titolo del libro:");
  String titolo = inputString();

  print("\nInserire il prezzo del libro:");
  double prezzo = inputDouble();

  Libro nuovoLibro = Libro(titolo: titolo, prezzo: prezzo);
  _libri.add(nuovoLibro);

  print("\n✅ Libro '${_libri[_libroCorrente].titolo}' creato con successo!");
}

/*
 Funzione privata per creare un libro completo di titolo, autori e prezzo
*/
void _creaLibroConAutori() {
  _libroCorrente++;

  print("\n===== CREA LIBRO =====");

  print("\nInserire il titolo del libro:");
  String titolo = inputString();

  List<String> autori = [];
  print('''
\nInserire gli autori del libro nel formato "Nome Cognome".
[!] Premi INVIO senza scrivere nulla per terminare l'inserimento.
''');

  while (autori.length < _MAX_AUTORI) {
    print("Autore ${autori.length + 1}:");
    String autore = inputString();

    if (autore.isEmpty) {
      break;
    }

    if (!verificaNome(autore)) {
      autori.add(autore);
    } else {
      print("[!] Inserimento non valido, riprova.");
    }
  }

  print("\nInserire il prezzo del libro:");
  double prezzo = inputDouble();

  Libro nuovoLibro = Libro(titolo: titolo, prezzo: prezzo, autori: autori);
  _libri.add(nuovoLibro);
  _libri[_libroCorrente].block = true;

  print("\n✅ Libro '${_libri[_libroCorrente].titolo}' creato con successo!");
}

/*
 Funzione privata per mostrare il titolo del libro corrente
*/
void _mostraTitoloLibro() {
  if (!_verificaPresenzaLibro()) return;
  print("\n===== MOSTRA LIBRO ====="
      "\nTitolo: ${_libri[_libroCorrente].titolo}");
}

/*
 Funzione privata per mostrare il prezzo del libro corrente
*/
void _mostraPrezzoLibro() {
  if (!_verificaPresenzaLibro()) return;
  print("\n===== MOSTRA LIBRO ====="
      "\nPrezzo: €${_libri[_libroCorrente].prezzo}");
}

/*
 Funzione privata per mostrare la lista degli autori del libro corrente
*/
void _mostraAutoriLibro() {
  if (!_verificaPresenzaLibro()) return;
  print("\n===== MOSTRA LIBRO ====="
      "\nAutori: ${_libri[_libroCorrente].autori}");
}

/*
 Funzione privata per aggiungere un autore al libro corrente
*/
void _aggiungiAutore() {
  if (!_verificaPresenzaLibro()) return;
  print("\n===== USA LIBRO ====="
      "\nInserire l'autore che si vuole aggiungere a '${_libri[_libroCorrente].titolo}'");

  String autore = inputString();

  if (!verificaNome(autore)) {
    _libri[_libroCorrente].aggiungiAutore(autore);
  }
}

/*
 Funzione privata per rimuovere un autore dal libro corrente
*/
void _rimuoviAutore() {
  if (!_verificaPresenzaLibro()) return;
  print("\n===== USA LIBRO ====="
      "\nInserire l'autore che si vuole rimuovere da '${_libri[_libroCorrente].titolo}'");

  String autore = inputString();

  if (!verificaNome(autore)) {
    _libri[_libroCorrente].rimuoviAutore(autore);
  }
}

/*
 Funzione privata per cercare un autore nella lista degli autori del libro corrente
*/
void _cercaAutore() {
  if (!_verificaPresenzaLibro()) return;
  print("\n===== USA LIBRO ====="
      "\nInserire l'autore che si vuole cercare in '${_libri[_libroCorrente].titolo}'");

  String autore = inputString();

  if (!verificaNome(autore)) {
    _libri[_libroCorrente].cercaAutore(autore);
  }
}

/*
 Funzione privata per confrontare gli autori del libro corrente con quelli degli altri libri
*/
void _confrontaAutori() {
  if (!_verificaPresenzaLibro()) return;
  print("\n===== USA LIBRO =====\n"
      "${_libri[_libroCorrente].autori}"
      "\nin"
      "\n'${_libri.map((libro) => libro.titolo).join(', ')}'");

  _libri[_libroCorrente].autoriInComune(_libri);
}

/*
 Funzione privata per mostrare tutte le informazioni del libro corrente
*/
void _mostraLibro() {
  if (!_verificaPresenzaLibro()) return;
  _libri[_libroCorrente].infoLibro();
}

//libreria libro
library libro;

import 'function_autori.dart';

class Libro {
  final List<String> _autori;
  final String _titolo;
  final double _prezzo;

  /*
 Attributo booleano per bloccare l'aggiunta di nuovi autori
  nel caso in cui sia stato creato un libro con autori nel costruttore.
 */
  bool _block = false;

  /*
  Metodo costruttore della classe Libro:
  - 'autori' parametro nominale non obbligatorio
  - 'titolo' parametro nominale obbligatorio
  - 'prezzo' parametro nominale obbligatorio
   */
  Libro({
    List<String> autori = const [],
    required String titolo,
    required double prezzo,
  })  : _autori = ordinaAutori(List.from(autori)),
        _titolo = titolo,
        _prezzo = prezzo;

  /*
  Metodo per conoscere il prezzo del libro
   */
  double get prezzo => _prezzo;

  /*
  Metodo per conoscere il titolo del libro
   */
  String get titolo => _titolo;

  /*
  Metodo per conoscere gli autori del libro
   */
  List<String> get autori => _autori;

  /*
  Metodo per attivare/disattivare il blocco sugli autori.
   */
  set block(bool block) => _block = block;

  //bool get block => _block;

  /*
  Metodo per aggiungere un autore alla lista 'autori'
   */
  void aggiungiAutore(String autore) {
    if (_block) {
      print("Non è possibile aggiungere ulteriori autori per $_titolo");
      return;
    }

    if (!(_autori.length >= 5)) {
      _autori.add(autore);

      ordinaAutori(_autori);

      print("\nAutore $autore aggiunto con successo!");
      autori;

      if (verifaDuplicati(_autori)) {
        print("\nCi sono autori duplicati $autoriDuplicati"
            "\nRimuovi un autore se è stato duplicato per errore");
      }
    } else {
      print(
          "\nHai raggionto il limite massimo di autori possibili in un solo libro"
          "\nRimuovi un autore per aggiungerne un altro");
    }
  }

  /*
   Metodo per rimuovere un autore alla lista 'autori'
  */
  void rimuoviAutore(String autore) {
    bool isPresent = false;

    for (int i = 0; i < _autori.length; i++) {
      if (autore == _autori[i]) {
        _autori.remove(autore);

        ordinaAutori(_autori);

        print("\nAutore $autore rimosso con successo!");
        autori;

        isPresent = true;
        break;
      }
    }

    if (!isPresent) print("\n$autore non è presente nella lista degli autori");
    //se isPresent è impostato a true vuol dire che non c'è l'autore da rimuovere
  }

  /*
  Metodo per sapere se un autore è presente in lista
   */
  void cercaAutore(String autore) {
    bool isPresent = false;

    for (int i = 0; i < _autori.length; i++) {
      if (autore == _autori[i]) {
        print("\nL'autore $autore è in lista!");

        isPresent = true;
        break;
      }
    }

    if (!isPresent) print("\n$autore non è presente nella lista degli autori");
    //se isPresent è impostato a true vuol dire che non c'è l'autore da rimuovere
  }

  /*
  Metodo per conoscere tutte le informazioni relative ad un singolo libro
   */
  void infoLibro() {
    print("\nInformazioni sul libro $_titolo:"
        "\n- Autori: $_autori,"
        "\n- Titolo: $_titolo,"
        "\n- Prezzo: €$_prezzo");
  }

  /*
   * Metodo per controllare se questo libro ha autori in comune con altri libri forniti in lista.
   * Per ogni autore in comune, stampa in quali libri è presente.
   */
  void autoriInComune(List<Libro> libri) {
    for (int i = 0; i < libri.length; i++) {
      for (String autore in _autori) {
        if (_titolo == libri[i]._titolo) continue;
        if (libri[i]._autori.contains(autore)) {
          print("\nNel libro '$_titolo' l'autore '$autore'"
              " compare anche nel libro '${libri[i]._titolo}'");
        }
      }
    }
  }

//end class libro
}

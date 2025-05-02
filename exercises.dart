library exercises;
/*
  Libreria dedicata alla gestione degli esercizi.

  Ogni funzione rappresenta un esercizio proposto.
  Le istruzioni utilizzate all'interno delle funzioni sono scelte logiche personali.

  Per ogni esercizio esistono possibili soluzioni alternative: le implementazioni qui proposte
  non rappresentano l’unico modo di svolgere i compiti richiesti, ma una tra le varie opzioni possibili.
*/

import 'input.dart';

/*
Traccia:
Scrivi un programma per stampare il tuo nome in Dart.
*/
void primoEsercizio() => print("Emanuele Lisco");





/*
Traccia:
Scrivi un programma per stampare "Ciao, sono “John Doe”" e "Ciao, sono “John Doe”"
utilizzando virgolette singole e doppie.
*/
void secondoEsercizio() {
  int? scelta;

  do {
    print("\nVisualizza la stampa: "
        "\nSenza sequenze di escape -> premi [1]"
        "\nCon sequenze di escape -> premi [2]"
        "\nChiudi -> premi [0]");

    scelta = inputInt();

    if (scelta == 1) {
      print("\n[Senza sequenze di escape]");
      print("Ciao, sono 'John Doe'");
      print('Ciao, sono "John Doe"');
    } else if (scelta == 2) {
      print("\n[Con sequenze di escape]");
      print('Ciao, sono \'John Doe\'');
      print("Ciao, sono \"John Doe\"");
    } else if (scelta! < 0 || scelta > 2) {
      print("\nScelta [$scelta] non accede ad alcuna funzione");
    }
  } while (scelta != 0);
}






/*
Traccia:
Dichiara una costante di tipo int con valore 7.
*/
void terzoEsercizio() {
  const int value = 7;
  print("Valore della costante: " + value.toString());
}






/*
Traccia:
Scrivi un programma in Dart che calcoli l’interesse semplice.
Formula = (p * t * r) / 100
*/
void quartoEsercizio() {
  double? capitale, tempo, interesse; // p: capitale, t: tempo in anni, r: tasso di interesse
  double Function({required double t, required double p, required double r}) calcolaInteresse = ({required p, required t, required r}) => (p * t * r) / 100;

  print("CALCOLA IL TASSO DI INTERESSE:");

  print("Inserire il capitale (p):");
  capitale = inputDouble();
  print("Inserire il tempo in anni (t):");
  tempo = inputDouble();
  print("Inserire il tasso di interesse (r):");
  interesse = inputDouble();

  print("INTERESSE RISULTANTE [${calcolaInteresse(p: capitale!, t: tempo!, r: interesse!).toStringAsFixed(2)}]");
}






/*
Traccia:
Scrivi un programma per stampare il quadrato di un numero utilizzando l’input dell’utente.
*/
void quintoEsercizio() {
  int? n;
  print("Inserisci il valore da elevare al quadrato:");
  n = inputInt();
  print("$n^2 = ${n! * n}");
}






/*
Traccia:
Scrivi un programma per stampare il nome completo a partire da nome e cognome
utilizzando l’input dell’utente.
*/
void sestoEsercizio() {
  String? nome, cognome;

  print("Inserisci il tuo nome:");
  nome = inputString();

  print("Inserisci il tuo cognome:");
  cognome = inputString();

  print("Ciao $nome $cognome!");
}






/*
Traccia:
Scrivi un programma per trovare quoziente e resto di due numeri interi.
*/
void settimoEsercizio() {
  int? a, b;

  do {
    print("Inserisci il dividendo:");
    a = inputInt();

    print("Inserisci il divisore:");
    b = inputInt();

    if (b != 0) {
      print("$a/$b = ${(a! / b!).toStringAsFixed(2)}"
          "\nQuoziente: ${a ~/ b}"
          "\nResto: ${a % b}");
    } else {
      print("Non è possibile dividere per 0");
    }
  } while (b == 0);
}






/*
Traccia:
Scrivi un programma per scambiare due numeri.
*/
void ottavoEsercizio() {
  print("Inserisci il primo numero da scambiare (a):");
  int? a = inputInt();
  print("Inserisci il secondo numero da scambiare (b):");
  int? b = inputInt();

  print("Valori prima dello scambio:"
      "\na = $a"
      "\nb = $b");

  {
    int? temp = a;
    a = b;
    b = temp;
  }

  print("Valori dopo lo scambio:"
      "\na = $a"
      "\nb = $b");
}






/*
Traccia:
Scrivi un programma in Dart per rimuovere tutti gli spazi bianchi da una stringa.
*/
void nonoEsercizio() => print("Stringa con spaziatura: 'hello world!'"
        "\nStringa senza spaziatura: '${'hello world!'.replaceAll(' ', '')}'"
  );






/*
Traccia:
Scrivi un programma in Dart per convertire una stringa in un intero.
*/
void decimoEsercizio() {
String str = "883";
print("Stringa str = $str type: ${str.runtimeType}"
      "\nStringa str convertita = ${int.parse(str)} type: ${int.parse(str).runtimeType}"
);
}






/*
Traccia:
Supponi di andare spesso al ristorante con amici e di dover dividere il conto.
Scrivi un programma per calcolare la quota da pagare.
Formula = (importo totale del conto) / numero di persone
*/
void undicesimoEsercizio() {

  print("Inserire l'importo totale del conto:");
  double? conto = inputDouble();

  print("Per quante persone il conto deve essere diviso?");
  int? n = inputInt();

  print("Importo totale del conto: €$conto"
        "\nNumero di persone: $n"
        "\nOgni persona dovrà pagare: €${(conto!/n!).toStringAsFixed(2)}");
}






/*
Traccia:
Supponi che la distanza tra casa e ufficio sia di 25 km e che tu viaggi a 40 km/h.
Scrivi un programma per calcolare il tempo impiegato per arrivare in ufficio in minuti.
Formula = (distanza) / (velocità)
*/
void dodicesimoEsercizio() => print("Il tempo impiegato per andare in ufficio, partendo da casa è ${(25/40)*60} min");

/*
L'esercizio può essere svolto direttamente in un'unica istruzione.
Natruralmente avremmo potuto utilizzare delle variabili per memorizzare i rispettivi dati
int l = 25, v = 40 -> l : lunghezza; v : velocità
double t = l/v -> t : tempo espesso in ore
t *= 60 -> tempo espresso in minuti
 */


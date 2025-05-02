import 'exercises.dart';
import 'input.dart';

void main() {
  int? scelta;

  do {
    menu();
    scelta = inputInt();
    switch(scelta){
      case 0:
        print("Uscita dal programma in corso...");
      case 1:
        primoEsercizio();
      case 2:
        secondoEsercizio();
      case 3:
        terzoEsercizio();
      case 4:
        quartoEsercizio();
      case 5:
        quintoEsercizio();
      case 6:
        sestoEsercizio();
      case 7:
        settimoEsercizio();
      case 8:
        ottavoEsercizio();
      case 9:
        nonoEsercizio();
      case 10:
        decimoEsercizio();
      case 11:
        undicesimoEsercizio();
      case 12:
        dodicesimoEsercizio();
      default:
        print("Scelta non valida");
    }
  } while (scelta != 0);
}



void menu() => print("\nSeleziona un programma da avviare"
    "\n- Digita [1] per avviare il primo programma"
    "\n- Digita [2] per avviare il secondo programma"
    "\n- Digita [3] per avviare il terzo programma"
    "\n- Digita [4] per avviare il quarto programma"
    "\n- Digita [5] per avviare il quinto programma"
    "\n- Digita [6] per avviare il sesto programma"
    "\n- Digita [7] per avviare il settimo programma"
    "\n- Digita [8] per avviare l'ottavo programma"
    "\n- Digita [9] per avviare il nono programma"
    "\n- Digita [10] per avviare il decimo programma"
    "\n- Digita [11] per avviare l'undicesimo programma"
    "\n- Digita [12] per avviare il dodicesimo programma"
    "\n- Digita [0] per chiudere il programma"
);

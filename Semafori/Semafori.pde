void setup() {
  String[] inputFraFil = loadStrings("input.txt"); 

  String linje1        = inputFraFil[0];
  String[] talLinje1   = linje1.split(" ");
  int L                = Integer.parseInt(talLinje1[1]);  // vi henter længden af vejen, som er angivet på plads 2 i input-filen
  int N                = Integer.parseInt(talLinje1[0]);  // vi henter antallet af trafiklys, som angivet på plads 1 i input-filen

  TrafikLys[] listeLys = new TrafikLys[N];                // vi laver et array af trafiklys! Her skal alle trafiklysene indsættes i

  for (int i=1; i<inputFraFil.length; i++  ) {                  
    // her et loop hvor vi henter alle linjer fra linje 2 og frem
    // i starter med at være 1 fordi plads "1" er element nummer 2!!
    //data for trafiklys 1
    String[] trafikLys1   = inputFraFil[i].split(" ");        // hver af de efterfølgende linjer er data for de forskellige trafiklys!
    int D1                = Integer.parseInt(trafikLys1[0]);  // første tal på hver linje er D, som er afstanden til lyset
    int R1                = Integer.parseInt(trafikLys1[1]);  // andet tal er R, der er det antal sekunder trafiklyset er rødt
    int G1                = Integer.parseInt(trafikLys1[2]);  // sidste tal er G, der er det antal sekunder trafiklyset er grønt
    TrafikLys t           = new TrafikLys(D1, R1, G1);        // Vi opretter herefter et trafiklys-objekt, der gemmes i variablen t
    listeLys[i-1]         = t;                                // og indsætter t i vores trafiklys-array
  }

  //Dette er udelukkende et test,- der tester om trafiklysene skifter fra rødt til grønt
  for (int tid=0; tid<10; tid++) {
    println("Alle trafiklys:");
    for (int j=0; j<listeLys.length; j++) {
      TrafikLys trafiklys = listeLys[j]; 
      println(" objekt ", trafiklys.D, trafiklys.R, trafiklys.G, "tiden = " +trafiklys.tid, "redOn= " + trafiklys.redOn);
      trafiklys.update();   //hver gang tiden går kalder vi update på hver eneste trafiklys
      //update metoden har ansvaret for at lyset skifter fra rødt til grønt til rødt osv. på de rigtige tidspunkter
    }
  }
}


class Bil {
  int position = 0;
  int tid = 0;

  void update(TrafikLys[] listAfLys) {

    boolean kor = true;

    for (int i = 0; i < listAfLys.length; i++) {
      if (position == listAfLys[i].D && listAfLys[i].redOn) {
        kor = false;
        break;
      }
    }
    
    if(kor){
      position++;
    }
    
  }
  
  
}


//Dette er Trafiklysklassen
class TrafikLys {

  int D, R, G;
  boolean redOn = true;
  int tid = 1;

  TrafikLys(int d, int r, int g) {
    D = d; 
    R = r; 
    G = g;
  }

  void update() {
    tid++;
    if (tid <= R ) {
      redOn = true;
    }
    if (tid > R && tid <= R + G) {
      redOn = false;
    }
    if (tid == R + G) {
      tid = 0;
    }
  }
}

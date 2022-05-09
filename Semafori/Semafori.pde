int L, N;
Bil bil;
TrafikLys[]  listeLys;
void setup() {
  frameRate(1);
  size(500,500);
  
  ellipseMode(CENTER);
  
  String[] inputFraFil = loadStrings("input.txt"); 

  String[] talLinje1   = (inputFraFil[0]).split(" ");
  L                = Integer.parseInt(talLinje1[1]);  // vi henter længden af vejen, som er angivet på plads 2 i input-filen
  N                = Integer.parseInt(talLinje1[0]);  // vi henter antallet af trafiklys, som angivet på plads 1 i input-filen

  listeLys = new TrafikLys[N];                // vi laver et array af trafiklys! Her skal alle trafiklysene indsættes i
  bil      = new Bil();                       //vi laver en bil!

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
}

void draw() {
  clear();
  //Vi opdaterer alle trafiklys
  for (TrafikLys tf : listeLys) {
    tf.update();
  }
  //Vi opdaterer bilens position
  bil.update(listeLys);

  if (bil.position > L) { 
    noLoop();
  } else{
    println(bil.tid, bil.position);
  }
  fill(255);
  rect(bil.position*10,250,30,20);
  
  if(listeLys[0].redOn == true){
    fill(255,0,0);
  } else {
  fill(0,255,0);
  }
  circle(50,100,50);
  
  if(listeLys[1].redOn == true){
    fill(255,0,0);
  } else {
  fill(0,255,0);
  }
  circle(120,100,50);
  
  if(listeLys[2].redOn == true){
    fill(255,0,0);
  } else {
  fill(0,255,0);
  }
  circle(190,100,50);
  
  if(listeLys[3].redOn == true){
    fill(255,0,0);
  } else {
  fill(0,255,0);
  }
  circle(260,100,50);
}

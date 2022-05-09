//Dette er bil-klassen
class Bil{
  
  int tid       = 0;
  int position  = 0;
  
  //når bilens position skal opdateres anvendes denne metode
  void update(TrafikLys[] liste){
    
    boolean kor = true;
    
    for(TrafikLys tf : liste){
      if(position == tf.D && tf.redOn){ //hvis bilen er ved et lyskryds og lyskrydset er rødt så skal den ikke køre
        kor = false;
      }
    }
    
    if(kor){
      position++;  
    }
    
    tid++;
  }
  
}

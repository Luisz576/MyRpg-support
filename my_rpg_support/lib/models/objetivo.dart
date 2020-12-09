class Objetivo{

  String objInfo;
  int objQuant, progresso;

  Objetivo.fromMap(data){
    objInfo = data['obj_info'];
    objQuant = data['obj_quant'];
    progresso = data['progresso'];
  }

  double getProgress(){
    return progresso / objQuant;
  }

}
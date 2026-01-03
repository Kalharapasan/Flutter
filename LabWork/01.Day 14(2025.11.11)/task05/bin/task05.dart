import 'dart:mirrors';

String calculater(int mark){

  if(mark>=75 && mark <=100){
    return "A";
  }else if(mark>=65 && mark <=74){
    return "B";
  }else if(mark>=55 && mark <=64){
    return "C";
  }else if(mark>=40 && mark <= 54){
    return "S";
  }else if(mark >=0 && mark<=39){
    return "Fsill";
  }else{
    return "Invalid Input";
  }
  
}

void main(){
  int mark = 70;
  String grade= calculater(mark);
  print("My Grade is: $grade");

  

}
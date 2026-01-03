class Car{
  String brand="";
  String color="";
  int speed=0;

  void start(){
    print("$brand car is Starting");

  }

  void color_car(){
    print("$color car is Starting ");
  }

}
void main(){
  Car mycar =Car();
  mycar.brand ="Toyota";

  //call the funtion
  mycar.start();

  mycar.color="Red";
  mycar.color_car();



}


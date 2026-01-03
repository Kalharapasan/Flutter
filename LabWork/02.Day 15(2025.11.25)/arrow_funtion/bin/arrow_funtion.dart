void  showInfo(String name,[int age=0,String city='Unkown']){
  print("Name: $name");
  print("age: $age");
  print("City:$city");
}


void main(){
  showInfo("Kalhara");
  print("----------------------------------------------------------------------");
  showInfo("Kalhara",25);
  print("------------------------------------------------------------------------");
  showInfo("Kalhara",25,"Dehiaththakandiya")
}
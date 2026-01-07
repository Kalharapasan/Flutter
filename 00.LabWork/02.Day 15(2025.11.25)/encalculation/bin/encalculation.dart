class Student{
  String _name="";//protected | Private
  int _marks=0;

  //Seter
  void setName(String name){
    _name = name;
  }

  void setMark(int marks){
    _marks=marks;
  }

  //Getter
  String getName(){
    return _name;
  }

  int getMarks(){
    return _marks;
  }

}

void main(){

  Student s1= Student();
  s1.setName("Kalhara");
  String sName = s1.getName();
  print("Student Name is: $sName");

  s1.setMark(78);
  int sMarks = s1.getMarks();
  print("Student Marks is: $sMarks");
}
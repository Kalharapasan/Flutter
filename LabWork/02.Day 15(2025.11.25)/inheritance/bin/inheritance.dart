//parent Class

class Person{
  String name="";
  int age=0;

  void show(){
    print("Person Name is:$name");
    print("Person Age is:$age");
  }
}

//chils class

class Student extends Person{
  String school="";
  void display(){
    print("School:$school");
  }
}

void main(){
  Student s1 = Student();
  s1.name="Kalhara";
  s1.age=25;
  s1.show();
  s1.school="Madhagama";
  s1.display();

}
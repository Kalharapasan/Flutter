class Student{
    String name;
    int age;

  Student(this.name,this.age);//cons

  Student.guest():name="Guest Student",age =0;

  void display(){
    print("Student Name: $name");
    print("Student Age: $age");
  }

}

void main(){
  Student s1 =Student("Kalhara", 25);
  s1.display();

 
}


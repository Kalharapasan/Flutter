// abstract class Employee{
//   void work();//Rule

// }


// class Manager extends Employee{
//   @override
//   void work(){
//     print('Mange the team');
//   }
// }

// class CEO extends Employee{
//   @override
//   void work(){
//     print('Handle the comapny');
//   }
// }

// void main(){
//   Manager m1 =Manager();
//   CEO c1 = CEO();

//   m1.work();
//   c1.work();
// }

//##################################################### LIST ##################################################


// void main(){
//   List <int> valuse =[1,2,3,4,5];
//   print(valuse);

//   print("-------------------------Update list------------------------------");
//   //Update list
//   valuse [1] = 50;
//   print(valuse);

//   //Remove value
//   print("--------------------------Remove Value-------------------------");
//   valuse.remove(50);
//   print(valuse);

//   //Remove Index
//   print("--------------------------Remove Index-------------------------");
//   valuse.removeAt(2);
//   print(valuse); 

//   //Add 1 Item
//   print("--------------------------Add 1 Item-------------------------");
//   valuse.add(30);
//   print(valuse);

//   //Add Multiple items
//   print("--------------------------Add Multiple Item-------------------------");
//   valuse.addAll([5,8,6,9,20,78,1,2,4,5,1,11]);
//   print(valuse);

//   //Length of the list
//   print("--------------------------Length of the list-------------------------");
//   int length = valuse.length;
//   print("Length Of list:$length ");

//   //Shorting A-Z
//   print("--------------------------Shorting A-Z-------------------------");
//   valuse.sort();
//   print(valuse);


// }



//##################################################### MAP ##################################################

void main() {
  Map<String, dynamic> student = {
    'name': 'Kalhara',
    'age': 25,
    'school': 'Madhagama',
    'gpa': 4.00
  };

  print(student);

  //Access the Value
  print("---------------------------------------Access the Value------------------------");
  print(student["name"]);

  //Update the value
  print("----------------------------------------update the Value-------------------------");
  student['gpa'] =3.5;
  print(student);

  //Add new key value pair
  print("---------------------------------------Add new key value-----------------------");
  student['RegNo']='SEU/IS/20/ICT/084';
  print(student);

  //Remove Item
  print("-------------------------------Remove Item--------------------------------------");
  student.remove('gpa');
  print(student);

  //Map Length
  print("-------------------------------Map Length--------------------------------------");
  print(student.length);

  //Looping through the map
  print("-------------------------------Looping through the map--------------------------------------");
  //key
  print("-------------------Print Key in Map---------------------------");
  for(var key in student.keys){
    print(key);
  }

  print("-----------------------print value ----------------------------");
  for(var value in student.values){
    print(value);
  }

  print("-------------------------Peinr Key and Value-------------------");
  student.forEach((key,value){
    print("$key:$value");
  });


}
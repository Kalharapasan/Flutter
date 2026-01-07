class Animal{
  void makeSound(){
    print("Animal Sound");
  }
}

class Dog extends Animal{
  @override
  void makeSound(){
    print("Dog Bark");
  }
}

void main(){
  Animal a1= Animal();
  Dog d1 =Dog();

  a1.makeSound();
  d1.makeSound();
}
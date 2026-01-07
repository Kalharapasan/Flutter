void main(){
  int i =0;
  while(i<50){
    if(i%4==0){
      print("$i can divide by 4");
    }
    i++;
  }

  print("__________________________________________________________________________________________");

  int num=0;
  while(num<100){
    if(num%3==0 || num%5==0){
      print("Number Can divide by 3 and 5: $num");
    }
    num ++;
  }


}
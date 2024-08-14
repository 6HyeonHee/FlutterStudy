void main(){
  int num1 = 1;
  double num2 = 2.1;
  String name = "홍길동";

  // 이 함수는 정수만 인수로 전달할 수 있다.
  myFunction1(num1);       // 가능
  // myFunction1(num2);    // 에러

  // 정수, 실수 모두 전달 가능
  myFunction2(num1);       // 가능 : num은 int, double의 supertype
  myFunction2(num2);       // 가능

  // 정수, 실수, 문자열 전달 가능
  myFunction3(num1);       // 가능 : dynamic은 자바에서 Object 같은..
  myFunction3(num2);       // 가능
  myFunction3(name);       // 가능
}

myFunction1(int val){
  print("func1 : $val");
}
myFunction2(num val){
  print("func2 : $val");
}
myFunction3(dynamic val){
  print("func3 : $val");
}
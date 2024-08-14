void main(){
  int num1 = 1;
  print('num1 : $num1');

  double num2 = 2.0;
  print('num2-1 : $num2');

  double num3 = 2.1;
  print('num2-2 : $num3');

  /*
   Java의 경우 double보다 int가 작은 자료형이므로 아래의 경우
   자동형변환이 되어 에러가 발생하지 않는다.
   하지만 Dart에서는 모든 변수를 객첼 인식하므로 명시적 형변환을 해야한다.
  */
  // num3 = num1              // 오토캐스팅 안된다.(에러발생)
  num3 = num1.toDouble();     // 명시적 형변환 필요
  print('num3 : $num3');

  num2 = 2.6;
  num1 = num2.toInt();        // 소수점 이하 절사
  print('num1 : $num1');

  // 플러터에서 사용되는 변수는 모두가 객체이다.
  // 자바의 래퍼 클래스처럼 형변환을 위한 메서드를 가지고 있다
}
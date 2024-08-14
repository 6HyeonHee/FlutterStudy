void main(){
  int num1 = 5;
  int num2 = 2;

  print('더하기 ${num1 + num2}');
  print('뺴기 ${num1 - num2}');
  print('곱하기 ${num1 * num2}');
  /* Dart에서는 dynamic형이 있으므로 정수끼리 연산에 실수의
    결과가 나올 수 있다. 따라서 몫을 구하는 연산자가 추가되었다.*/
  print('나누기 ${num1 / num2}');
  print('몫 ${num1 ~/ num2}');
  print('나머지 ${num1 % num2}');
}
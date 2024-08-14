void main() {
// -------------------------------------------------
// 변수
// -------------------------------------------------
  int num1 = 0; // 자바의 int, long
  double num2 = 1.0; // 자바의 float, double
  num num3 = 1; // int,double의 supertype
  num num4 = 1.0;

  bool bCheck = true; // 큰 따옴표
  String myStr1 = "홍길동"; // 작은 따옴표 둘다 가능
  String myStr2 = "전우치";

  var myVar1 = 1; // 값이 대입될 때 형태를 추론하여 변수형 결정
  var myVar2 = "홍길동";
// var myVar1 = "손오공";   // var는 대입되는 데이터의 타입 변경 불가

  dynamic myVar3 = 2; // 마치 자바의 Object 클래스 같은..
  myVar3 = "전우치"; // dynamic은 대입되는 데이터의 타입 변경 가능

// -------------------------------------------------
// 상수
// -------------------------------------------------
  const myConst1 = 20; // 컴파일시에 결정 : 시작할 때 결정
  const myConst2 = 10; // 동적으로 결정 : 사용될 떄 결정
  final myConst3;
  myConst3 = 30;
}
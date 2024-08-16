class Unit {
  /*
   late : ?를 통해 Nullable로 선언할 수 있지만, late를 통해
          나중에 초기화 된다는 것을 명시한다.
   */
 late String name;
 late int hp;

 /*
  생성자는 아래에서 정의하였으므로 디폴트 생성자는 추가되지 않는다.
  생성자를 정의하지 않은 경우에만 디폴트 생성자가 추가된다.
  */
 
 // 인자생성자 정의
 Unit (String name, int age){
   this.name = name;
   this.hp = hp;
 }
}

void main(){
  // 디폴트 생성자가 없으므로 에러 발생
  // var unit1 = new Unit();  // error

  // 자바와 같은 방식으로 new를 통해 인스턴스 생성 -> Dart에서는 권장하지 않음.
  var unit2 = new Unit("마린", 20);
  // Dart에서는 new를 묵시적으로 선언한것으로 간주함 -> 권장하는 방식
  var unit3 = Unit("메딕", 25);

  /*
   late로 선언하는 경우 인스턴스 생성시 null로 초기화할 수 없다.
   '나중에 null이 아닌 값으로 초기화 된다'라는 의미를 내포한다.
   */
  // var unit4 = Unit("파이어뱃", null);  // error
}
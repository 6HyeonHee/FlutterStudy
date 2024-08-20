// 부모 클래스
class Unit {
  var _health = 10;
  void _makeUnit() {
    print('유닛을 생산');
  }
}

// Unit 클래스를 상속한 자식 클래스
class Marine extends Unit {
  var _attack = 1;
  void _moveAttack() {
    print('이동해서 공격');
  }
}

void main() {
  // 부모 클래스를 통해 인스턴스 생성
  var unit1 = Unit();
  unit1._makeUnit();
  // 상속된 상태가 아니므로 자식 클래스의 멤버는 호출할 수 없음
// unit1._moveAttack();

  // 자식 클래스를 통해 인스턴스 생성
  var unit2 = Marine();
  print('unit2의 타입: ${ unit2.runtimeType }');

  /* 자식 클래스의 인스턴스 변수로 부모의 멤버에 접근할 수 있다.
  Java에서는 private인 경우 직접 접근이 불가능하지만
  Dart에서는 같은 파일(라이브러리)인 경우에 접근이 허용된다. */
  unit2._makeUnit();
  unit2._moveAttack();
  print('체력: ${ unit2._health }');
  print('공격력: ${ unit2._attack }');
}
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter 기본형'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 궁을 표현하는 DTO 클래스
class Palace {
  // 이름
  late final String name;
  // 위경도 표시를 위한 인스턴스 
  late final LatLng position;
  // 생성자
  Palace(this.name, this.position);
}

class _MyHomePageState extends State<MyHomePage> {
  
  Completer<GoogleMapController> _controller = Completer();

  // 지도의 최초 중심 좌표
  LatLng _myLoc = LatLng(37.57979551550774, 126.97706246296076);
  // 마커와 폴리라인의 좌표값을 저장할 리스트
  List<Marker> _markers = [];
  List<Polyline> _ploylines = [];
  // 궁에 대한 위치값 저장
  List<Palace> palacees = [
    Palace("경복궁", LatLng(37.57979551550774, 126.97706246296076)),
    Palace("경희궁", LatLng(37.57136511434671, 126.96815224932355)),
    Palace("덕수궁", LatLng(37.565868063366096, 126.97515644898421)),
    Palace("창덕궁", LatLng(37.5796811285638 , 126.99111100341483)),
    Palace("창경궁", LatLng(37.578932311976125, 126.99489126244981)),
  ];

  // 마커에 대한 색깔 지정
  List<double> hue = [
    BitmapDescriptor.hueBlue,
    BitmapDescriptor.hueCyan,
    BitmapDescriptor.hueGreen,
    BitmapDescriptor.hueMagenta,
    BitmapDescriptor.hueRed,
  ];

  // 궁의 갯수만큼 마커 객체 생성
  void makeMarkerData() {
    int i = 0;
    for (Palace palace in palacees) {
      final marker = Marker(
        markerId: MarkerId(palace.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(hue[i]),
        position: palace.position,
        infoWindow: InfoWindow(
          title: palace.name,
          // snippet: "",
          onTap: () {
            print('onTap: ${palace.name}');
          }
        ),
      );
      _markers.add(marker);
      i++;
    }
  }

  // 폴리 라인 표시
  void makePolyline() {
    List<LatLng> coordinates = [];
    for(int i=0; i<palacees.length; i++) {
      coordinates.add(LatLng(palacees[i].position.latitude,
                          palacees[i].position.longitude));
    }

    // 폴리라인 속성
    Polyline polyline = Polyline(
      polylineId: PolylineId("poly"),
      patterns: [PatternItem.dash(10), PatternItem.gap(10)],
      color: Colors.red,
      width: 3,
      points: coordinates
    ); 
    /* 앞에서 5개의 궁의 위치를 저장한 List를 points 프로퍼티에 설정 */

    // 폴리라인 추가
    _ploylines.add(polyline);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    makeMarkerData();
    makePolyline();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(target: _myLoc, zoom: 14.0),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers:  Set.from(_markers),
                polylines: Set.from(_ploylines),
                
              ),
            )
          ]
        ),
      ),
    );
  }
}



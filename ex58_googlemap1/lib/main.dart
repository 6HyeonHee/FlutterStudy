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
      home: const MyHomePage(title: 'Google Maps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 맵 컨트롤러
  Completer<GoogleMapController> _controller = Completer();
  LatLng _myLoc1 = LatLng(37.57979551550774, 126.97706246296076);     // 경복궁
  LatLng _myLoc2 = LatLng(37.578932311976125, 126.99489126244981);    // 창경궁
  LatLng _myLoc3 = LatLng(37.5691, 126.9845);                         // 더조은IT학원

  // 여러 개의 마커를 저장할 리스트 정의
  List<Marker> _markers = [];

  void setMarkerData() {
    final marker1 = Marker(
      markerId: MarkerId('A01'),
      // 위 경도를 가진 LagLng 인스턴스로 설정
      position: _myLoc1,
      // 풍선 도움말. 마커 클릭 시 상단에 출력됨.
      infoWindow: InfoWindow(
        title: '경복궁',
        snippet: '여기는 경복궁입니다.',
        onTap: () {
          print('경복궁');
        }
      ),
    );
    _markers.add(marker1);
    
    final marker2 = Marker(
      markerId: MarkerId('A02'),
      position: _myLoc2,
      infoWindow: InfoWindow(
        title: '창경궁',
        snippet: '여기는 창경궁입니다.',
        onTap: () {
          print('창경궁');
        }
      ),
    );
    _markers.add(marker2);


    final marker3 = Marker(
      markerId: MarkerId('A03'),
      position: _myLoc3,
      infoWindow: InfoWindow(
        title: '더조은 컴퓨터 아카데미',
        snippet: '더조은 컴퓨터 별관',
        onTap: () {
          print('더조은');
        }
      ),
    );
    _markers.add(marker3);
  }

  @override
  void initState() {
    super.initState();
    // 최초 앱 실행시 마커 생성
    setMarkerData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            // 컨테이너 내부에 구글맵 추가
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _myLoc1,
                zoom: 15.0,
              ),
              markers: Set.from(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => goToLocation(_myLoc1),
                child: const Text(
                  '경복궁 이동',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => goToLocation(_myLoc2),
                child: const Text(
                  '창경궁 이동',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> goToLocation(LatLng loc) async {
    final GoogleMapController controller = await _controller.future;

    final CameraPosition pos = CameraPosition(
      target: loc,
      zoom: 15,
      // 지도 동서남북 회전
      // bearing: 180.0,
      // 지도 눕히기
      // tilt: 60.0,
    );

    // controller.moveCamera(CameraUpdate.newCameraPosition(pos));
    controller.animateCamera(CameraUpdate.newCameraPosition(pos));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harekrishnagoldentemple/NoInternet.dart';
import 'package:harekrishnagoldentemple/SoulfulJapa/SoulfulJapaCC.dart';
import 'package:harekrishnagoldentemple/SoulfulJapa/SoulfulJapaPractice.dart';
import 'package:nb_utils/nb_utils.dart';
import 'SoulfulJapaVideos.dart';
class SFJE extends StatefulWidget {
  const SFJE({super.key});

  @override
  State<SFJE> createState() => _SFJEState();
}

class _SFJEState extends State<SFJE> {

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile) {
        setState(() {});
      } else if (connectivityResult == ConnectivityResult.wifi) {
        setState(() {});
      } else if (connectivityResult == ConnectivityResult.none) {
        setState(() {});
      }
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status',);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(connectivityResult);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus==ConnectivityResult.none ? NoInternet() : Scaffold(
      appBar: AppBar(title: Text("Soulful Japa"), backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(height: 20
          ,),
          InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SFJV()));     },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://storage.ning.com/topology/rest/1.0/file/get/2514979273?profile=original"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Container(
                    height: 89.0,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 160.0, left: 15.0),
                      child: Text(
                        "Modules",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
              20.height,
              InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SFJP()));     },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ytimg.com/vi/MG4Ch4rpR5w/maxresdefault.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Container(
                    height: 89.0,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 160.0, left: 15.0),
                      child: Text(
                        "Practice",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
              20.height,
                        InkWell(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SFJCC()));     },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/2/20/Japa_mala_%28prayer_beads%29_of_Tulasi_wood_with_108_beads_-_20040101-01.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                  child: Container(
                    height: 89.0,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 160.0, left: 15.0),
                      child: Text(
                        "CUE CARDS",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ),
              20.height,
        ]),
      ),
    );
  }
}
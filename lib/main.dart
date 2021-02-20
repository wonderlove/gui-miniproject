import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ble/flutter_ble.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset('assets/logo.png', fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 3),
                child: Text(
                  "LOG",
                    style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                )),
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 292.0,
            width: 502.0,
            child: Column(
              children: <Widget>[
                Text(
                  "placeholder ",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  "placeholder",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                )
              ],
              // children: quotes.map((quote) => QuoteCard(quote: quote)).toList(),
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.white),
                left: BorderSide(width: 1.0, color: Colors.white),
                right: BorderSide(width: 1.0, color: Colors.white),
                bottom: BorderSide(width: 1.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class flutterab extends StatefulWidget {
//   @override
//   _flutterabState createState() => _flutterabState();
// }
//
// class _flutterabState extends State<flutterab> {
//   FlutterBle _flutterBlue = FlutterBle.instance;
//
//   StreamSubscription _scanSubscription;
//   Map<DeviceIdentifier, ScanResult> scanResults = new Map();
//   bool isScanning = false;
//
//   StreamSubscription _stateSubscription;
//   BluetoothState state = BluetoothState.unknown;
//
//   BluetoothDevice device;
//
//   bool get isConnected => (device != null);
//   StreamSubscription deviceConnection;
//   StreamSubscription deviceStateSubscription;
//   List<BluetoothService> services = new List();
//   Map<Guid, StreamSubscription> valueChangedSubscriptions = {};
//   BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;
//
//   @override
//   void initState() {
//     super.initState();
//     // Immediately get the state of FlutterBle
//     _flutterBlue.state.then((s) {
//       setState(() {
//         state = s;
//       });
//     });
//     // Subscribe to state changes
//     _stateSubscription = _flutterBlue.onStateChanged().listen((s) {
//       setState(() {
//         state = s;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _stateSubscription?.cancel();
//     _stateSubscription = null;
//     _scanSubscription?.cancel();
//     _scanSubscription = null;
//     deviceConnection?.cancel();
//     deviceConnection = null;
//     super.dispose();
//   }
//   _startScan() {
//     _scanSubscription = _flutterBlue
//         .scanForScale(timeout: const Duration(seconds: 10 ))
//         .listen((scanResult) {
//       print('localName: ${scanResult.advertisementData.localName}');
//       print(
//           'manufacturerData: ${scanResult.advertisementData.manufacturerData}');
//       print('serviceData: ${scanResult.advertisementData.serviceData}');
//       setState(() {
//         scanResults[scanResult.device.id] = scanResult;
//       });
//     }, onDone: _stopScan);
//
//     setState(() {
//       isScanning = true;
//     });
//   }
//
//   _startScanB() {
//     _scanSubscription = _flutterBlue
//         .scanForBPM(timeout: const Duration(seconds: 5))
//         .listen((scanResult) {
//       print('localName: ${scanResult.advertisementData.localName}');
//       print(
//           'manufacturerData: ${scanResult.advertisementData.manufacturerData}');
//       print('serviceData: ${scanResult.advertisementData.serviceData}');
//       setState(() {
//         scanResults[scanResult.device.id] = scanResult;
//       });
//     }, onDone: _stopScan);
//
//     setState(() {
//       isScanning = true;
//     });
//   }
//
//   _stopScan() {
//     _scanSubscription?.cancel();
//     _scanSubscription = null;
//     setState(() {
//       isScanning = false;
//     });
//   }
//
//   _connect(BluetoothDevice d) async {
//     device = d;
//     // Connect to device
//     deviceConnection = _flutterBlue
//         .connect(device, timeout: const Duration(seconds: 4))
//         .listen(
//       null,
//       onDone: _disconnect,
//     );
//
//     _connect(BluetoothDevice d) async {
//       device = d;
//       // Connect to device
//       deviceConnection = _flutterBlue
//           .connect(device, timeout: const Duration(seconds: 4))
//           .listen(
//         null,
//         onDone: _disconnect,
//       );
//
//       // Update the connection state immediately
//       device.state.then((s) {
//         setState(() {
//           deviceState = s;
//         });
//       });
//
//       // Subscribe to connection changes
//       deviceStateSubscription = device.onStateChanged().listen((s) {
//         setState(() {
//           deviceState = s;
//         });
//         if (s == BluetoothDeviceState.connected) {
//           device.discoverServices().then((s) {
//             setState(() {
//               services = s;
//             });
//           });
//         }
//       });
//     }
//
//     _disconnect() {
//       // Remove all value changed listeners
//       valueChangedSubscriptions.forEach((uuid, sub) => sub.cancel());
//       valueChangedSubscriptions.clear();
//       deviceStateSubscription?.cancel();
//       deviceStateSubscription = null;
//       deviceConnection?.cancel();
//       deviceConnection = null;
//       setState(() {
//         device = null;
//       });
//     }
//
//   //
//   //   Widget build(BuildContext context) {
//   //   return Container();
//   // }
// }

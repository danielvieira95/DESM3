import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Scanner',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BluetoothScreen(),
    );
  }
}

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    // Solicita permissões para Android 12+
    if (await Permission.bluetoothScan.isDenied) {
      await Permission.bluetoothScan.request();
    }
    if (await Permission.bluetoothConnect.isDenied) {
      await Permission.bluetoothConnect.request();
    }
    if (await Permission.locationWhenInUse.isDenied) {
      await Permission.locationWhenInUse.request();
    }
  }

  void startScan() async {
    setState(() {
      isScanning = true;
    });
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    setState(() {
      isScanning = false;
    });
  }

  void stopScan() async {
    await FlutterBluePlus.stopScan();
    setState(() {
      isScanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Bluetooth Scanner'),
        actions: [
          IconButton(
            icon: Icon(isScanning ? Icons.stop : Icons.search),
            onPressed: isScanning ? stopScan : startScan,
          ),
        ],
      ),
      body: StreamBuilder<List<ScanResult>>(
        stream: FlutterBluePlus.scanResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final scanResults = snapshot.data ?? [];
          return ListView.builder(
            itemCount: scanResults.length,
            itemBuilder: (context, index) {
              final result = scanResults[index];
              return ListTile(
                title: Text(result.device.name.isNotEmpty
                    ? result.device.name
                    : 'Dispositivo sem Nome'),
                subtitle: Text(result.device.id.toString()),
                trailing: ElevatedButton(
                  onPressed: () async {
                    try {
                      await result.device.connect();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Conectado ao ${result.device.name}')));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Erro ao conectar ao ${result.device.name}')));
                    }
                  },
                  child: const Text('Conectar'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

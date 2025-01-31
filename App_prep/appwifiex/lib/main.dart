import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WiFiScannerScreen(),
    );
  }
}

class WiFiScannerScreen extends StatefulWidget {
  const WiFiScannerScreen({super.key});

  @override
  State<WiFiScannerScreen> createState() => _WiFiScannerScreenState();
}

class _WiFiScannerScreenState extends State<WiFiScannerScreen> {
  List<WifiNetwork?> networks = [];

  @override
  void initState() {
    super.initState();
    scanNetworks();
  }

  Future<void> scanNetworks() async {
    // Solicitar permissão de localização
    if (await Permission.location.request().isGranted) {
      try {
        final wifiNetworks = await WiFiForIoTPlugin.loadWifiList();
        setState(() {
          networks = wifiNetworks;
        });
      } catch (e) {
        print("Erro ao escanear redes Wi-Fi: $e");
      }
    } else {
      print("Permissão de localização negada.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner de Redes Wi-Fi"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: scanNetworks,
          ),
        ],
      ),
      body: networks.isEmpty
          ? const Center(child: Text("Nenhuma rede encontrada."))
          : ListView.builder(
              itemCount: networks.length,
              itemBuilder: (context, index) {
                final network = networks[index];
                return ListTile(
                  title: Text(network?.ssid ?? "SSID Desconhecido"),
                  subtitle: Text("Sinal: ${network?.level ?? 'N/A'} dBm"),
                );
              },
            ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WiFiInfoScreen(),
    );
  }
}

class WiFiInfoScreen extends StatefulWidget {
  const WiFiInfoScreen({super.key});

  @override
  State<WiFiInfoScreen> createState() => _WiFiInfoScreenState();
}

class _WiFiInfoScreenState extends State<WiFiInfoScreen> {
  String ssid = 'Carregando...';
  String bssid = 'Carregando...';
  String ipAddress = 'Carregando...';

  @override
  void initState() {
    super.initState();
    _getWiFiInfo();
  }

  Future<void> _getWiFiInfo() async {
    final info = NetworkInfo();

    // Obtenha as informações do Wi-Fi
    final wifiName = await info.getWifiName(); // Pode ser nulo
    final wifiBSSID = await info.getWifiBSSID(); // Pode ser nulo
    final wifiIP = await info.getWifiIP(); // Pode ser nulo

    setState(() {
      ssid = wifiName ?? "SSID não disponível";
      bssid = wifiBSSID ?? "BSSID não disponível";
      ipAddress = wifiIP ?? "IP não disponível";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Informações de Wi-Fi"),
      backgroundColor: Colors.red,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SSID: $ssid", style: const TextStyle(fontSize: 16)),
            Text("BSSID: $bssid", style: const TextStyle(fontSize: 16)),
            Text("Endereço IP: $ipAddress",
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WiFiScannerScreen(),
    );
  }
}

class WiFiScannerScreen extends StatefulWidget {
  const WiFiScannerScreen({super.key});

  @override
  State<WiFiScannerScreen> createState() => _WiFiScannerScreenState();
}

class _WiFiScannerScreenState extends State<WiFiScannerScreen> {
  List<WifiNetwork?> availableNetworks = [];
  List<FlSpot> signalSpots = [];
  int time = 0;

  @override
  void initState() {
    super.initState();
    scanForNetworks();
  }

  Future<void> scanForNetworks() async {
    // Lista as redes Wi-Fi disponíveis
    final networks = await WiFiForIoTPlugin.loadWifiList();

    setState(() {
      availableNetworks = networks;

      // Atualiza os dados para o gráfico de linha
      if (availableNetworks.isNotEmpty) {
        final strongestSignal = availableNetworks
            .map((network) => network?.level ?? 0)
            .reduce((value, element) => value > element ? value : element);

        signalSpots.add(FlSpot(time.toDouble(), strongestSignal.toDouble()));
        if (signalSpots.length > 50)
          signalSpots.removeAt(0); // Limita o histórico
        time++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner de Redes Wi-Fi"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: scanForNetworks,
          ),
        ],
      ),
      body: availableNetworks.isEmpty
          ? const Center(child: Text("Nenhuma rede encontrada."))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Intensidade do Sinal Wi-Fi (Melhor Rede)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: signalSpots,
                            isCurved: true,
                            barWidth: 2,
                            color: Colors.blue,
                            belowBarData: BarAreaData(show: false),
                            dotData: FlDotData(show: false),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 10,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) => Text(
                                '${value.toInt()} dBm',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '${value.toInt()}s',
                                  style: const TextStyle(fontSize: 12),
                                );
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          drawHorizontalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: Colors.grey,
                              strokeWidth: 0.5,
                            );
                          },
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Colors.grey,
                              strokeWidth: 0.5,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            tooltipRoundedRadius: 8,
                            tooltipPadding: const EdgeInsets.all(8),
                            tooltipMargin: 8,
                            fitInsideHorizontally: true,
                            fitInsideVertically: true,
                            tooltipBorder:
                                BorderSide(color: Colors.blueAccent, width: 1),
                            getTooltipItems: (touchedSpots) {
                              if (touchedSpots == null) {
                                return [];
                              }
                              return touchedSpots.map((spot) {
                                return LineTooltipItem(
                                  'Tempo: ${spot.x.toStringAsFixed(0)}s\n'
                                  'Sinal: ${spot.y.toStringAsFixed(0)} dBm',
                                  const TextStyle(color: Colors.white),
                                );
                              }).toList();
                            },
                          ),
                          handleBuiltInTouches: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Redes Encontradas: ${availableNetworks.length}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

*/
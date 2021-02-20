part of flutter_ble;

class BleHelpers {

  static bool maybeScaleProtocolV1 (ScanResult scanResult) {
    var data = scanResult.advertisementData.manufacturerData;
    var broadcastData = data.values.first;
    var deviceKind = data.keys.first;
    return (broadcastData.length > 10 ) && validValuesForWeight(broadcastData);
  }

  static bool validValuesForWeight(List<int> values) {
    var w = getWeight(values);
    return w > 0 && w < 255;
  }

  static double getWeight(List<int> values) {
    var wHex = (values.length > 10) ?
      values[8].toRadixString(16).padLeft(2, '0') +
        values[9].toRadixString(16).padLeft(2, '0')
    : "00";
    var w = (int.parse(wHex, radix: 16) / 10);
    return w;
  }

  static String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  static String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return null;
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  static bool maybeParseBPM(ScanResult scanResult) {
    print(scanResult.device.discoverServices());
    return true;
  }
}
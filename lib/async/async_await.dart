class ProcessData {
  final String data;

  ProcessData(this.data);
}

main() {
  Future<String> _fetchNetworkData(String id) {}

  Future<String> _loadFromDisk() {}

  Future<ProcessData> createData() async {
    try {
      final id = await _loadFromDisk();
      final data = await _fetchNetworkData(id);
      return ProcessData(data);
    } on Exception catch (error) {
      print('$error');
    } finally {
      print('done');
    }
  }

  /// equal to above
  Future<ProcessData> createData2() {
    return _loadFromDisk().then((id) {
      return _fetchNetworkData(id);
    }).then((data) {
      return ProcessData(data);
    }).catchError((error) {
      print('$error');
    }).whenComplete(() {
      print('done');
    });
  }

  /// only using await for when already know stream is complete
  Future<int> getTotal(Stream<int> numbers) async {
    int total = 0;
    await for (final value in numbers) {
      total += value;
    }
    return total;
  }
}

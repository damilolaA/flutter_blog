import 'dart:io';
import 'dart:async';
import 'package:connectivity/connectivity.dart';

class ConnectionStatusSingleton {

  static final ConnectionStatusSingleton _singleton = new ConnectionStatusSingleton._internal();
  ConnectionStatusSingleton._internal();

  static ConnectionStatusSingleton getInstance() => _singleton;

  bool hasConnection = false;

  StreamController _connectionChangeController = new StreamController.broadcast();

  Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChanged);
  }

  Stream get connectionChange => _connectionChangeController.stream;

  void _connectionChanged(ConnectivityResult result) {
    checkConnection();
  }

  Future<bool> checkConnection()async {
    try{
      final result = await InternetAddress.lookup('google.com');
      print('googleResult, $result');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException {
      hasConnection = false;
    }
    _connectionChangeController.add(hasConnection);

    return hasConnection;
  }

  void dispose() {
    _connectionChangeController.close();
  }
}
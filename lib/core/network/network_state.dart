import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkState{
  Future<bool> get isConnected;
}

class NetworkStateImpl extends NetworkState{

  final InternetConnectionChecker internetConnectionChecker;

  NetworkStateImpl(this.internetConnectionChecker);
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;

}
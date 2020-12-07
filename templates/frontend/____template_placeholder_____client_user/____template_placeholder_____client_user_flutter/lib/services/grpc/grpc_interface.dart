import 'package:grpc/grpc_connection_interface.dart';
import 'package:____template_placeholder_____client_user_flutter/services/grpc/grpc_stub.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'package:____template_placeholder_____client_user_flutter/services/grpc/grpc_standard.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'package:____template_placeholder_____client_user_flutter/services/grpc/grpc_web.dart';

abstract class Grpc {
  ClientChannelBase getClientChannel();

  factory Grpc() => getGrpc();
}

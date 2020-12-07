import 'package:grpc/grpc_connection_interface.dart';
import 'package:____template_placeholder_____client_user_flutter/constants/consts.dart';
import 'package:____template_placeholder_____client_user_flutter/services/grpc/grpc_interface.dart';

class StandardGrpc implements Grpc {
  StandardGrpc();

  @override
  ClientChannelBase getClientChannel() {
    return ClientChannel(baseUrlHost,
        port: baseUrlPort, options: baseUrlOptions);
  }
}

Grpc getGrpc() => StandardGrpc();

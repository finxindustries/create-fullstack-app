import 'package:grpc/grpc_connection_interface.dart';
import 'package:grpc/grpc_web.dart';
import 'package:____template_placeholder_____client_user_flutter/constants/consts.dart';
import 'package:____template_placeholder_____client_user_flutter/services/grpc/grpc_interface.dart';

class WebGrpc implements Grpc {
  WebGrpc();

  @override
  ClientChannelBase getClientChannel() {
    return GrpcWebClientChannel.xhr(
        Uri.parse('http://$baseUrlGrpcWebHost:$baseUrlGrpcWebPort'));
  }
}

Grpc getGrpc() => WebGrpc();

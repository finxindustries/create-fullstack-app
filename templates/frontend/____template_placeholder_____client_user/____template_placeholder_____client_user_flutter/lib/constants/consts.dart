import 'package:grpc/grpc.dart';

const baseUrlHost = 'localhost';
const baseUrlPort = 6080;
const baseUrlOptions =
    ChannelOptions(credentials: ChannelCredentials.insecure());
const baseUrlGrpcWebHost = 'localhost';
const baseUrlGrpcWebPort = 6081;

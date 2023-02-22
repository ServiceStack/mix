///
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'services.pb.dart' as $0;
export 'services.pb.dart';

class GrpcServicesClient extends $grpc.Client {
  static final _$getHello = $grpc.ClientMethod<$0.Hello, $0.HelloResponse>(
      '/GrpcServices/GetHello',
      ($0.Hello value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$postHello = $grpc.ClientMethod<$0.Hello, $0.HelloResponse>(
      '/GrpcServices/PostHello',
      ($0.Hello value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$putHello = $grpc.ClientMethod<$0.Hello, $0.HelloResponse>(
      '/GrpcServices/PutHello',
      ($0.Hello value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$deleteHello = $grpc.ClientMethod<$0.Hello, $0.HelloResponse>(
      '/GrpcServices/DeleteHello',
      ($0.Hello value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloResponse.fromBuffer(value));
  static final _$serverStreamFiles =
      $grpc.ClientMethod<$0.StreamFiles, $0.FileContent>(
          '/GrpcServices/ServerStreamFiles',
          ($0.StreamFiles value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FileContent.fromBuffer(value));
  static final _$serverStreamServerEvents =
      $grpc.ClientMethod<$0.StreamServerEvents, $0.StreamServerEventsResponse>(
          '/GrpcServices/ServerStreamServerEvents',
          ($0.StreamServerEvents value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StreamServerEventsResponse.fromBuffer(value));

  GrpcServicesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloResponse> getHello($0.Hello request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloResponse> postHello($0.Hello request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$postHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloResponse> putHello($0.Hello request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$putHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.HelloResponse> deleteHello($0.Hello request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteHello, request, options: options);
  }

  $grpc.ResponseStream<$0.FileContent> serverStreamFiles($0.StreamFiles request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$serverStreamFiles, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.StreamServerEventsResponse> serverStreamServerEvents(
      $0.StreamServerEvents request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$serverStreamServerEvents, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class GrpcServicesServiceBase extends $grpc.Service {
  $core.String get $name => 'GrpcServices';

  GrpcServicesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Hello, $0.HelloResponse>(
        'GetHello',
        getHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Hello.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Hello, $0.HelloResponse>(
        'PostHello',
        postHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Hello.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Hello, $0.HelloResponse>(
        'PutHello',
        putHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Hello.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Hello, $0.HelloResponse>(
        'DeleteHello',
        deleteHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Hello.fromBuffer(value),
        ($0.HelloResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamFiles, $0.FileContent>(
        'ServerStreamFiles',
        serverStreamFiles_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StreamFiles.fromBuffer(value),
        ($0.FileContent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamServerEvents,
            $0.StreamServerEventsResponse>(
        'ServerStreamServerEvents',
        serverStreamServerEvents_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.StreamServerEvents.fromBuffer(value),
        ($0.StreamServerEventsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloResponse> getHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Hello> request) async {
    return getHello(call, await request);
  }

  $async.Future<$0.HelloResponse> postHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Hello> request) async {
    return postHello(call, await request);
  }

  $async.Future<$0.HelloResponse> putHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Hello> request) async {
    return putHello(call, await request);
  }

  $async.Future<$0.HelloResponse> deleteHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Hello> request) async {
    return deleteHello(call, await request);
  }

  $async.Stream<$0.FileContent> serverStreamFiles_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StreamFiles> request) async* {
    yield* serverStreamFiles(call, await request);
  }

  $async.Stream<$0.StreamServerEventsResponse> serverStreamServerEvents_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.StreamServerEvents> request) async* {
    yield* serverStreamServerEvents(call, await request);
  }

  $async.Future<$0.HelloResponse> getHello(
      $grpc.ServiceCall call, $0.Hello request);
  $async.Future<$0.HelloResponse> postHello(
      $grpc.ServiceCall call, $0.Hello request);
  $async.Future<$0.HelloResponse> putHello(
      $grpc.ServiceCall call, $0.Hello request);
  $async.Future<$0.HelloResponse> deleteHello(
      $grpc.ServiceCall call, $0.Hello request);
  $async.Stream<$0.FileContent> serverStreamFiles(
      $grpc.ServiceCall call, $0.StreamFiles request);
  $async.Stream<$0.StreamServerEventsResponse> serverStreamServerEvents(
      $grpc.ServiceCall call, $0.StreamServerEvents request);
}

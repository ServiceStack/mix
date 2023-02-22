///
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class FileContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileContent', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Type', protoName: 'Type')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Length', $pb.PbFieldType.O3, protoName: 'Length')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Body', $pb.PbFieldType.OY, protoName: 'Body')
    ..aOM<ResponseStatus>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResponseStatus', protoName: 'ResponseStatus', subBuilder: ResponseStatus.create)
    ..hasRequiredFields = false
  ;

  FileContent._() : super();
  factory FileContent({
    $core.String? name,
    $core.String? type,
    $core.int? length,
    $core.List<$core.int>? body,
    ResponseStatus? responseStatus,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (length != null) {
      _result.length = length;
    }
    if (body != null) {
      _result.body = body;
    }
    if (responseStatus != null) {
      _result.responseStatus = responseStatus;
    }
    return _result;
  }
  factory FileContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileContent clone() => FileContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileContent copyWith(void Function(FileContent) updates) => super.copyWith((message) => updates(message as FileContent)) as FileContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileContent create() => FileContent._();
  FileContent createEmptyInstance() => create();
  static $pb.PbList<FileContent> createRepeated() => $pb.PbList<FileContent>();
  @$core.pragma('dart2js:noInline')
  static FileContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileContent>(create);
  static FileContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get length => $_getIZ(2);
  @$pb.TagNumber(3)
  set length($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLength() => $_has(2);
  @$pb.TagNumber(3)
  void clearLength() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get body => $_getN(3);
  @$pb.TagNumber(4)
  set body($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);

  @$pb.TagNumber(5)
  ResponseStatus get responseStatus => $_getN(4);
  @$pb.TagNumber(5)
  set responseStatus(ResponseStatus v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasResponseStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearResponseStatus() => clearField(5);
  @$pb.TagNumber(5)
  ResponseStatus ensureResponseStatus() => $_ensure(4);
}

class Hello extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Hello', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..hasRequiredFields = false
  ;

  Hello._() : super();
  factory Hello({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Hello.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hello.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Hello clone() => Hello()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Hello copyWith(void Function(Hello) updates) => super.copyWith((message) => updates(message as Hello)) as Hello; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Hello create() => Hello._();
  Hello createEmptyInstance() => create();
  static $pb.PbList<Hello> createRepeated() => $pb.PbList<Hello>();
  @$core.pragma('dart2js:noInline')
  static Hello getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Hello>(create);
  static Hello? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class HelloResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Result', protoName: 'Result')
    ..aOM<ResponseStatus>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResponseStatus', protoName: 'ResponseStatus', subBuilder: ResponseStatus.create)
    ..hasRequiredFields = false
  ;

  HelloResponse._() : super();
  factory HelloResponse({
    $core.String? result,
    ResponseStatus? responseStatus,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (responseStatus != null) {
      _result.responseStatus = responseStatus;
    }
    return _result;
  }
  factory HelloResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloResponse clone() => HelloResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloResponse copyWith(void Function(HelloResponse) updates) => super.copyWith((message) => updates(message as HelloResponse)) as HelloResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloResponse create() => HelloResponse._();
  HelloResponse createEmptyInstance() => create();
  static $pb.PbList<HelloResponse> createRepeated() => $pb.PbList<HelloResponse>();
  @$core.pragma('dart2js:noInline')
  static HelloResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloResponse>(create);
  static HelloResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  ResponseStatus get responseStatus => $_getN(1);
  @$pb.TagNumber(2)
  set responseStatus(ResponseStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResponseStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearResponseStatus() => clearField(2);
  @$pb.TagNumber(2)
  ResponseStatus ensureResponseStatus() => $_ensure(1);
}

class ResponseError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseError', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ErrorCode', protoName: 'ErrorCode')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'FieldName', protoName: 'FieldName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..m<$core.String, $core.String>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Meta', protoName: 'Meta', entryClassName: 'ResponseError.MetaEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  ResponseError._() : super();
  factory ResponseError({
    $core.String? errorCode,
    $core.String? fieldName,
    $core.String? message,
    $core.Map<$core.String, $core.String>? meta,
  }) {
    final _result = create();
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    if (fieldName != null) {
      _result.fieldName = fieldName;
    }
    if (message != null) {
      _result.message = message;
    }
    if (meta != null) {
      _result.meta.addAll(meta);
    }
    return _result;
  }
  factory ResponseError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseError clone() => ResponseError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseError copyWith(void Function(ResponseError) updates) => super.copyWith((message) => updates(message as ResponseError)) as ResponseError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseError create() => ResponseError._();
  ResponseError createEmptyInstance() => create();
  static $pb.PbList<ResponseError> createRepeated() => $pb.PbList<ResponseError>();
  @$core.pragma('dart2js:noInline')
  static ResponseError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseError>(create);
  static ResponseError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fieldName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fieldName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFieldName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFieldName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, $core.String> get meta => $_getMap(3);
}

class ResponseStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseStatus', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ErrorCode', protoName: 'ErrorCode')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'StackTrace', protoName: 'StackTrace')
    ..pc<ResponseError>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Errors', $pb.PbFieldType.PM, protoName: 'Errors', subBuilder: ResponseError.create)
    ..m<$core.String, $core.String>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Meta', protoName: 'Meta', entryClassName: 'ResponseStatus.MetaEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..hasRequiredFields = false
  ;

  ResponseStatus._() : super();
  factory ResponseStatus({
    $core.String? errorCode,
    $core.String? message,
    $core.String? stackTrace,
    $core.Iterable<ResponseError>? errors,
    $core.Map<$core.String, $core.String>? meta,
  }) {
    final _result = create();
    if (errorCode != null) {
      _result.errorCode = errorCode;
    }
    if (message != null) {
      _result.message = message;
    }
    if (stackTrace != null) {
      _result.stackTrace = stackTrace;
    }
    if (errors != null) {
      _result.errors.addAll(errors);
    }
    if (meta != null) {
      _result.meta.addAll(meta);
    }
    return _result;
  }
  factory ResponseStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseStatus clone() => ResponseStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseStatus copyWith(void Function(ResponseStatus) updates) => super.copyWith((message) => updates(message as ResponseStatus)) as ResponseStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseStatus create() => ResponseStatus._();
  ResponseStatus createEmptyInstance() => create();
  static $pb.PbList<ResponseStatus> createRepeated() => $pb.PbList<ResponseStatus>();
  @$core.pragma('dart2js:noInline')
  static ResponseStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseStatus>(create);
  static ResponseStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get stackTrace => $_getSZ(2);
  @$pb.TagNumber(3)
  set stackTrace($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStackTrace() => $_has(2);
  @$pb.TagNumber(3)
  void clearStackTrace() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ResponseError> get errors => $_getList(3);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get meta => $_getMap(4);
}

class StreamFiles extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamFiles', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Paths', protoName: 'Paths')
    ..hasRequiredFields = false
  ;

  StreamFiles._() : super();
  factory StreamFiles({
    $core.Iterable<$core.String>? paths,
  }) {
    final _result = create();
    if (paths != null) {
      _result.paths.addAll(paths);
    }
    return _result;
  }
  factory StreamFiles.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamFiles.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamFiles clone() => StreamFiles()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamFiles copyWith(void Function(StreamFiles) updates) => super.copyWith((message) => updates(message as StreamFiles)) as StreamFiles; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamFiles create() => StreamFiles._();
  StreamFiles createEmptyInstance() => create();
  static $pb.PbList<StreamFiles> createRepeated() => $pb.PbList<StreamFiles>();
  @$core.pragma('dart2js:noInline')
  static StreamFiles getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamFiles>(create);
  static StreamFiles? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get paths => $_getList(0);
}

class StreamServerEvents extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamServerEvents', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Channels', protoName: 'Channels')
    ..hasRequiredFields = false
  ;

  StreamServerEvents._() : super();
  factory StreamServerEvents({
    $core.Iterable<$core.String>? channels,
  }) {
    final _result = create();
    if (channels != null) {
      _result.channels.addAll(channels);
    }
    return _result;
  }
  factory StreamServerEvents.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamServerEvents.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamServerEvents clone() => StreamServerEvents()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamServerEvents copyWith(void Function(StreamServerEvents) updates) => super.copyWith((message) => updates(message as StreamServerEvents)) as StreamServerEvents; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamServerEvents create() => StreamServerEvents._();
  StreamServerEvents createEmptyInstance() => create();
  static $pb.PbList<StreamServerEvents> createRepeated() => $pb.PbList<StreamServerEvents>();
  @$core.pragma('dart2js:noInline')
  static StreamServerEvents getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamServerEvents>(create);
  static StreamServerEvents? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get channels => $_getList(0);
}

class StreamServerEventsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StreamServerEventsResponse', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'EventId', protoName: 'EventId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Channel', protoName: 'Channel')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Selector', protoName: 'Selector')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Json', protoName: 'Json')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Op', protoName: 'Op')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Target', protoName: 'Target')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CssSelector', protoName: 'CssSelector')
    ..m<$core.String, $core.String>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Meta', protoName: 'Meta', entryClassName: 'StreamServerEventsResponse.MetaEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UserId', protoName: 'UserId')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'DisplayName', protoName: 'DisplayName')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ProfileUrl', protoName: 'ProfileUrl')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'IsAuthenticated', protoName: 'IsAuthenticated')
    ..pPS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Channels', protoName: 'Channels')
    ..aInt64(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CreatedAt', protoName: 'CreatedAt')
    ..aOS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', protoName: 'Id')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UnRegisterUrl', protoName: 'UnRegisterUrl')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UpdateSubscriberUrl', protoName: 'UpdateSubscriberUrl')
    ..aOS(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'HeartbeatUrl', protoName: 'HeartbeatUrl')
    ..aInt64(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'HeartbeatIntervalMs', protoName: 'HeartbeatIntervalMs')
    ..aInt64(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'IdleTimeoutMs', protoName: 'IdleTimeoutMs')
    ..aOM<ResponseStatus>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResponseStatus', protoName: 'ResponseStatus', subBuilder: ResponseStatus.create)
    ..hasRequiredFields = false
  ;

  StreamServerEventsResponse._() : super();
  factory StreamServerEventsResponse({
    $fixnum.Int64? eventId,
    $core.String? channel,
    $core.String? selector,
    $core.String? json,
    $core.String? op,
    $core.String? target,
    $core.String? cssSelector,
    $core.Map<$core.String, $core.String>? meta,
    $core.String? userId,
    $core.String? displayName,
    $core.String? profileUrl,
    $core.bool? isAuthenticated,
    $core.Iterable<$core.String>? channels,
    $fixnum.Int64? createdAt,
    $core.String? id,
    $core.String? unRegisterUrl,
    $core.String? updateSubscriberUrl,
    $core.String? heartbeatUrl,
    $fixnum.Int64? heartbeatIntervalMs,
    $fixnum.Int64? idleTimeoutMs,
    ResponseStatus? responseStatus,
  }) {
    final _result = create();
    if (eventId != null) {
      _result.eventId = eventId;
    }
    if (channel != null) {
      _result.channel = channel;
    }
    if (selector != null) {
      _result.selector = selector;
    }
    if (json != null) {
      _result.json = json;
    }
    if (op != null) {
      _result.op = op;
    }
    if (target != null) {
      _result.target = target;
    }
    if (cssSelector != null) {
      _result.cssSelector = cssSelector;
    }
    if (meta != null) {
      _result.meta.addAll(meta);
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (profileUrl != null) {
      _result.profileUrl = profileUrl;
    }
    if (isAuthenticated != null) {
      _result.isAuthenticated = isAuthenticated;
    }
    if (channels != null) {
      _result.channels.addAll(channels);
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (id != null) {
      _result.id = id;
    }
    if (unRegisterUrl != null) {
      _result.unRegisterUrl = unRegisterUrl;
    }
    if (updateSubscriberUrl != null) {
      _result.updateSubscriberUrl = updateSubscriberUrl;
    }
    if (heartbeatUrl != null) {
      _result.heartbeatUrl = heartbeatUrl;
    }
    if (heartbeatIntervalMs != null) {
      _result.heartbeatIntervalMs = heartbeatIntervalMs;
    }
    if (idleTimeoutMs != null) {
      _result.idleTimeoutMs = idleTimeoutMs;
    }
    if (responseStatus != null) {
      _result.responseStatus = responseStatus;
    }
    return _result;
  }
  factory StreamServerEventsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamServerEventsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamServerEventsResponse clone() => StreamServerEventsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamServerEventsResponse copyWith(void Function(StreamServerEventsResponse) updates) => super.copyWith((message) => updates(message as StreamServerEventsResponse)) as StreamServerEventsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StreamServerEventsResponse create() => StreamServerEventsResponse._();
  StreamServerEventsResponse createEmptyInstance() => create();
  static $pb.PbList<StreamServerEventsResponse> createRepeated() => $pb.PbList<StreamServerEventsResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamServerEventsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamServerEventsResponse>(create);
  static StreamServerEventsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get eventId => $_getI64(0);
  @$pb.TagNumber(1)
  set eventId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get channel => $_getSZ(1);
  @$pb.TagNumber(2)
  set channel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannel() => clearField(2);

  @$pb.TagNumber(4)
  $core.String get selector => $_getSZ(2);
  @$pb.TagNumber(4)
  set selector($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasSelector() => $_has(2);
  @$pb.TagNumber(4)
  void clearSelector() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get json => $_getSZ(3);
  @$pb.TagNumber(5)
  set json($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasJson() => $_has(3);
  @$pb.TagNumber(5)
  void clearJson() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get op => $_getSZ(4);
  @$pb.TagNumber(6)
  set op($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasOp() => $_has(4);
  @$pb.TagNumber(6)
  void clearOp() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get target => $_getSZ(5);
  @$pb.TagNumber(7)
  set target($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasTarget() => $_has(5);
  @$pb.TagNumber(7)
  void clearTarget() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get cssSelector => $_getSZ(6);
  @$pb.TagNumber(8)
  set cssSelector($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasCssSelector() => $_has(6);
  @$pb.TagNumber(8)
  void clearCssSelector() => clearField(8);

  @$pb.TagNumber(9)
  $core.Map<$core.String, $core.String> get meta => $_getMap(7);

  @$pb.TagNumber(10)
  $core.String get userId => $_getSZ(8);
  @$pb.TagNumber(10)
  set userId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserId() => $_has(8);
  @$pb.TagNumber(10)
  void clearUserId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get displayName => $_getSZ(9);
  @$pb.TagNumber(11)
  set displayName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasDisplayName() => $_has(9);
  @$pb.TagNumber(11)
  void clearDisplayName() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get profileUrl => $_getSZ(10);
  @$pb.TagNumber(12)
  set profileUrl($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasProfileUrl() => $_has(10);
  @$pb.TagNumber(12)
  void clearProfileUrl() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isAuthenticated => $_getBF(11);
  @$pb.TagNumber(13)
  set isAuthenticated($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsAuthenticated() => $_has(11);
  @$pb.TagNumber(13)
  void clearIsAuthenticated() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$core.String> get channels => $_getList(12);

  @$pb.TagNumber(15)
  $fixnum.Int64 get createdAt => $_getI64(13);
  @$pb.TagNumber(15)
  set createdAt($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(15)
  $core.bool hasCreatedAt() => $_has(13);
  @$pb.TagNumber(15)
  void clearCreatedAt() => clearField(15);

  @$pb.TagNumber(21)
  $core.String get id => $_getSZ(14);
  @$pb.TagNumber(21)
  set id($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(21)
  $core.bool hasId() => $_has(14);
  @$pb.TagNumber(21)
  void clearId() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get unRegisterUrl => $_getSZ(15);
  @$pb.TagNumber(22)
  set unRegisterUrl($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(22)
  $core.bool hasUnRegisterUrl() => $_has(15);
  @$pb.TagNumber(22)
  void clearUnRegisterUrl() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get updateSubscriberUrl => $_getSZ(16);
  @$pb.TagNumber(23)
  set updateSubscriberUrl($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(23)
  $core.bool hasUpdateSubscriberUrl() => $_has(16);
  @$pb.TagNumber(23)
  void clearUpdateSubscriberUrl() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get heartbeatUrl => $_getSZ(17);
  @$pb.TagNumber(24)
  set heartbeatUrl($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(24)
  $core.bool hasHeartbeatUrl() => $_has(17);
  @$pb.TagNumber(24)
  void clearHeartbeatUrl() => clearField(24);

  @$pb.TagNumber(25)
  $fixnum.Int64 get heartbeatIntervalMs => $_getI64(18);
  @$pb.TagNumber(25)
  set heartbeatIntervalMs($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(25)
  $core.bool hasHeartbeatIntervalMs() => $_has(18);
  @$pb.TagNumber(25)
  void clearHeartbeatIntervalMs() => clearField(25);

  @$pb.TagNumber(26)
  $fixnum.Int64 get idleTimeoutMs => $_getI64(19);
  @$pb.TagNumber(26)
  set idleTimeoutMs($fixnum.Int64 v) { $_setInt64(19, v); }
  @$pb.TagNumber(26)
  $core.bool hasIdleTimeoutMs() => $_has(19);
  @$pb.TagNumber(26)
  void clearIdleTimeoutMs() => clearField(26);

  @$pb.TagNumber(30)
  ResponseStatus get responseStatus => $_getN(20);
  @$pb.TagNumber(30)
  set responseStatus(ResponseStatus v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasResponseStatus() => $_has(20);
  @$pb.TagNumber(30)
  void clearResponseStatus() => clearField(30);
  @$pb.TagNumber(30)
  ResponseStatus ensureResponseStatus() => $_ensure(20);
}


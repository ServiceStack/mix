///
//  Generated code. Do not modify.
//  source: services.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use fileContentDescriptor instead')
const FileContent$json = const {
  '1': 'FileContent',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Type', '3': 2, '4': 1, '5': 9, '10': 'Type'},
    const {'1': 'Length', '3': 3, '4': 1, '5': 5, '10': 'Length'},
    const {'1': 'Body', '3': 4, '4': 1, '5': 12, '10': 'Body'},
    const {'1': 'ResponseStatus', '3': 5, '4': 1, '5': 11, '6': '.ResponseStatus', '10': 'ResponseStatus'},
  ],
};

/// Descriptor for `FileContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileContentDescriptor = $convert.base64Decode('CgtGaWxlQ29udGVudBISCgROYW1lGAEgASgJUgROYW1lEhIKBFR5cGUYAiABKAlSBFR5cGUSFgoGTGVuZ3RoGAMgASgFUgZMZW5ndGgSEgoEQm9keRgEIAEoDFIEQm9keRI3Cg5SZXNwb25zZVN0YXR1cxgFIAEoCzIPLlJlc3BvbnNlU3RhdHVzUg5SZXNwb25zZVN0YXR1cw==');
@$core.Deprecated('Use helloDescriptor instead')
const Hello$json = const {
  '1': 'Hello',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
  ],
};

/// Descriptor for `Hello`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloDescriptor = $convert.base64Decode('CgVIZWxsbxISCgROYW1lGAEgASgJUgROYW1l');
@$core.Deprecated('Use helloResponseDescriptor instead')
const HelloResponse$json = const {
  '1': 'HelloResponse',
  '2': const [
    const {'1': 'Result', '3': 1, '4': 1, '5': 9, '10': 'Result'},
    const {'1': 'ResponseStatus', '3': 2, '4': 1, '5': 11, '6': '.ResponseStatus', '10': 'ResponseStatus'},
  ],
};

/// Descriptor for `HelloResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloResponseDescriptor = $convert.base64Decode('Cg1IZWxsb1Jlc3BvbnNlEhYKBlJlc3VsdBgBIAEoCVIGUmVzdWx0EjcKDlJlc3BvbnNlU3RhdHVzGAIgASgLMg8uUmVzcG9uc2VTdGF0dXNSDlJlc3BvbnNlU3RhdHVz');
@$core.Deprecated('Use responseErrorDescriptor instead')
const ResponseError$json = const {
  '1': 'ResponseError',
  '2': const [
    const {'1': 'ErrorCode', '3': 1, '4': 1, '5': 9, '10': 'ErrorCode'},
    const {'1': 'FieldName', '3': 2, '4': 1, '5': 9, '10': 'FieldName'},
    const {'1': 'Message', '3': 3, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Meta', '3': 4, '4': 3, '5': 11, '6': '.ResponseError.MetaEntry', '10': 'Meta'},
  ],
  '3': const [ResponseError_MetaEntry$json],
};

@$core.Deprecated('Use responseErrorDescriptor instead')
const ResponseError_MetaEntry$json = const {
  '1': 'MetaEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ResponseError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseErrorDescriptor = $convert.base64Decode('Cg1SZXNwb25zZUVycm9yEhwKCUVycm9yQ29kZRgBIAEoCVIJRXJyb3JDb2RlEhwKCUZpZWxkTmFtZRgCIAEoCVIJRmllbGROYW1lEhgKB01lc3NhZ2UYAyABKAlSB01lc3NhZ2USLAoETWV0YRgEIAMoCzIYLlJlc3BvbnNlRXJyb3IuTWV0YUVudHJ5UgRNZXRhGjcKCU1ldGFFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');
@$core.Deprecated('Use responseStatusDescriptor instead')
const ResponseStatus$json = const {
  '1': 'ResponseStatus',
  '2': const [
    const {'1': 'ErrorCode', '3': 1, '4': 1, '5': 9, '10': 'ErrorCode'},
    const {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'StackTrace', '3': 3, '4': 1, '5': 9, '10': 'StackTrace'},
    const {'1': 'Errors', '3': 4, '4': 3, '5': 11, '6': '.ResponseError', '10': 'Errors'},
    const {'1': 'Meta', '3': 5, '4': 3, '5': 11, '6': '.ResponseStatus.MetaEntry', '10': 'Meta'},
  ],
  '3': const [ResponseStatus_MetaEntry$json],
};

@$core.Deprecated('Use responseStatusDescriptor instead')
const ResponseStatus_MetaEntry$json = const {
  '1': 'MetaEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ResponseStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseStatusDescriptor = $convert.base64Decode('Cg5SZXNwb25zZVN0YXR1cxIcCglFcnJvckNvZGUYASABKAlSCUVycm9yQ29kZRIYCgdNZXNzYWdlGAIgASgJUgdNZXNzYWdlEh4KClN0YWNrVHJhY2UYAyABKAlSClN0YWNrVHJhY2USJgoGRXJyb3JzGAQgAygLMg4uUmVzcG9uc2VFcnJvclIGRXJyb3JzEi0KBE1ldGEYBSADKAsyGS5SZXNwb25zZVN0YXR1cy5NZXRhRW50cnlSBE1ldGEaNwoJTWV0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use streamFilesDescriptor instead')
const StreamFiles$json = const {
  '1': 'StreamFiles',
  '2': const [
    const {'1': 'Paths', '3': 1, '4': 3, '5': 9, '10': 'Paths'},
  ],
};

/// Descriptor for `StreamFiles`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamFilesDescriptor = $convert.base64Decode('CgtTdHJlYW1GaWxlcxIUCgVQYXRocxgBIAMoCVIFUGF0aHM=');
@$core.Deprecated('Use streamServerEventsDescriptor instead')
const StreamServerEvents$json = const {
  '1': 'StreamServerEvents',
  '2': const [
    const {'1': 'Channels', '3': 1, '4': 3, '5': 9, '10': 'Channels'},
  ],
};

/// Descriptor for `StreamServerEvents`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamServerEventsDescriptor = $convert.base64Decode('ChJTdHJlYW1TZXJ2ZXJFdmVudHMSGgoIQ2hhbm5lbHMYASADKAlSCENoYW5uZWxz');
@$core.Deprecated('Use streamServerEventsResponseDescriptor instead')
const StreamServerEventsResponse$json = const {
  '1': 'StreamServerEventsResponse',
  '2': const [
    const {'1': 'EventId', '3': 1, '4': 1, '5': 3, '10': 'EventId'},
    const {'1': 'Channel', '3': 2, '4': 1, '5': 9, '10': 'Channel'},
    const {'1': 'Selector', '3': 4, '4': 1, '5': 9, '10': 'Selector'},
    const {'1': 'Json', '3': 5, '4': 1, '5': 9, '10': 'Json'},
    const {'1': 'Op', '3': 6, '4': 1, '5': 9, '10': 'Op'},
    const {'1': 'Target', '3': 7, '4': 1, '5': 9, '10': 'Target'},
    const {'1': 'CssSelector', '3': 8, '4': 1, '5': 9, '10': 'CssSelector'},
    const {'1': 'Meta', '3': 9, '4': 3, '5': 11, '6': '.StreamServerEventsResponse.MetaEntry', '10': 'Meta'},
    const {'1': 'UserId', '3': 10, '4': 1, '5': 9, '10': 'UserId'},
    const {'1': 'DisplayName', '3': 11, '4': 1, '5': 9, '10': 'DisplayName'},
    const {'1': 'ProfileUrl', '3': 12, '4': 1, '5': 9, '10': 'ProfileUrl'},
    const {'1': 'IsAuthenticated', '3': 13, '4': 1, '5': 8, '10': 'IsAuthenticated'},
    const {'1': 'Channels', '3': 14, '4': 3, '5': 9, '10': 'Channels'},
    const {'1': 'CreatedAt', '3': 15, '4': 1, '5': 3, '10': 'CreatedAt'},
    const {'1': 'Id', '3': 21, '4': 1, '5': 9, '10': 'Id'},
    const {'1': 'UnRegisterUrl', '3': 22, '4': 1, '5': 9, '10': 'UnRegisterUrl'},
    const {'1': 'UpdateSubscriberUrl', '3': 23, '4': 1, '5': 9, '10': 'UpdateSubscriberUrl'},
    const {'1': 'HeartbeatUrl', '3': 24, '4': 1, '5': 9, '10': 'HeartbeatUrl'},
    const {'1': 'HeartbeatIntervalMs', '3': 25, '4': 1, '5': 3, '10': 'HeartbeatIntervalMs'},
    const {'1': 'IdleTimeoutMs', '3': 26, '4': 1, '5': 3, '10': 'IdleTimeoutMs'},
    const {'1': 'ResponseStatus', '3': 30, '4': 1, '5': 11, '6': '.ResponseStatus', '10': 'ResponseStatus'},
  ],
  '3': const [StreamServerEventsResponse_MetaEntry$json],
};

@$core.Deprecated('Use streamServerEventsResponseDescriptor instead')
const StreamServerEventsResponse_MetaEntry$json = const {
  '1': 'MetaEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `StreamServerEventsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamServerEventsResponseDescriptor = $convert.base64Decode('ChpTdHJlYW1TZXJ2ZXJFdmVudHNSZXNwb25zZRIYCgdFdmVudElkGAEgASgDUgdFdmVudElkEhgKB0NoYW5uZWwYAiABKAlSB0NoYW5uZWwSGgoIU2VsZWN0b3IYBCABKAlSCFNlbGVjdG9yEhIKBEpzb24YBSABKAlSBEpzb24SDgoCT3AYBiABKAlSAk9wEhYKBlRhcmdldBgHIAEoCVIGVGFyZ2V0EiAKC0Nzc1NlbGVjdG9yGAggASgJUgtDc3NTZWxlY3RvchI5CgRNZXRhGAkgAygLMiUuU3RyZWFtU2VydmVyRXZlbnRzUmVzcG9uc2UuTWV0YUVudHJ5UgRNZXRhEhYKBlVzZXJJZBgKIAEoCVIGVXNlcklkEiAKC0Rpc3BsYXlOYW1lGAsgASgJUgtEaXNwbGF5TmFtZRIeCgpQcm9maWxlVXJsGAwgASgJUgpQcm9maWxlVXJsEigKD0lzQXV0aGVudGljYXRlZBgNIAEoCFIPSXNBdXRoZW50aWNhdGVkEhoKCENoYW5uZWxzGA4gAygJUghDaGFubmVscxIcCglDcmVhdGVkQXQYDyABKANSCUNyZWF0ZWRBdBIOCgJJZBgVIAEoCVICSWQSJAoNVW5SZWdpc3RlclVybBgWIAEoCVINVW5SZWdpc3RlclVybBIwChNVcGRhdGVTdWJzY3JpYmVyVXJsGBcgASgJUhNVcGRhdGVTdWJzY3JpYmVyVXJsEiIKDEhlYXJ0YmVhdFVybBgYIAEoCVIMSGVhcnRiZWF0VXJsEjAKE0hlYXJ0YmVhdEludGVydmFsTXMYGSABKANSE0hlYXJ0YmVhdEludGVydmFsTXMSJAoNSWRsZVRpbWVvdXRNcxgaIAEoA1INSWRsZVRpbWVvdXRNcxI3Cg5SZXNwb25zZVN0YXR1cxgeIAEoCzIPLlJlc3BvbnNlU3RhdHVzUg5SZXNwb25zZVN0YXR1cxo3CglNZXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

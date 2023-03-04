import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'login_record.g.dart';

abstract class LoginRecord implements Built<LoginRecord, LoginRecordBuilder> {
  static Serializer<LoginRecord> get serializer => _$loginRecordSerializer;

  String? get buttonID;

  String? get timeIn;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LoginRecordBuilder builder) => builder
    ..buttonID = ''
    ..timeIn = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('login');

  static Stream<LoginRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LoginRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LoginRecord._();
  factory LoginRecord([void Function(LoginRecordBuilder) updates]) =
      _$LoginRecord;

  static LoginRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLoginRecordData({
  String? buttonID,
  String? timeIn,
}) {
  final firestoreData = serializers.toFirestore(
    LoginRecord.serializer,
    LoginRecord(
      (l) => l
        ..buttonID = buttonID
        ..timeIn = timeIn,
    ),
  );

  return firestoreData;
}

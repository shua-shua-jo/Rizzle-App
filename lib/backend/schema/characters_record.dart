import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CharactersRecord extends FirestoreRecord {
  CharactersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "character_name" field.
  String? _characterName;
  String get characterName => _characterName ?? '';
  bool hasCharacterName() => _characterName != null;

  // "character_description" field.
  String? _characterDescription;
  String get characterDescription => _characterDescription ?? '';
  bool hasCharacterDescription() => _characterDescription != null;

  // "character_origin" field.
  String? _characterOrigin;
  String get characterOrigin => _characterOrigin ?? '';
  bool hasCharacterOrigin() => _characterOrigin != null;

  // "character_image" field.
  String? _characterImage;
  String get characterImage => _characterImage ?? '';
  bool hasCharacterImage() => _characterImage != null;

  // "character_bio" field.
  String? _characterBio;
  String get characterBio => _characterBio ?? '';
  bool hasCharacterBio() => _characterBio != null;

  // "is_picked" field.
  bool? _isPicked;
  bool get isPicked => _isPicked ?? false;
  bool hasIsPicked() => _isPicked != null;

  // "is_rejected" field.
  bool? _isRejected;
  bool get isRejected => _isRejected ?? false;
  bool hasIsRejected() => _isRejected != null;

  // "is_nolifili" field.
  bool? _isNolifili;
  bool get isNolifili => _isNolifili ?? false;
  bool hasIsNolifili() => _isNolifili != null;

  void _initializeFields() {
    _characterName = snapshotData['character_name'] as String?;
    _characterDescription = snapshotData['character_description'] as String?;
    _characterOrigin = snapshotData['character_origin'] as String?;
    _characterImage = snapshotData['character_image'] as String?;
    _characterBio = snapshotData['character_bio'] as String?;
    _isPicked = snapshotData['is_picked'] as bool?;
    _isRejected = snapshotData['is_rejected'] as bool?;
    _isNolifili = snapshotData['is_nolifili'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('characters');

  static Stream<CharactersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CharactersRecord.fromSnapshot(s));

  static Future<CharactersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CharactersRecord.fromSnapshot(s));

  static CharactersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CharactersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CharactersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CharactersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CharactersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CharactersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCharactersRecordData({
  String? characterName,
  String? characterDescription,
  String? characterOrigin,
  String? characterImage,
  String? characterBio,
  bool? isPicked,
  bool? isRejected,
  bool? isNolifili,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'character_name': characterName,
      'character_description': characterDescription,
      'character_origin': characterOrigin,
      'character_image': characterImage,
      'character_bio': characterBio,
      'is_picked': isPicked,
      'is_rejected': isRejected,
      'is_nolifili': isNolifili,
    }.withoutNulls,
  );

  return firestoreData;
}

class CharactersRecordDocumentEquality implements Equality<CharactersRecord> {
  const CharactersRecordDocumentEquality();

  @override
  bool equals(CharactersRecord? e1, CharactersRecord? e2) {
    return e1?.characterName == e2?.characterName &&
        e1?.characterDescription == e2?.characterDescription &&
        e1?.characterOrigin == e2?.characterOrigin &&
        e1?.characterImage == e2?.characterImage &&
        e1?.characterBio == e2?.characterBio &&
        e1?.isPicked == e2?.isPicked &&
        e1?.isRejected == e2?.isRejected &&
        e1?.isNolifili == e2?.isNolifili;
  }

  @override
  int hash(CharactersRecord? e) => const ListEquality().hash([
        e?.characterName,
        e?.characterDescription,
        e?.characterOrigin,
        e?.characterImage,
        e?.characterBio,
        e?.isPicked,
        e?.isRejected,
        e?.isNolifili
      ]);

  @override
  bool isValidKey(Object? o) => o is CharactersRecord;
}

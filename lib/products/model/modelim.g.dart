// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelim.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyListAdapter extends TypeAdapter<MyList> {
  @override
  final int typeId = 0;

  @override
  MyList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyList(
      qrText: fields[0] as String?,
      text: fields[1] as String?,
      link: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.qrText)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThemeModelAdapter extends TypeAdapter<ThemeModel> {
  @override
  final int typeId = 1;

  @override
  ThemeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeModel(
      theme: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(3)
      ..write(obj.theme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

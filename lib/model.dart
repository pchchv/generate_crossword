import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:characters/characters.dart';

/// A location in a crossword.
abstract class Location implements Built<Location, LocationBuilder> {
  static Serializer<Location> get serializer => _$locationSerializer;
  /// The horizontal part of the location. The location is 0 based.
  int get x;
  /// The vertical part of the location. The location is 0 based.
  int get y;
  /// Returns a new location that is one step to the left of this location.
  Location get left => rebuild((b) => b.x = x - 1);
  /// Returns a new location that is one step to the right of this location.
  Location get right => rebuild((b) => b.x = x + 1);
  /// Returns a new location that is one step up from this location.
  Location get up => rebuild((b) => b.y = y - 1);
  /// Returns a new location that is one step down from this location.
  Location get down => rebuild((b) => b.y = y + 1);
  /// Returns a new location that is [offset] steps to the left of this location.
  Location leftOffset(int offset) => rebuild((b) => b.x = x - offset);
  /// Returns a new location that is [offset] steps to the right of this location.
  Location rightOffset(int offset) => rebuild((b) => b.x = x + offset);
  /// Returns a new location that is [offset] steps up from this location.
  Location upOffset(int offset) => rebuild((b) => b.y = y - offset);
  /// Returns a new location that is [offset] steps down from this location.
  Location downOffset(int offset) => rebuild((b) => b.y = y + offset);
  /// Pretty print a location as a (x,y) coordinate.
  String prettyPrint() => '($x,$y)';

  /// Returns a new location built from [updates]. Both [x] and [y] are
  /// required to be non-null.
  factory Location([void Function(LocationBuilder)? updates]) = _$Location;
  Location._();

  /// Returns a location at the given coordinates.
  factory Location.at(int x, int y) {
    return Location((b) {
      b
        ..x = x
        ..y = y;
    });
  }
}

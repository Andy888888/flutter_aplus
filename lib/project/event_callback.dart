import 'house_type.dart';

abstract class EventsCallback {
  void selectOrientation(String newOrientation);

  void selectHouseType(HouseType type, String value);

  void selectProperties(List<String> result);
}
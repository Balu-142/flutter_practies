import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getPosition() async {
    // Check for location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case when the user denies the permission
        throw Exception('Location permission denied');
      }
    }

    // Get the current position
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}

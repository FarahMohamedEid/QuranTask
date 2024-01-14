
/// Extension for [String] class
Duration parseDuration(String durationString) {
  List<String> parts = durationString.split(':');
  int minutes = int.parse(parts[0]);
  List<String> secondsParts = parts[1].split('.');
  int seconds = int.parse(secondsParts[0]);
  int milliseconds = int.parse(secondsParts[1]) * 100;

  return Duration(minutes: minutes, seconds: seconds, milliseconds: milliseconds);
}
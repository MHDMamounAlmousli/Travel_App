enum Season{
  Winter,
  Spring,
  Summer,
  Autumn,
}
enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy
}
class Trip{
  final String id;
  final String title;
  final List<String>categories;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip({
    required this.id,
    required this.title,
    required this.categories,
    required this.imageUrl,
    required this.activities,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });

}
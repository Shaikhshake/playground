class Project {
  final String id = DateTime.timestamp().toString();
  String title;
  String description;
  String ownerName;
  List? languageUsed;

  Project(
      {this.title = "Untitled",
      this.description = "No Description",
      this.ownerName = "Unknown",
      this.languageUsed});
}

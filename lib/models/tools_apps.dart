class ToolsApps {
  final String? name;
  ToolsApps(this.name);
  factory ToolsApps.fromJson(Map<String, dynamic> json) {
    return ToolsApps(json["name"]);
  }
}

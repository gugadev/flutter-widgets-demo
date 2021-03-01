class Component {
  String name;
  String route;
  String description;

  Component.fromJson(Map<String, String> data) {
    this.name = data['name'];
    this.description = data['description'];
    this.route = data['route'];
  }
}

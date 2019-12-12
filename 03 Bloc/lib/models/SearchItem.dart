class SearchItem {
  final String name;
  final String fullName;
  final String url;
  final String avatarUrl;

  SearchItem({this.name, this.fullName, this.url, this.avatarUrl});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
        name: json['name'],
        fullName: json['full_name'],
        url: json['html_url'],
        avatarUrl: (json['owner'] as Map<String, dynamic>)['avatar_url']);
  }
}

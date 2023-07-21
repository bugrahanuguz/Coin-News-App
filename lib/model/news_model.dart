
class NewsModel {
  String? id;
  String? title;
  String? summary;
  String? image;
  String? publishedAt;
  String? url;
  String? tag;
  String? source;
  String? stamp;

  NewsModel(
      {this.id,
      this.title,
      this.summary,
      this.image,
      this.publishedAt,
      this.url,
      this.tag,
      this.source,
      this.stamp});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    image = json['image'];
    publishedAt = json['publishedAt'];
    url = json['url'];
    tag = json['tag'];
    source = json['source'];
    stamp = json['stamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['image'] = this.image;
    data['publishedAt'] = this.publishedAt;
    data['url'] = this.url;
    data['tag'] = this.tag;
    data['source'] = this.source;
    data['stamp'] = this.stamp;
    return data;
  }
}
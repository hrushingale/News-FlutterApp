class NewsDetails {
  // final MainStructure source;
  final String? id;
  final String? name;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

   NewsDetails({
     this.id,
     this.name,
     // required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content

  });

  factory NewsDetails.fromJson(Map<String, dynamic> json) {
    return NewsDetails(
      // source:MainStructure.fromJson(json['source']),
      id: json['source']['id'] ,
      name: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
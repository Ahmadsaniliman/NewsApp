// ignore_for_file: prefer_void_to_null

class NewsApiModel {
  late String status;
  late int totalResults;
  late List<Results> results;
  Null nextPage;

  NewsApiModel({
    required this.status,
    required this.totalResults,
    required this.results,
    this.nextPage,
  });

  NewsApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['results'] = results.map((v) => v.toJson()).toList();
    data['nextPage'] = nextPage;
    return data;
  }
}

class Results {
  late String title;
  late String link;
  late List<String> keywords;
  late List<String> creator;
  Null videoUrl;
  late String description;
  late String content;
  late String pubDate;
  late String imageUrl;
  late String sourceId;
  late List<String> country;
  late List<String> category;
  late String language;

  Results({
    required this.title,
    required this.link,
    required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.imageUrl,
    required this.sourceId,
    required this.country,
    required this.category,
    required this.language,
  });

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    keywords = json['keywords'].cast<String>();
    creator = json['creator'].cast<String>();
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    country = json['country'].cast<String>();
    category = json['category'].cast<String>();
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['keywords'] = keywords;
    data['creator'] = creator;
    data['video_url'] = videoUrl;
    data['description'] = description;
    data['content'] = content;
    data['pubDate'] = pubDate;
    data['image_url'] = imageUrl;
    data['source_id'] = sourceId;
    data['country'] = country;
    data['category'] = category;
    data['language'] = language;
    return data;
  }
}

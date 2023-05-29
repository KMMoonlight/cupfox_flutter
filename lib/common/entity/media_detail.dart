class MediaDetail {
  PageProps? pageProps;

  MediaDetail({this.pageProps});

  MediaDetail.fromJson(Map<String, dynamic> json) {
    pageProps = json['pageProps'] != null
        ? PageProps.fromJson(json['pageProps'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pageProps != null) {
      data['pageProps'] = pageProps!.toJson();
    }
    return data;
  }
}

class PageProps {
  ResourceSearchResult? resourceSearchResult;

  PageProps({this.resourceSearchResult});

  PageProps.fromJson(Map<String, dynamic> json) {
    resourceSearchResult = json['resourceSearchResult'] != null
        ? ResourceSearchResult.fromJson(json['resourceSearchResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resourceSearchResult != null) {
      data['resourceSearchResult'] = resourceSearchResult!.toJson();
    }
    return data;
  }
}

class ResourceSearchResult {
  List<Resources>? resources;
  Subject? subject;

  ResourceSearchResult({this.resources, this.subject});

  ResourceSearchResult.fromJson(Map<String, dynamic> json) {
    if (json['resources'] != null) {
      resources = <Resources>[];
      json['resources'].forEach((v) {
        resources!.add(Resources.fromJson(v));
      });
    }
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resources != null) {
      data['resources'] = resources!.map((v) => v.toJson()).toList();
    }
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    return data;
  }
}

class Resources {
  String? text;
  String? url;
  int? type;
  String? website;
  String? icon;
  List<String>? tags;

  Resources(
      {this.text, this.url, this.type, this.website, this.icon, this.tags});

  Resources.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    url = json['url'];
    type = json['type'];
    website = json['website'];
    icon = json['icon'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['url'] = url;
    data['type'] = type;
    data['website'] = website;
    data['icon'] = icon;
    data['tags'] = tags;
    return data;
  }
}

class Subject {
  int? doubanId;
  String? title;
  String? cover;
  String? star;
  String? rating;
  String? info;
  String? comment;

  Subject(
      {this.doubanId,
      this.title,
      this.cover,
      this.star,
      this.rating,
      this.info,
      this.comment});

  Subject.fromJson(Map<String, dynamic> json) {
    doubanId = json['douban_id'];
    title = json['title'];
    cover = json['cover'];
    star = json['star'];
    rating = json['rating'];
    info = json['info'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['douban_id'] = doubanId;
    data['title'] = title;
    data['cover'] = cover;
    data['star'] = star;
    data['rating'] = rating;
    data['info'] = info;
    data['comment'] = comment;
    return data;
  }
}

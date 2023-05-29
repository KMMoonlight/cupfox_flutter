class HomeRecommend {
  PageProps? pageProps;

  HomeRecommend({this.pageProps});

  HomeRecommend.fromJson(Map<String, dynamic> json) {
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
  HomeResult? homeResult;

  PageProps({this.homeResult});

  PageProps.fromJson(Map<String, dynamic> json) {
    homeResult = json['homeResult'] != null
        ? HomeResult.fromJson(json['homeResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homeResult != null) {
      data['homeResult'] = homeResult!.toJson();
    }
    return data;
  }
}

class HomeResult {
  Banners? banners;
  Recommend? recommend;

  HomeResult({this.banners, this.recommend});

  HomeResult.fromJson(Map<String, dynamic> json) {
    banners =
        json['banners'] != null ? Banners.fromJson(json['banners']) : null;
    recommend = json['recommend'] != null
        ? Recommend.fromJson(json['recommend'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.toJson();
    }
    if (recommend != null) {
      data['recommend'] = recommend!.toJson();
    }
    return data;
  }
}

class Banners {
  List<M>? m;

  Banners({this.m});

  Banners.fromJson(Map<String, dynamic> json) {
    if (json['m'] != null) {
      m = <M>[];
      json['m'].forEach((v) {
        m!.add(M.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (m != null) {
      data['m'] = m!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class M {
  String? name;
  String? platform;
  String? img;
  String? url;
  String? target;

  M({this.name, this.platform, this.img, this.url, this.target});

  M.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    platform = json['platform'];
    img = json['img'];
    url = json['url'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['platform'] = platform;
    data['img'] = img;
    data['url'] = url;
    data['target'] = target;
    return data;
  }
}

class Recommend {
  Movie? movie;
  Movie? tvHot;
  Movie? tvAnimation;
  Movie? tvShow;
  Movie? tvRecord;

  Recommend(
      {this.movie, this.tvHot, this.tvAnimation, this.tvShow, this.tvRecord});

  Recommend.fromJson(Map<String, dynamic> json) {
    movie = json['movie_热门'] != null ? Movie.fromJson(json['movie_热门']) : null;
    tvHot = json['tv_热门'] != null ? Movie.fromJson(json['tv_热门']) : null;
    tvAnimation =
        json['tv_日本动画'] != null ? Movie.fromJson(json['tv_日本动画']) : null;
    tvShow = json['tv_综艺'] != null ? Movie.fromJson(json['tv_综艺']) : null;
    tvRecord = json['tv_纪录片'] != null ? Movie.fromJson(json['tv_纪录片']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movie != null) {
      data['movie_热门'] = movie!.toJson();
    }
    if (tvHot != null) {
      data['tv_热门'] = tvHot!.toJson();
    }
    if (tvAnimation != null) {
      data['tv_日本动画'] = tvAnimation!.toJson();
    }
    if (tvShow != null) {
      data['tv_综艺'] = tvShow!.toJson();
    }
    if (tvRecord != null) {
      data['tv_纪录片'] = tvRecord!.toJson();
    }
    return data;
  }
}

class Movie {
  List<Subjects>? subjects;

  Movie({this.subjects});

  Movie.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subjects != null) {
      data['subjects'] = subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  String? star;
  String? rating;
  String? title;
  String? cover;
  String? doubanId;

  Subjects({this.star, this.rating, this.title, this.cover, this.doubanId});

  Subjects.fromJson(Map<String, dynamic> json) {
    star = json['star'];
    rating = json['rating'];
    title = json['title'];
    cover = json['cover'];
    doubanId = json['douban_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['star'] = star;
    data['rating'] = rating;
    data['title'] = title;
    data['cover'] = cover;
    data['douban_id'] = doubanId;
    return data;
  }
}

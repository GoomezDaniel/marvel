/// Model of constructor to Characters, Events, Comics, Series & Stories
class CharacterModel {
  CharacterModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  CharacterModel copyWith({
    int code,
    String status,
    String copyright,
    String attributionText,
    String attributionHtml,
    String etag,
    Data data,
  }) =>
      CharacterModel(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory CharacterModel.fromMap(Map<String, dynamic> json) => CharacterModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        attributionText:
            json["attributionText"] == null ? null : json["attributionText"],
        attributionHtml:
            json["attributionHTML"] == null ? null : json["attributionHTML"],
        etag: json["etag"] == null ? null : json["etag"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "copyright": copyright == null ? null : copyright,
        "attributionText": attributionText == null ? null : attributionText,
        "attributionHTML": attributionHtml == null ? null : attributionHtml,
        "etag": etag == null ? null : etag,
        "data": data == null ? null : data.toMap(),
      };
}

/// Model of constructor to Data
class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  int offset;
  int limit;
  int total;
  int count;
  List<ResultCharacter> results;

  Data copyWith({
    int offset,
    int limit,
    int total,
    int count,
    List<ResultCharacter> results,
  }) =>
      Data(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        total: total ?? this.total,
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"] == null ? null : json["offset"],
        limit: json["limit"] == null ? null : json["limit"],
        total: json["total"] == null ? null : json["total"],
        count: json["count"] == null ? null : json["count"],
        results: json["results"] == null
            ? null
            : List<ResultCharacter>.from(
                json["results"].map((x) => ResultCharacter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset == null ? null : offset,
        "limit": limit == null ? null : limit,
        "total": total == null ? null : total,
        "count": count == null ? null : count,
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

/// Model of constructor to Results
class ResultCharacter {
  ResultCharacter({
    this.id,
    this.title,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  int id;
  String title;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;
  Comics comics;
  Comics series;
  Stories stories;
  Comics events;
  List<Url> urls;

  ResultCharacter copyWith({
    int id,
    String title,
    String description,
    String modified,
    Thumbnail thumbnail,
    String resourceUri,
    Comics comics,
    Comics series,
    Stories stories,
    Comics events,
    List<Url> urls,
  }) =>
      ResultCharacter(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
        resourceUri: resourceUri ?? this.resourceUri,
        comics: comics ?? this.comics,
        series: series ?? this.series,
        stories: stories ?? this.stories,
        events: events ?? this.events,
        urls: urls ?? this.urls,
      );

  factory ResultCharacter.fromMap(Map<String, dynamic> json) => ResultCharacter(
        id: json["id"] == null ? null : json["id"],
        title: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        modified: json["modified"] == null ? null : json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        comics: json["comics"] == null ? null : Comics.fromMap(json["comics"]),
        series: json["series"] == null ? null : Comics.fromMap(json["series"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        events: json["events"] == null ? null : Comics.fromMap(json["events"]),
        urls: json["urls"] == null
            ? null
            : List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": title == null ? null : title,
        "description": description == null ? null : description,
        "modified": modified == null ? null : modified,
        "thumbnail": thumbnail == null ? null : thumbnail.toMap(),
        "resourceURI": resourceUri == null ? null : resourceUri,
        "comics": comics == null ? null : comics.toMap(),
        "series": series == null ? null : series.toMap(),
        "stories": stories == null ? null : stories.toMap(),
        "events": events == null ? null : events.toMap(),
        "urls": urls == null
            ? null
            : List<dynamic>.from(urls.map((x) => x.toMap())),
      };
}

/// Model of constructor to Comics
class Comics {
  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int available;
  String collectionUri;
  List<ComicsItem> items;
  int returned;

  Comics copyWith({
    int available,
    String collectionUri,
    List<ComicsItem> items,
    int returned,
  }) =>
      Comics(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Comics.fromMap(Map<String, dynamic> json) => Comics(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<ComicsItem>.from(
                json["items"].map((x) => ComicsItem.fromMap(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned == null ? null : returned,
      };
}

/// Model of constructor to ComicsItem
class ComicsItem {
  ComicsItem({
    this.resourceUri,
    this.name,
  });

  String resourceUri;
  String name;

  ComicsItem copyWith({
    String resourceUri,
    String name,
  }) =>
      ComicsItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
      );

  factory ComicsItem.fromMap(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
      };
}

/// Model of constructor to Stories
class Stories {
  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int available;
  String collectionUri;
  List<StoriesItem> items;
  int returned;

  Stories copyWith({
    int available,
    String collectionUri,
    List<StoriesItem> items,
    int returned,
  }) =>
      Stories(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<StoriesItem>.from(
                json["items"].map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned == null ? null : returned,
      };
}

/// Model of constructor to StoriesItem
class StoriesItem {
  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  String resourceUri;
  String name;
  ItemType type;

  StoriesItem copyWith({
    String resourceUri,
    String name,
    ItemType type,
  }) =>
      StoriesItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : itemTypeValues.map[json["type"]],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "type": type == null ? null : itemTypeValues.reverse[type],
      };
}

enum ItemType { COVER, INTERIOR_STORY, EMPTY }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY
});

/// Model of constructor to Thumbnail
class Thumbnail {
  Thumbnail({
    this.path,
    this.ext,
  });

  String path;
  String ext;

  Thumbnail copyWith({
    String path,
    String ext,
  }) =>
      Thumbnail(
        path: path ?? this.path,
        ext: ext ?? this.ext,
      );

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"] == null ? null : json["path"],
        ext: json["extension"] == null ? null : json["extension"],
      );

  Map<String, dynamic> toMap() => {
        "path": path == null ? null : path,
        "extension": ext == null ? null : ext,
      };
}

enum Extension { JPG, GIF }

final extensionValues =
    EnumValues({"gif": Extension.GIF, "jpg": Extension.JPG});

/// Model of constructor to Urls
class Url {
  Url({
    this.type,
    this.url,
  });

  UrlType type;
  String url;

  Url copyWith({
    UrlType type,
    String url,
  }) =>
      Url(
        type: type ?? this.type,
        url: url ?? this.url,
      );

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: json["type"] == null ? null : urlTypeValues.map[json["type"]],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : urlTypeValues.reverse[type],
        "url": url == null ? null : url,
      };
}

enum UrlType { DETAIL, WIKI, COMICLINK }

final urlTypeValues = EnumValues({
  "comiclink": UrlType.COMICLINK,
  "detail": UrlType.DETAIL,
  "wiki": UrlType.WIKI
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

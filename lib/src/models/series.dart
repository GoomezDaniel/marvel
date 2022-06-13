// To parse this JSON data, do
//
//     final seriesModel = seriesModelFromMap(jsonString);

import 'dart:convert';

SeriesModel seriesModelFromMap(String str) =>
    SeriesModel.fromMap(json.decode(str));

String seriesModelToMap(SeriesModel data) => json.encode(data.toMap());

class SeriesModel {
  SeriesModel({
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

  SeriesModel copyWith({
    int code,
    String status,
    String copyright,
    String attributionText,
    String attributionHtml,
    String etag,
    Data data,
  }) =>
      SeriesModel(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory SeriesModel.fromMap(Map<String, dynamic> json) => SeriesModel(
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
  List<ResultSeries> results;

  Data copyWith({
    int offset,
    int limit,
    int total,
    int count,
    List<ResultSeries> results,
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
            : List<ResultSeries>.from(
                json["results"].map((x) => ResultSeries.fromMap(x))),
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

class ResultSeries {
  ResultSeries({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.startYear,
    this.endYear,
    this.rating,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.events,
    this.next,
    this.previous,
  });

  int id;
  String title;
  String description;
  String resourceUri;
  List<Url> urls;
  int startYear;
  int endYear;
  Rating rating;
  String type;
  String modified;
  Thumbnail thumbnail;
  Creators creators;
  Characters characters;
  Stories stories;
  Characters comics;
  Characters events;
  Next next;
  dynamic previous;

  ResultSeries copyWith({
    int id,
    String title,
    String description,
    String resourceUri,
    List<Url> urls,
    int startYear,
    int endYear,
    Rating rating,
    String type,
    String modified,
    Thumbnail thumbnail,
    Creators creators,
    Characters characters,
    Stories stories,
    Characters comics,
    Characters events,
    Next next,
    dynamic previous,
  }) =>
      ResultSeries(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        resourceUri: resourceUri ?? this.resourceUri,
        urls: urls ?? this.urls,
        startYear: startYear ?? this.startYear,
        endYear: endYear ?? this.endYear,
        rating: rating ?? this.rating,
        type: type ?? this.type,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
        creators: creators ?? this.creators,
        characters: characters ?? this.characters,
        stories: stories ?? this.stories,
        comics: comics ?? this.comics,
        events: events ?? this.events,
        next: next ?? this.next,
        previous: previous ?? this.previous,
      );

  factory ResultSeries.fromMap(Map<String, dynamic> json) => ResultSeries(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        urls: json["urls"] == null
            ? null
            : List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        startYear: json["startYear"] == null ? null : json["startYear"],
        endYear: json["endYear"] == null ? null : json["endYear"],
        rating:
            json["rating"] == null ? null : ratingValues.map[json["rating"]],
        type: json["type"] == null ? null : json["type"],
        modified: json["modified"] == null ? null : json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        creators: json["creators"] == null
            ? null
            : Creators.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        comics:
            json["comics"] == null ? null : Characters.fromMap(json["comics"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
        next: json["next"] == null ? null : Next.fromMap(json["next"]),
        previous: json["previous"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "resourceURI": resourceUri == null ? null : resourceUri,
        "urls": urls == null
            ? null
            : List<dynamic>.from(urls.map((x) => x.toMap())),
        "startYear": startYear == null ? null : startYear,
        "endYear": endYear == null ? null : endYear,
        "rating": rating == null ? null : ratingValues.reverse[rating],
        "type": type == null ? null : type,
        "modified": modified == null ? null : modified,
        "thumbnail": thumbnail == null ? null : thumbnail.toMap(),
        "creators": creators == null ? null : creators.toMap(),
        "characters": characters == null ? null : characters.toMap(),
        "stories": stories == null ? null : stories.toMap(),
        "comics": comics == null ? null : comics.toMap(),
        "events": events == null ? null : events.toMap(),
        "next": next == null ? null : next.toMap(),
        "previous": previous,
      };
}

class Characters {
  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int available;
  String collectionUri;
  List<Next> items;
  int returned;

  Characters copyWith({
    int available,
    String collectionUri,
    List<Next> items,
    int returned,
  }) =>
      Characters(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<Next>.from(json["items"].map((x) => Next.fromMap(x))),
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

class Next {
  Next({
    this.resourceUri,
    this.name,
  });

  String resourceUri;
  String name;

  Next copyWith({
    String resourceUri,
    String name,
  }) =>
      Next(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
      );

  factory Next.fromMap(Map<String, dynamic> json) => Next(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
      };
}

class Creators {
  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int available;
  String collectionUri;
  List<CreatorsItem> items;
  int returned;

  Creators copyWith({
    int available,
    String collectionUri,
    List<CreatorsItem> items,
    int returned,
  }) =>
      Creators(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Creators.fromMap(Map<String, dynamic> json) => Creators(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<CreatorsItem>.from(
                json["items"].map((x) => CreatorsItem.fromMap(x))),
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

class CreatorsItem {
  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  String resourceUri;
  String name;
  String role;

  CreatorsItem copyWith({
    String resourceUri,
    String name,
    String role,
  }) =>
      CreatorsItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        role: role ?? this.role,
      );

  factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "role": role == null ? null : role,
      };
}

enum Rating { EMPTY, RATED_T, marvel_PSR, RATING_RATED_T }

final ratingValues = EnumValues({
  "": Rating.EMPTY,
  "marvel Psr": Rating.marvel_PSR,
  "Rated T": Rating.RATED_T,
  "Rated T+": Rating.RATING_RATED_T
});

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

enum ItemType { COVER, INTERIOR_STORY }

final itemTypeValues = EnumValues(
    {"cover": ItemType.COVER, "interiorStory": ItemType.INTERIOR_STORY});

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

enum UrlType { DETAIL }

final urlTypeValues = EnumValues({"detail": UrlType.DETAIL});

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

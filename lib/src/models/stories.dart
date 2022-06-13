// To parse this JSON data, do
//
//     final storiesModel = storiesModelFromMap(jsonString);

import 'dart:convert';

StoriesModel storiesModelFromMap(String str) =>
    StoriesModel.fromMap(json.decode(str));

String storiesModelToMap(StoriesModel data) => json.encode(data.toMap());

class StoriesModel {
  StoriesModel({
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

  StoriesModel copyWith({
    int code,
    String status,
    String copyright,
    String attributionText,
    String attributionHtml,
    String etag,
    Data data,
  }) =>
      StoriesModel(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory StoriesModel.fromMap(Map<String, dynamic> json) => StoriesModel(
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
  List<ResultStories> results;

  Data copyWith({
    int offset,
    int limit,
    int total,
    int count,
    List<ResultStories> results,
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
            : List<ResultStories>.from(
                json["results"].map((x) => ResultStories.fromMap(x))),
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

class ResultStories {
  ResultStories({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.series,
    this.comics,
    this.events,
    this.originalIssue,
  });

  int id;
  String title;
  String description;
  String resourceUri;
  Type type;
  Modified modified;
  dynamic thumbnail;
  Characters creators;
  Characters characters;
  Characters series;
  Characters comics;
  Characters events;
  OriginalIssue originalIssue;

  ResultStories copyWith({
    int id,
    String title,
    String description,
    String resourceUri,
    Type type,
    Modified modified,
    dynamic thumbnail,
    Characters creators,
    Characters characters,
    Characters series,
    Characters comics,
    Characters events,
    OriginalIssue originalIssue,
  }) =>
      ResultStories(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        resourceUri: resourceUri ?? this.resourceUri,
        type: type ?? this.type,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
        creators: creators ?? this.creators,
        characters: characters ?? this.characters,
        series: series ?? this.series,
        comics: comics ?? this.comics,
        events: events ?? this.events,
        originalIssue: originalIssue ?? this.originalIssue,
      );

  factory ResultStories.fromMap(Map<String, dynamic> json) => ResultStories(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        modified: json["modified"] == null
            ? null
            : modifiedValues.map[json["modified"]],
        thumbnail: json["thumbnail"],
        creators: json["creators"] == null
            ? null
            : Characters.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        series:
            json["series"] == null ? null : Characters.fromMap(json["series"]),
        comics:
            json["comics"] == null ? null : Characters.fromMap(json["comics"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
        originalIssue: json["originalIssue"] == null
            ? null
            : OriginalIssue.fromMap(json["originalIssue"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "resourceURI": resourceUri == null ? null : resourceUri,
        "type": type == null ? null : typeValues.reverse[type],
        "modified": modified == null ? null : modifiedValues.reverse[modified],
        "thumbnail": thumbnail,
        "creators": creators == null ? null : creators.toMap(),
        "characters": characters == null ? null : characters.toMap(),
        "series": series == null ? null : series.toMap(),
        "comics": comics == null ? null : comics.toMap(),
        "events": events == null ? null : events.toMap(),
        "originalIssue": originalIssue == null ? null : originalIssue.toMap(),
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
  List<Item> items;
  int returned;

  Characters copyWith({
    int available,
    String collectionUri,
    List<Item> items,
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
            : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
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

class Item {
  Item({
    this.resourceUri,
    this.name,
    this.role,
  });

  String resourceUri;
  String name;
  Role role;

  Item copyWith({
    String resourceUri,
    String name,
    Role role,
  }) =>
      Item(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        role: role ?? this.role,
      );

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : roleValues.map[json["role"]],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "role": role == null ? null : roleValues.reverse[role],
      };
}

enum Role { COLORIST, WRITER, INKER, PENCILLER }

final roleValues = EnumValues({
  "colorist": Role.COLORIST,
  "inker": Role.INKER,
  "penciller": Role.PENCILLER,
  "writer": Role.WRITER
});

enum Modified { THE_19691231_T19_00000500, THE_20140127_T00_00000500 }

final modifiedValues = EnumValues({
  "1969-12-31T19:00:00-0500": Modified.THE_19691231_T19_00000500,
  "2014-01-27T00:00:00-0500": Modified.THE_20140127_T00_00000500
});

class OriginalIssue {
  OriginalIssue({
    this.resourceUri,
    this.name,
  });

  String resourceUri;
  String name;

  OriginalIssue copyWith({
    String resourceUri,
    String name,
  }) =>
      OriginalIssue(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
      );

  factory OriginalIssue.fromMap(Map<String, dynamic> json) => OriginalIssue(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
      };
}

enum Type { STORY }

final typeValues = EnumValues({"story": Type.STORY});

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

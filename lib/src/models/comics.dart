// To parse this JSON data, do
//
//     final comicsModel = comicsModelFromMap(jsonString);

import 'dart:convert';

ComicsModel comicsModelFromMap(String str) =>
    ComicsModel.fromMap(json.decode(str));

String comicsModelToMap(ComicsModel data) => json.encode(data.toMap());

class ComicsModel {
  ComicsModel({
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

  ComicsModel copyWith({
    int code,
    String status,
    String copyright,
    String attributionText,
    String attributionHtml,
    String etag,
    Data data,
  }) =>
      ComicsModel(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory ComicsModel.fromMap(Map<String, dynamic> json) => ComicsModel(
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
  List<ResultComics> results;

  Data copyWith({
    int offset,
    int limit,
    int total,
    int count,
    List<ResultComics> results,
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
            : List<ResultComics>.from(
                json["results"].map((x) => ResultComics.fromMap(x))),
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

class ResultComics {
  ResultComics({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  DiamondCode diamondCode;
  String ean;
  String issn;
  Format format;
  int pageCount;
  List<TextObject> textObjects;
  String resourceUri;
  List<Url> urls;
  Series series;
  List<Series> variants;
  List<dynamic> collections;
  List<Series> collectedIssues;
  List<Date> dates;
  List<Price> prices;
  Thumbnail thumbnail;
  List<Thumbnail> images;
  Creators creators;
  Characters characters;
  Stories stories;
  Characters events;

  ResultComics copyWith({
    int id,
    int digitalId,
    String title,
    int issueNumber,
    String variantDescription,
    String description,
    String modified,
    String isbn,
    String upc,
    DiamondCode diamondCode,
    String ean,
    String issn,
    Format format,
    int pageCount,
    List<TextObject> textObjects,
    String resourceUri,
    List<Url> urls,
    Series series,
    List<Series> variants,
    List<dynamic> collections,
    List<Series> collectedIssues,
    List<Date> dates,
    List<Price> prices,
    Thumbnail thumbnail,
    List<Thumbnail> images,
    Creators creators,
    Characters characters,
    Stories stories,
    Characters events,
  }) =>
      ResultComics(
        id: id ?? this.id,
        digitalId: digitalId ?? this.digitalId,
        title: title ?? this.title,
        issueNumber: issueNumber ?? this.issueNumber,
        variantDescription: variantDescription ?? this.variantDescription,
        description: description ?? this.description,
        modified: modified ?? this.modified,
        isbn: isbn ?? this.isbn,
        upc: upc ?? this.upc,
        diamondCode: diamondCode ?? this.diamondCode,
        ean: ean ?? this.ean,
        issn: issn ?? this.issn,
        format: format ?? this.format,
        pageCount: pageCount ?? this.pageCount,
        textObjects: textObjects ?? this.textObjects,
        resourceUri: resourceUri ?? this.resourceUri,
        urls: urls ?? this.urls,
        series: series ?? this.series,
        variants: variants ?? this.variants,
        collections: collections ?? this.collections,
        collectedIssues: collectedIssues ?? this.collectedIssues,
        dates: dates ?? this.dates,
        prices: prices ?? this.prices,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images ?? this.images,
        creators: creators ?? this.creators,
        characters: characters ?? this.characters,
        stories: stories ?? this.stories,
        events: events ?? this.events,
      );

  factory ResultComics.fromMap(Map<String, dynamic> json) => ResultComics(
        id: json["id"] == null ? null : json["id"],
        digitalId: json["digitalId"] == null ? null : json["digitalId"],
        title: json["title"] == null ? null : json["title"],
        issueNumber: json["issueNumber"] == null ? null : json["issueNumber"],
        variantDescription: json["variantDescription"] == null
            ? null
            : json["variantDescription"],
        description: json["description"] == null ? null : json["description"],
        modified: json["modified"] == null ? null : json["modified"],
        isbn: json["isbn"] == null ? null : json["isbn"],
        upc: json["upc"] == null ? null : json["upc"],
        diamondCode: json["diamondCode"] == null
            ? null
            : diamondCodeValues.map[json["diamondCode"]],
        ean: json["ean"] == null ? null : json["ean"],
        issn: json["issn"] == null ? null : json["issn"],
        format:
            json["format"] == null ? null : formatValues.map[json["format"]],
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        textObjects: json["textObjects"] == null
            ? null
            : List<TextObject>.from(
                json["textObjects"].map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        urls: json["urls"] == null
            ? null
            : List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        series: json["series"] == null ? null : Series.fromMap(json["series"]),
        variants: json["variants"] == null
            ? null
            : List<Series>.from(json["variants"].map((x) => Series.fromMap(x))),
        collections: json["collections"] == null
            ? null
            : List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues: json["collectedIssues"] == null
            ? null
            : List<Series>.from(
                json["collectedIssues"].map((x) => Series.fromMap(x))),
        dates: json["dates"] == null
            ? null
            : List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
        prices: json["prices"] == null
            ? null
            : List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        images: json["images"] == null
            ? null
            : List<Thumbnail>.from(
                json["images"].map((x) => Thumbnail.fromMap(x))),
        creators: json["creators"] == null
            ? null
            : Creators.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "digitalId": digitalId == null ? null : digitalId,
        "title": title == null ? null : title,
        "issueNumber": issueNumber == null ? null : issueNumber,
        "variantDescription":
            variantDescription == null ? null : variantDescription,
        "description": description == null ? null : description,
        "modified": modified == null ? null : modified,
        "isbn": isbn == null ? null : isbn,
        "upc": upc == null ? null : upc,
        "diamondCode":
            diamondCode == null ? null : diamondCodeValues.reverse[diamondCode],
        "ean": ean == null ? null : ean,
        "issn": issn == null ? null : issn,
        "format": format == null ? null : formatValues.reverse[format],
        "pageCount": pageCount == null ? null : pageCount,
        "textObjects": textObjects == null
            ? null
            : List<dynamic>.from(textObjects.map((x) => x.toMap())),
        "resourceURI": resourceUri == null ? null : resourceUri,
        "urls": urls == null
            ? null
            : List<dynamic>.from(urls.map((x) => x.toMap())),
        "series": series == null ? null : series.toMap(),
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants.map((x) => x.toMap())),
        "collections": collections == null
            ? null
            : List<dynamic>.from(collections.map((x) => x)),
        "collectedIssues": collectedIssues == null
            ? null
            : List<dynamic>.from(collectedIssues.map((x) => x.toMap())),
        "dates": dates == null
            ? null
            : List<dynamic>.from(dates.map((x) => x.toMap())),
        "prices": prices == null
            ? null
            : List<dynamic>.from(prices.map((x) => x.toMap())),
        "thumbnail": thumbnail == null ? null : thumbnail.toMap(),
        "images": images == null
            ? null
            : List<dynamic>.from(images.map((x) => x.toMap())),
        "creators": creators == null ? null : creators.toMap(),
        "characters": characters == null ? null : characters.toMap(),
        "stories": stories == null ? null : stories.toMap(),
        "events": events == null ? null : events.toMap(),
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
  List<Series> items;
  int returned;

  Characters copyWith({
    int available,
    String collectionUri,
    List<Series> items,
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
            : List<Series>.from(json["items"].map((x) => Series.fromMap(x))),
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

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  String resourceUri;
  String name;

  Series copyWith({
    String resourceUri,
    String name,
  }) =>
      Series(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
      );

  factory Series.fromMap(Map<String, dynamic> json) => Series(
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
  Role role;

  CreatorsItem copyWith({
    String resourceUri,
    String name,
    Role role,
  }) =>
      CreatorsItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        role: role ?? this.role,
      );

  factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
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

enum Role {
  EDITOR,
  PENCILLER_COVER,
  COLORIST,
  INKER,
  WRITER,
  PENCILLER,
  LETTERER,
  PENCILER
}

final roleValues = EnumValues({
  "colorist": Role.COLORIST,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "letterer": Role.LETTERER,
  "penciler": Role.PENCILER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  Date({
    this.type,
    this.date,
  });

  DateType type;
  String date;

  Date copyWith({
    DateType type,
    String date,
  }) =>
      Date(
        type: type ?? this.type,
        date: date ?? this.date,
      );

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: json["type"] == null ? null : dateTypeValues.map[json["type"]],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : dateTypeValues.reverse[type],
        "date": date == null ? null : date,
      };
}

enum DateType { ONSALE_DATE, FOC_DATE }

final dateTypeValues = EnumValues(
    {"focDate": DateType.FOC_DATE, "onsaleDate": DateType.ONSALE_DATE});

enum DiamondCode { EMPTY, JUL190068 }

final diamondCodeValues =
    EnumValues({"": DiamondCode.EMPTY, "JUL190068": DiamondCode.JUL190068});

enum Format { EMPTY, DIGEST, COMIC, TRADE_PAPERBACK }

final formatValues = EnumValues({
  "Comic": Format.COMIC,
  "Digest": Format.DIGEST,
  "": Format.EMPTY,
  "Trade Paperback": Format.TRADE_PAPERBACK
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

class Price {
  Price({
    this.type,
    this.price,
  });

  PriceType type;
  double price;

  Price copyWith({
    PriceType type,
    double price,
  }) =>
      Price(
        type: type ?? this.type,
        price: price ?? this.price,
      );

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: json["type"] == null ? null : priceTypeValues.map[json["type"]],
        price: json["price"] == null ? null : json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : priceTypeValues.reverse[type],
        "price": price == null ? null : price,
      };
}

enum PriceType { PRINT_PRICE }

final priceTypeValues = EnumValues({"printPrice": PriceType.PRINT_PRICE});

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

enum ItemType { COVER, INTERIOR_STORY, PROMO }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "interiorStory": ItemType.INTERIOR_STORY,
  "promo": ItemType.PROMO
});

class TextObject {
  TextObject({
    this.type,
    this.language,
    this.text,
  });

  TextObjectType type;
  Language language;
  String text;

  TextObject copyWith({
    TextObjectType type,
    Language language,
    String text,
  }) =>
      TextObject(
        type: type ?? this.type,
        language: language ?? this.language,
        text: text ?? this.text,
      );

  factory TextObject.fromMap(Map<String, dynamic> json) => TextObject(
        type: json["type"] == null
            ? null
            : textObjectTypeValues.map[json["type"]],
        language: json["language"] == null
            ? null
            : languageValues.map[json["language"]],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : textObjectTypeValues.reverse[type],
        "language": language == null ? null : languageValues.reverse[language],
        "text": text == null ? null : text,
      };
}

enum Language { EN_US }

final languageValues = EnumValues({"en-us": Language.EN_US});

enum TextObjectType { ISSUE_SOLICIT_TEXT }

final textObjectTypeValues =
    EnumValues({"issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT});

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

enum UrlType { DETAIL, PURCHASE }

final urlTypeValues =
    EnumValues({"detail": UrlType.DETAIL, "purchase": UrlType.PURCHASE});

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

import 'package:intl/intl.dart' as intl;

//Respons
StoriesModel getStoriesResponse(dynamic data) {
  print(data);
  return StoriesModel.fromJson(data);
}

class StoriesModel {
  String? status;
  String? copyright;
  String? section;
  String? lastUpdated;
  int? numResults;
  List<Results>? results;

  StoriesModel({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });

  StoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    section = json['section'];
    lastUpdated = json['last_updated'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      results =
          (json['results'] as List).map((v) => Results.fromJson(v)).toList();
    }
  }
}

class Results {
  String? section;
  String? subsection;
  String? title;
  String? abstractArtical;
  String? url;
  String? uri;
  String? byline;
  String? itemType;
  String? updatedDate;
  String? createdDate;
  String? publishedDate;
  String? materialTypeFacet;
  String? kicker;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Results({
    this.section,
    this.subsection,
    this.title,
    this.abstractArtical,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  Results.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    subsection = json['subsection'];
    title = json['title'];
    abstractArtical = json['abstract'];
    url = json['url'];
    uri = json['uri'];
    byline = json['byline'];
    itemType = json['item_type'];
    updatedDate = json['updated_date'];
    createdDate = intl.DateFormat('dd-MM-yyyy')
        .format(DateTime.parse(json['created_date']))
        .toString();
    publishedDate = intl.DateFormat('dd-MM-yyyy')
        .format(DateTime.parse(json['published_date']))
        .toString();

    materialTypeFacet = json['material_type_facet'];
    kicker = json['kicker'];
    desFacet = json['des_facet'].cast<String>();
    orgFacet = json['org_facet'].cast<String>();
    perFacet = json['per_facet'].cast<String>();
    geoFacet = json['geo_facet'].cast<String>();
    if (json['multimedia'] != null) {
      multimedia = (json['multimedia'] as List)
          .map((v) => Multimedia.fromJson(v))
          .toList();
    }
    shortUrl = json['short_url'];
  }
}

class Multimedia {
  String? url;
  String? format;
  int? height;
  int? width;
  String? type;
  String? subtype;
  String? caption;
  String? copyright;

  Multimedia({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });

  Multimedia.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
  }
}

class StoryWidgetItems {
  String? imageUrl;
  String? title;
  String? abstractArticl;
  String? publishDate;
  String? creatDate;
  StoryWidgetItems({
    this.imageUrl,
    this.title,
    this.publishDate,
    this.abstractArticl,
    this.creatDate,
  });
}

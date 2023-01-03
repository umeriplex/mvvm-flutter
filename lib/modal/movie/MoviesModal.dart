/// total : "22792"
/// page : 1
/// pages : 1140
/// tv_shows : [{"id":35624,"name":"The Flash","permalink":"the-flash","start_date":"2014-10-07","end_date":null,"country":"US","network":"The CW","status":"Running","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/35624.jpg"},{"id":23455,"name":"Game of Thrones","permalink":"game-of-thrones","start_date":"2011-04-17","end_date":null,"country":"US","network":"HBO","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/23455.jpg"},{"id":29560,"name":"Arrow","permalink":"arrow","start_date":"2012-10-10","end_date":null,"country":"US","network":"The CW","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/29560.jpg"},{"id":43467,"name":"Lucifer","permalink":"lucifer","start_date":"2016-01-25","end_date":null,"country":"US","network":"Netflix","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/43467.com"},{"id":43234,"name":"Supergirl","permalink":"supergirl","start_date":"2015-10-26","end_date":null,"country":"US","network":"The CW","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/43234.jpg"},{"id":46692,"name":"DC's Legends of Tomorrow","permalink":"dcs-legends-of-tomorrow","start_date":"2016-01-21","end_date":null,"country":"US","network":"The CW","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/46692.jpg"},{"id":24010,"name":"The Walking Dead","permalink":"the-walking-dead","start_date":"2010-10-31","end_date":null,"country":"US","network":"AMC+","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/24010.jpg"},{"id":46778,"name":"Stranger Things","permalink":"montauk","start_date":"2016-07-15","end_date":null,"country":"US","network":"Netflix","status":"Running","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/46778.jpg"},{"id":47145,"name":"Dragon Ball Super","permalink":"dragon-ball-super","start_date":"2015-07-05","end_date":null,"country":"JP","network":"Fuji TV","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/47145."},{"id":52439,"name":"Boku no Hero Academia","permalink":"boku-no-hero-academia","start_date":"2016-04-03","end_date":null,"country":"JP","network":"MBS","status":"Running","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/52439.jpg"},{"id":33514,"name":"The 100","permalink":"the-100","start_date":"2014-03-19","end_date":null,"country":"US","network":"The CW","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/33514.jpg"},{"id":22410,"name":"Sherlock","permalink":"sherlock","start_date":"2010-07-25","end_date":null,"country":"UK","network":"BBC One","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/22410.jpg"},{"id":5348,"name":"Supernatural","permalink":"supernatural","start_date":"2005-09-13","end_date":null,"country":"US","network":"The CW","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/5348.jpg"},{"id":8362,"name":"The Big Bang Theory","permalink":"the-big-bang-theory","start_date":"2007-09-24","end_date":null,"country":"US","network":"CBS","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/8362.jpg"},{"id":31452,"name":"Marvel's Agents of S.H.I.E.L.D.","permalink":"marvel-s-agents-of-s-h-i-e-l-d","start_date":"2013-09-24","end_date":null,"country":"US","network":"ABC","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/31452.jpg"},{"id":37444,"name":"Marvel's Daredevil","permalink":"daredevil","start_date":"2015-04-10","end_date":null,"country":"US","network":"Netflix","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/37444.jpg"},{"id":29977,"name":"Vikings","permalink":"vikings","start_date":"2013-03-03","end_date":null,"country":"CA","network":"History","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/29977.jpg"},{"id":29671,"name":"Gotham","permalink":"gotham","start_date":"2014-09-22","end_date":null,"country":"US","network":"FOX","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/29671.png"},{"id":36210,"name":"Westworld","permalink":"westworld","start_date":"2016-10-02","end_date":null,"country":"US","network":"HBO","status":"Ended","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/36210.jpg"},{"id":32157,"name":"Rick and Morty","permalink":"rick-and-morty","start_date":"2013-12-02","end_date":null,"country":"US","network":"Adult Swim","status":"Running","image_thumbnail_path":"https://static.episodate.com/images/tv-show/thumbnail/32157.jpg"}]

class MoviesModal {
  MoviesModal({
      String? total, 
      num? page, 
      num? pages, 
      List<TvShows>? tvShows,}){
    _total = total;
    _page = page;
    _pages = pages;
    _tvShows = tvShows;
}

  MoviesModal.fromJson(dynamic json) {
    _total = json['total'];
    _page = json['page'];
    _pages = json['pages'];
    if (json['tv_shows'] != null) {
      _tvShows = [];
      json['tv_shows'].forEach((v) {
        _tvShows?.add(TvShows.fromJson(v));
      });
    }
  }
  String? _total;
  num? _page;
  num? _pages;
  List<TvShows>? _tvShows;
MoviesModal copyWith({  String? total,
  num? page,
  num? pages,
  List<TvShows>? tvShows,
}) => MoviesModal(  total: total ?? _total,
  page: page ?? _page,
  pages: pages ?? _pages,
  tvShows: tvShows ?? _tvShows,
);
  String? get total => _total;
  num? get page => _page;
  num? get pages => _pages;
  List<TvShows>? get tvShows => _tvShows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['page'] = _page;
    map['pages'] = _pages;
    if (_tvShows != null) {
      map['tv_shows'] = _tvShows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 35624
/// name : "The Flash"
/// permalink : "the-flash"
/// start_date : "2014-10-07"
/// end_date : null
/// country : "US"
/// network : "The CW"
/// status : "Running"
/// image_thumbnail_path : "https://static.episodate.com/images/tv-show/thumbnail/35624.jpg"

class TvShows {
  TvShows({
      num? id, 
      String? name, 
      String? permalink, 
      String? startDate, 
      dynamic endDate, 
      String? country, 
      String? network, 
      String? status, 
      String? imageThumbnailPath,}){
    _id = id;
    _name = name;
    _permalink = permalink;
    _startDate = startDate;
    _endDate = endDate;
    _country = country;
    _network = network;
    _status = status;
    _imageThumbnailPath = imageThumbnailPath;
}

  TvShows.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _permalink = json['permalink'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _country = json['country'];
    _network = json['network'];
    _status = json['status'];
    _imageThumbnailPath = json['image_thumbnail_path'];
  }
  num? _id;
  String? _name;
  String? _permalink;
  String? _startDate;
  dynamic _endDate;
  String? _country;
  String? _network;
  String? _status;
  String? _imageThumbnailPath;
TvShows copyWith({  num? id,
  String? name,
  String? permalink,
  String? startDate,
  dynamic endDate,
  String? country,
  String? network,
  String? status,
  String? imageThumbnailPath,
}) => TvShows(  id: id ?? _id,
  name: name ?? _name,
  permalink: permalink ?? _permalink,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  country: country ?? _country,
  network: network ?? _network,
  status: status ?? _status,
  imageThumbnailPath: imageThumbnailPath ?? _imageThumbnailPath,
);
  num? get id => _id;
  String? get name => _name;
  String? get permalink => _permalink;
  String? get startDate => _startDate;
  dynamic get endDate => _endDate;
  String? get country => _country;
  String? get network => _network;
  String? get status => _status;
  String? get imageThumbnailPath => _imageThumbnailPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['permalink'] = _permalink;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['country'] = _country;
    map['network'] = _network;
    map['status'] = _status;
    map['image_thumbnail_path'] = _imageThumbnailPath;
    return map;
  }

}
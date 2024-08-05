class PixaBayModal{
  List<Hit> hits = [];

  PixaBayModal({required this.hits});

  factory PixaBayModal.fromjson(Map m1)
  {
    return PixaBayModal(hits: (m1['hits'] as List).map((e)=>Hit.fromjson(e)).toList());
  }
}

class Hit
{
  late String tags,largeImageURL;
  late int views,downloads,likes;

  Hit({required this.tags,required this.largeImageURL,required this.views,required this.downloads,required this.likes});

  factory Hit.fromjson(Map m1)
  {
    return Hit(tags: m1['tags'], largeImageURL: m1['largeImageURL'], views: m1['views'], downloads: m1['downloads'], likes: m1['likes']) ;
  }
}
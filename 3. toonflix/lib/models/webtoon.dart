class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel({
    required this.title,
    required this.thumb,
    required this.id,
  });

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  // {"title":"입학용병","thumb":"https://shared-comic.pstatic.net/thumb/webtoon/758150/thumbnail/thumbnail_IMAG21_4135492154714961716.jpg","id":"758150"}
}

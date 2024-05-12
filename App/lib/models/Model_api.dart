class ModelApi {
  ModelApi({
    required String name,
    required num percentage,
  })   : _name = name,
        _percentage = percentage;

  ModelApi.fromJson(Map<String, dynamic> json)
      : _name = json['Name'],
        _percentage = json['Percentage'];

  String _name;
  num _percentage;

  ModelApi copyWith({
    String? name,
    num? percentage,
  }) =>
      ModelApi(
        name: name ?? _name,
        percentage: percentage ?? _percentage,
      );

  String get name => _name;
  num get percentage => _percentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Percentage'] = _percentage;
    return map;
  }
}

class JdModel {
  String name;
  String company;
  String jobSummary;
  String responsibities;
  String skils;
  String eligbilty;
  String pay;
  String experience;
  String jobType;
  String location;
  int openings;
  String startDate;
  String endDate;

  JdModel({
    required this.name,
    required this.company,
    required this.jobSummary,
    required this.responsibities,
    required this.skils,
    required this.eligbilty,
    required this.pay,
    required this.experience,
    required this.jobType,
    required this.location,
    required this.openings,
    required this.startDate,
    required this.endDate,
  });

  factory JdModel.fromJson(Map<String, dynamic> json) {
    return JdModel(
      name: json['name'],
      company: json['company'],
      jobSummary: json['jobSummary'],
      responsibities: json['responsibities'],
      skils: json['skils'],
      eligbilty: json['eligbilty'],
      pay: json['pay'],
      experience: json['experience'],
      jobType: json['jobType'],
      location: json['location'],
      openings: json['openings'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'company': company,
      'jobSummary': jobSummary,
      'responsibities': responsibities,
      'skils': skils,
      'eligbilty': eligbilty,
      'pay': pay,
      'experience': experience,
      'jobType': jobType,
      'location': location,
      'openings': openings,
      'startDate': startDate,
      'endDate': endDate,
    };
    return data;
  }
}

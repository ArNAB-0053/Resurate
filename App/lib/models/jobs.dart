class Job {
  final int jobId;
  final String salary;
  final String size;
  final double rating;
  final int experience;
  final String company;
  final String category;
  final String applicandName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Job(
      {required this.jobId,
        required this.salary,
        required this.size,
        required this.rating,
        required this.experience,
        required this.company,
        required this.category,
        required this.applicandName,
        required this.imageURL,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Job> joblist = [
    Job(
        jobId: 0,
        salary: "22K",
        category: 'Android',
        applicandName: 'Dwaipayan',
        size: 'Small',
        rating: 4.5,
        experience: 4,
        company: 'Microsoft',
        imageURL: 'assets/images/microsoft.png',
        isFavorated: true,
        decription:
        'This ia a Android Developer',
        isSelected: false),
    Job(
        jobId: 1,
        salary: "21K",
        category: 'Web',
        applicandName: 'Tatay',
        size: 'Small',
        rating: 4.5,
        experience: 4,
        company: 'Amazon',
        imageURL: 'assets/images/amazon.png',
        isFavorated: true,
        decription:
        'This is a web developer',
        isSelected: false),
    Job(
        jobId: 2,
        salary: "11K",
        category: 'UI/UX',
        applicandName: 'SM',
        size: 'Small',
        rating: 4.5,
        experience: 4,
        company: 'Cognizent',
        imageURL: 'assets/images/cognizant.png',
        isFavorated: true,
        decription:
        'This is a UI/UX developer',
        isSelected: false),

  ];

  //Get the favorated items
  static List<Job> getFavoritedPlants(){
    List<Job> _travelList = Job.joblist;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Job> addedToCartPlants(){
    List<Job> _selectedJobs = Job.joblist;
    return _selectedJobs.where((element) => element.isSelected == true).toList();
  }
}
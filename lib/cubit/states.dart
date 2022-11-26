// ignore_for_file: camel_case_types

abstract class cubitStates {}

class inialStates extends cubitStates {}

class buttomNavStates extends cubitStates {}

class NewsBussinessGetLoading extends cubitStates {}

class NewsBusinessGetDAataSucsses extends cubitStates {}

class NewsBusinessGetDAataError extends cubitStates {
  late final String? erorr;
  NewsBusinessGetDAataError(this.erorr);
}

class NewsSportssGetLoading extends cubitStates {}

class NewsSportsGetDAataSucsses extends cubitStates {}

class NewsSportsGetDAataError extends cubitStates {
  late final String? erorr;
  NewsSportsGetDAataError(this.erorr);
}

class NewsScienceGetLoading extends cubitStates {}

class NewsScienceGetDAataSucsses extends cubitStates {}

class NewsScienceGetDAataError extends cubitStates {
  late final String? erorr;
  NewsScienceGetDAataError(this.erorr);
}

class NewsSearchGetLoading extends cubitStates {}

class NewsSearchGetDAataSucsses extends cubitStates {}

class NewsSearchGetDAataError extends cubitStates {
  late final String? erorr;
  NewsSearchGetDAataError(this.erorr);
}

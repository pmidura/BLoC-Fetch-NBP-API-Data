part of 'api_bloc.dart';

class ApiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApiLoadingState extends ApiState {}

class ApiLoadedState extends ApiState {
  final List<MidModel> midList;
  final List<BidAskModel> bidAskList;

  ApiLoadedState({
    required this.midList,
    required this.bidAskList,
  });

  List<MidModel> get getMidModel => midList;
  List<BidAskModel> get getBidAskModel => bidAskList;

  @override
  List<Object?> get props => [midList, bidAskList];
}

class ApiErrorState extends ApiState {
  final String error;

  ApiErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}

part of 'api_bloc.dart';

class ApiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDataEvent extends ApiEvent {
  final String currency;

  FetchDataEvent({
    required this.currency,
  });

  @override
  List<Object?> get props => [currency];
}

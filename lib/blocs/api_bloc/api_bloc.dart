import 'package:bloc_fetch_api_data/models/bid_ask_model.dart';
import 'package:bloc_fetch_api_data/models/mid_model.dart';
import 'package:bloc_fetch_api_data/repos/bid_ask_repo.dart';
import 'package:bloc_fetch_api_data/repos/mid_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final MidRepo midRepo;
  final BidAskRepo bidAskRepo;

  ApiBloc(this.midRepo, this.bidAskRepo) : super(ApiLoadingState()) {
    on<FetchDataEvent>((event, emit) async {
      emit(ApiLoadingState());

      try {
        final midData = await midRepo.getMidRates(event.currency);
        final bidAskData = await bidAskRepo.getBidAskRates(event.currency);

        emit(ApiLoadedState(midList: midData, bidAskList: bidAskData));
      }
      catch (ex) {
        emit(ApiErrorState(error: ex.toString()));
      }
    });
  }
}

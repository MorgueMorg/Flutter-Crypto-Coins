import 'package:crypto_coins_array/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<CryptoListEvent>((event, emit) async {
      try {
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (error) {
        emit(CryptoListLoadingFailure(exception: error));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}

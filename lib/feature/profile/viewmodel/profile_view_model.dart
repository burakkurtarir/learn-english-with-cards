import 'package:mobx/mobx.dart';

import '../../cards/service/cards_repository.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  final CardsRepository cardRepository = CardsRepository.init();

  
}

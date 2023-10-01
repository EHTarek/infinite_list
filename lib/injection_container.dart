import 'package:get_it/get_it.dart';
import 'package:infinite_list/api/provider/person_data.dart';
import 'package:infinite_list/bloc/person_bloc/person_bloc.dart';

GetIt sl = GetIt.instance;

void init() {
  sl.registerFactory(() {
    print('================ Person Bloc ===============');
    return PersonBloc(data: sl());
  });

  sl.registerLazySingleton<PersonData>(() {
    print('================ Person Data ===============');
    return PersonDataImpl();
  });

}

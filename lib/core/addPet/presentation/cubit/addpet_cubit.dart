import 'package:adoptini_app/core/addPet/domain/usecases/add_pet_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'addpet_state.dart';
part 'addpet_cubit.freezed.dart';

class AddpetCubit extends Cubit<AddpetState> {
  final AddPetUsecase addPetUsecase;
  AddpetCubit(this.addPetUsecase) : super(const AddpetState.initial());

  Future<void> addPet(
      String name, String age, String gender, String size, String type, String image, String description, String ownerId ) async {
    try {
      emit(const AddpetState.loading());
      await addPetUsecase(
        name,
        age,
        gender,
        size,
        type,
        image,
        description,
        ownerId
      );
      emit(const AddpetState.loaded());
    } catch (e) {
      emit(const AddpetState.error(errorMessage: "Failed to add pet"));
    }
  }
}

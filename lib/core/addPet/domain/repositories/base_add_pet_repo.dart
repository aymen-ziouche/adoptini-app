abstract class BaseAddPetRepo{
  Future<void> savePet(String name, String age, String gender, String size, String type, String image, String description, String ownerId);
}
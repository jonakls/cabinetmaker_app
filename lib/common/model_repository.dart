import '../model/model.dart';

abstract class ModelRepository<T extends Model> {
  void add(T object);

  void remove(T object);

  void update(T object);

  void clear();

  T? findById(String id);

  T? findByEmail(String email);
}

import 'package:cat_fact_application/data/models/cat_fact_and_photo.dart';
import 'package:cat_fact_application/data/models/fact.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CatStorageService {
  Future<void> saveCatFact(CatFactAndPhoto catFactAndPhoto);

  Future<List<CatFactAndPhoto>> getShownCatFact();
}

class CatStorageServiceImpl implements CatStorageService {
  CatStorageServiceImpl() {
    Hive.registerAdapter(CatFactAndPhotoAdapter());
    Hive.registerAdapter(FactAdapter());
  }

  static const _catBoxKey = 'catBox';
  static const _catFactKey = 'catFact';

  @override
  Future<List<CatFactAndPhoto>> getShownCatFact() async {
    final box = await Hive.openBox(_catBoxKey);
    final facts = List<CatFactAndPhoto>.from(box.get(_catFactKey));
    return facts;
  }

  @override
  Future<void> saveCatFact(CatFactAndPhoto catFactAndPhoto) async {
    final box = await Hive.openBox(_catBoxKey);
    final list = box.get(_catFactKey) ?? [];
    list.add(catFactAndPhoto);
    await box.put(_catFactKey, list);
  }
}

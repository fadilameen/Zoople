import 'package:apiriverpod/apiservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/Products.dart';

final userDataProvider = FutureProvider<List<Products>?>((ref) async {
  return ref.watch(apiprovider).fetchdata();
});

import 'package:firebase_database/firebase_database.dart';
import 'package:date_format/date_format.dart';

class MemoDB {
  late DatabaseReference ref;
  late String userId;
  late String formatedDate;
  MemoDB(
    this.userId,
    DateTime date,
  ) {
    formatedDate = formatDate(date, [yyyy, mm, dd]);
    ref = FirebaseDatabase.instance.ref("$userId/$formatedDate");
  }

  Future<String?> getMemo() async {
    final snapshot = await ref.child('memo').get();
    if (snapshot.exists) {
      return snapshot.value.toString();
    } else {
      return "";
    }
  }

  void setMemo(String memo) async {
    ref.update({
      "memo": memo,
    });
  }
}

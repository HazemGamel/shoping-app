import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialapp/models/usermodel.dart';

class Firestormodel{
  final CollectionReference _collectionRef=FirebaseFirestore.instance.collection('users');

Future<void> addtofirstore(UserModel userModel)async{
  await _collectionRef.doc(userModel.userId).set(userModel.toJson());
  }

  Future currentuser(String uid)async => await _collectionRef.doc(uid).get();
}
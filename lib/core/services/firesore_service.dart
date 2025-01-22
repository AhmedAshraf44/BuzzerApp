import 'package:buzzer_app/core/utils/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addRestaurantData(
      {required String path,
      required List<Map<String, dynamic>> data,
      String? documentId}) async {
    for (var restaurant in data) {
      await firestore.collection(path).doc(documentId).set(restaurant);
    }
  }

  Future<Map<String, dynamic>> getData(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.data() as Map<String, dynamic>;
  }

  Future<DocumentReference<Map<String, dynamic>>> updateProductQuantity(
      {required String path, required String docuementId}) async {
    return firestore.collection(path).doc(docuementId);
  }

  Future<void> addDataToCartFireStore(
      {required String path,
      required List<Product> products,
      String? documentId}) async {
    List<Map<String, dynamic>> cartData =
        products.map((product) => product.toJson()).toList();
    await firestore
        .collection(path)
        .doc(documentId)
        .set({"products": cartData});
  }
}

//   Future<void> phoneNumberAuthentation({
//     required String phone,
//     required PhoneVerificationCompleted verificationCompleted,
//     required PhoneVerificationFailed verificationFailed,
//     required PhoneCodeSent codeSent,
//     required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
//   }) async {
//     await fireAuth.verifyPhoneNumber(
//         phoneNumber: phone,
//         verificationCompleted: verificationCompleted,
//         verificationFailed: verificationFailed,
//         codeSent: codeSent,
//         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   }

//   Future<PhoneAuthProvider> verifyOTP(
//       {required String otp, required String verificationId}) async {
//     final credential = PhoneAuthProvider.credential(
//         verificationId: verificationId, smsCode: otp);
//     final userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }

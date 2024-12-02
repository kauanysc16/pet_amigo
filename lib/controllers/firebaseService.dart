import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Método para fazer login com email e senha
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Erro ao fazer login: ${e.message}");
      return null;
    } catch (e) {
      print("Erro desconhecido ao fazer login: $e");
      return null;
    }
  }

  // Método para registrar um novo usuário
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Erro ao registrar: ${e.message}");
      return null;
    } catch (e) {
      print("Erro desconhecido ao registrar: $e");
      return null;
    }
  }

  // Método para fazer logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Método para obter dados de um documento no Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String userId) async {
    try {
      return await _firestore.collection('users').doc(userId).get();
    } on FirebaseException catch (e) {
      print("Erro ao obter dados do usuário: ${e.message}");
      rethrow;
    } catch (e) {
      print("Erro desconhecido ao obter dados do usuário: $e");
      rethrow;
    }
  }

  // Método para salvar dados no Firestore
  Future<void> saveUserData(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).set(data);
    } on FirebaseException catch (e) {
      print("Erro ao salvar dados: ${e.message}");
    } catch (e) {
      print("Erro desconhecido ao salvar dados: $e");
    }
  }

  // Método para upload de arquivo para o Firebase Storage
  Future<String?> uploadFile(String filePath, String fileName) async {
    try {
      final file = File(filePath);
      final storageRef = _storage.ref().child('uploads/$fileName');
      final uploadTask = storageRef.putFile(file);

      final taskSnapshot = await uploadTask.whenComplete(() => {});
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      print("Erro ao fazer upload: ${e.message}");
      return null;
    } catch (e) {
      print("Erro desconhecido ao fazer upload: $e");
      return null;
    }
  }
}

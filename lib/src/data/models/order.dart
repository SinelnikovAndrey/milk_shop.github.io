import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final DocumentReference store;
  final DocumentReference user;
  final List<DocumentReference> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String phoneTelegram;
  final String phoneWhatsApp;

  const Order({
    required this.phoneWhatsApp,
    required this.phoneTelegram,
    required this.id,
    required this.store,
    required this.user,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
  });

  Order copyWith({
    String? id,
    DocumentReference? store,
    DocumentReference? user,
    List<DocumentReference>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? phoneTelegram,
    String? phoneWhatsApp,
  }) {
    return Order(
      id: id ?? this.id,
      store: store ?? this.store,
      user: user ?? this.user,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt, 
      phoneTelegram: phoneTelegram ?? this.phoneTelegram,
      phoneWhatsApp: phoneWhatsApp ?? this.phoneWhatsApp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'store': store,
      'user': user,
      'products': products,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      store: map['store'],
      user: map['user'],
      products: map['products'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'], 
      phoneWhatsApp: 'phoneWhatsApp', 
      phoneTelegram: 'phoneTelegram',
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        store,
        user,
        products,
        createdAt,
        updatedAt,
        phoneTelegram,
        phoneWhatsApp,
      ];
}

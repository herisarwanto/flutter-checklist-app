import 'package:equatable/equatable.dart';

class ChecklistModel extends Equatable {
  const ChecklistModel({
    this.id,
    this.name,
    this.items,
    this.checklistCompletionStatus,
  });

  factory ChecklistModel.fromJson(Map<String, dynamic> map) {
    return ChecklistModel(
      id: map['id'] as int? ?? 0,
      name: map['name'] as String? ?? '',
      // items: map['items'] as List<Item>?,
      items: map['items'] != null
          ? List.from((map['items'] as List).map((e) => Item.fromJson(
                e as Map<String, dynamic>? ?? {},
              )))
          : [],
      checklistCompletionStatus:
          map['checklistCompletionStatus'] as bool? ?? false,
    );
  }

  final int? id;
  final String? name;
  final List<Item>? items;
  final bool? checklistCompletionStatus;

  ChecklistModel copyWith({
    int? id,
    String? name,
    List<Item>? items,
    bool? checklistCompletionStatus,
  }) =>
      ChecklistModel(
        id: id ?? this.id,
        name: name ?? this.name,
        items: items ?? this.items,
        checklistCompletionStatus:
            checklistCompletionStatus ?? this.checklistCompletionStatus,
      );

  @override
  List<Object?> get props => [id, name, items, checklistCompletionStatus];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'items': items,
      'checklistCompletionStatus': checklistCompletionStatus,
    };
  }
}

class Item {
  Item({
    this.id,
    this.name,
    this.itemCompletionStatus,
  });

  final int? id;
  final String? name;
  final bool? itemCompletionStatus;


  Item copyWith({
    int? id,
    String? name,
    bool? itemCompletionStatus,
  }) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        itemCompletionStatus: itemCompletionStatus ?? this.itemCompletionStatus,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'itemCompletionStatus': this.itemCompletionStatus,
    };
  }

  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      itemCompletionStatus: map['itemCompletionStatus'] as bool,
    );
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_crud/models/item.dart';

class SupabaseService {
  final SupabaseClient client;

  SupabaseService(this.client);

  // Create
  Future<void> createItem(Item item) async {
    await client.from('items').insert(item.toJson());
  }

  // Read
  Future<List<Item>> fetchItems() async {
    final response = await client.from('items').select();
    return (response as List)
        .map((item) => Item.fromJson(item))
        .toList();
  }

  // Update
  Future<void> updateItem(Item item) async {
    await client
        .from('items')
        .update(item.toJson())
        .eq('id', item.id!);
  }

  // Delete
  Future<void> deleteItem(int id) async {
    await client.from('items').delete().eq('id', id);
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient _client = Supabase.instance.client;

  // Initialize Supabase (call this in main.dart)
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: 'YOUR_SUPABASE_URL', // Replace with your Supabase URL
      anonKey: 'YOUR_SUPABASE_ANON_KEY', // Replace with your Supabase anon key
    );
  }

  // INSERT - Add new earnings record
  static Future<void> insertEarnings({
    required double distance,
    required double rate,
    required double baseFare,
    required double platformCommission,
    required double tip,
    required double totalEarnings,
  }) async {
    try {
      await _client.from('earnings').insert({
        'distance': distance,
        'rate': rate,
        'base_fare': baseFare,
        'platform_commission': platformCommission,
        'tip': tip,
        'total_earnings': totalEarnings,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to insert earnings: $e');
    }
  }

  // READ - Get all earnings records
  static Future<List<Map<String, dynamic>>> getAllEarnings() async {
    try {
      final response = await _client
          .from('earnings')
          .select()
          .order('created_at', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to fetch earnings: $e');
    }
  }

  // READ - Get single earnings record by ID
  static Future<Map<String, dynamic>?> getEarningsById(int id) async {
    try {
      final response = await _client
          .from('earnings')
          .select()
          .eq('id', id)
          .single();
      return response as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to fetch earnings: $e');
    }
  }

  // UPDATE - Update earnings record
  static Future<void> updateEarnings({
    required int id,
    required double distance,
    required double rate,
    required double baseFare,
    required double platformCommission,
    required double tip,
    required double totalEarnings,
  }) async {
    try {
      await _client
          .from('earnings')
          .update({
            'distance': distance,
            'rate': rate,
            'base_fare': baseFare,
            'platform_commission': platformCommission,
            'tip': tip,
            'total_earnings': totalEarnings,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', id);
    } catch (e) {
      throw Exception('Failed to update earnings: $e');
    }
  }

  // DELETE - Delete earnings record
  static Future<void> deleteEarnings(int id) async {
    try {
      await _client.from('earnings').delete().eq('id', id);
    } catch (e) {
      throw Exception('Failed to delete earnings: $e');
    }
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> initSupabase() async {
  await Supabase.initialize(
    url: 'https://koqyemdaxxviobjrglpt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtvcXllbWRheHh2aW9ianJnbHB0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAwODcxNTEsImV4cCI6MjA2NTY2MzE1MX0.ueJ8JukkfNgXiF_9T2PtIXUCk11-gvRenBYXfOIDGfo',
  );
}

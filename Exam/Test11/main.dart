import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dmqlgfdhpywddxkgwfkx.supabase.co',
    anonKey: 'sb_publishable_ROv6h2qqZ7tTdE0S43V3dg_3RQCgvx_',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfile(),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  final countryController = TextEditingController();
  final imageController = TextEditingController();

  SupabaseClient get supabase => Supabase.instance.client;

  List users = [];
  int? editingId;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  // CREATE & UPDATE
  Future<void> saveData() async {
    if (editingId == null) {
      await supabase.from('usersI').insert({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'dob': dobController.text,
        'country': countryController.text,
        'image': imageController.text,
      });
    } else {
      await supabase.from('usersI').update({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'dob': dobController.text,
        'country': countryController.text,
        'image': imageController.text,
      }).eq('id', editingId!);

      editingId = null;
    }

    clearFields();
    fetchUsers();
  }

  // READ
  Future<void> fetchUsers() async {
    final data = await supabase.from('usersI').select();
    setState(() {
      users = data;
    });
  }

  // DELETE
  Future<void> deleteUser(int id) async {
    await supabase.from('usersI').delete().eq('id', id);
    fetchUsers();
  }

  // EDIT
  void editUser(Map user) {
    setState(() {
      editingId = user['id'];
      nameController.text = user['name'];
      emailController.text = user['email'];
      passwordController.text = user['password'];
      dobController.text = user['dob'];
      countryController.text = user['country'];
      imageController.text = user['image'] ?? "";
    });
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    dobController.clear();
    countryController.clear();
    imageController.clear();
  }

  Widget _getProfileImage(dynamic imageUrl) {
    final url = imageUrl?.toString().trim() ?? '';
    
    // Check if URL is valid and starts with http
    if (url.isNotEmpty && url.startsWith('http')) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        cacheHeight: 120,
        cacheWidth: 120,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[300],
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          print('Image error: $error');
          return _defaultAvatar();
        },
      );
    }
    // Use default avatar if no valid URL
    return _defaultAvatar();
  }

  Widget _defaultAvatar() {
    return Container(
      color: Colors.grey[300],
      child: Icon(
        Icons.person,
        size: 50,
        color: Colors.grey[600],
      ),
    );
  }
  }

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white54),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A237E), Color(0xFF0D47A1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: imageController.text.isNotEmpty
                        ? NetworkImage(imageController.text)
                        : NetworkImage("https://i.pravatar.cc/300"),
                  ),
                ),

                SizedBox(height: 30),

                Text("Name", style: TextStyle(color: Colors.white70)),
                TextField(controller: nameController, style: TextStyle(color: Colors.white), decoration: inputStyle("Enter Name")),

                SizedBox(height: 15),

                Text("Email", style: TextStyle(color: Colors.white70)),
                TextField(controller: emailController, style: TextStyle(color: Colors.white), decoration: inputStyle("Enter Email")),

                SizedBox(height: 15),

                Text("Password", style: TextStyle(color: Colors.white70)),
                TextField(controller: passwordController, obscureText: true, style: TextStyle(color: Colors.white), decoration: inputStyle("Enter Password")),

                SizedBox(height: 15),

                Text("Date of Birth", style: TextStyle(color: Colors.white70)),
                TextField(controller: dobController, style: TextStyle(color: Colors.white), decoration: inputStyle("Enter DOB")),

                SizedBox(height: 15),

                Text("Country/Region", style: TextStyle(color: Colors.white70)),
                TextField(controller: countryController, style: TextStyle(color: Colors.white), decoration: inputStyle("Enter Country")),

                SizedBox(height: 15),

                Text("Image URL", style: TextStyle(color: Colors.white70)),
                TextField(controller: imageController, style: TextStyle(color: Colors.white), decoration: inputStyle("Paste Image URL")),

                SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: saveData,
                    child: Text(editingId == null ? "Save Changes" : "Update Profile"),
                  ),
                ),

                SizedBox(height: 30),

                Divider(color: Colors.white38),

                SizedBox(height: 10),

                // CARD VIEW
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [

                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[300],
                            child: ClipOval(
                              child: _getProfileImage(user['image']),
                            ),
                          ),

                          SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(user['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(user['email'],
                                    style: TextStyle(
                                        color: Colors.white70)),
                              ],
                            ),
                          ),

                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.lightBlue),
                            onPressed: () => editUser(user),
                          ),

                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteUser(user['id']),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyUniversityApp());
}

class MyUniversityApp extends StatelessWidget {
  const MyUniversityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _message = 'Welcome to my Flutter App!';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _message = 'Button pressed $_counter time${_counter == 1 ? '' : 's'}!';
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _message = 'Counter has been reset!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('University Assignment App'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Profile Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.school,
                          size: 80,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Student Name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Student ID: 123456',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Computer Science Department',
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Counter Section
                Card(
                  elevation: 4,
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          _message,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '$_counter',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _incrementCounter,
                              icon: const Icon(Icons.add),
                              label: const Text('Increment'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton.icon(
                              onPressed: _resetCounter,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Reset'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Info Section
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About This App',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'This is a basic Flutter application created for a university assignment. It demonstrates:',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        const ListTile(
                          leading: Icon(Icons.check_circle, color: Colors.green),
                          title: Text('StatefulWidget usage'),
                          dense: true,
                        ),
                        const ListTile(
                          leading: Icon(Icons.check_circle, color: Colors.green),
                          title: Text('Material Design components'),
                          dense: true,
                        ),
                        const ListTile(
                          leading: Icon(Icons.check_circle, color: Colors.green),
                          title: Text('State management'),
                          dense: true,
                        ),
                        const ListTile(
                          leading: Icon(Icons.check_circle, color: Colors.green),
                          title: Text('Responsive layout'),
                          dense: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

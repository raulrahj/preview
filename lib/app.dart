
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 1; // Default to Experience page

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const ExperiencePage(),
    const ProjectsPage(),
    const ContactPage(),
    const HighlightsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
       appBar: AppBar(
        title: const Text('Portfolio'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Experience',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Highlights',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
} 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page (Placeholder)', style: TextStyle(fontSize: 24)),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Experienced software developer with a passion for building robust and scalable applications. Skilled in Flutter, Dart, and modern development practices.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Work Experience',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Software Engineer'),
              subtitle: Text('ABC Tech Solutions\nJan 2020 - Present'),
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Junior Developer'),
              subtitle: Text('XYZ Innovations\nJun 2018 - Dec 2019'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Portfolio Website',
        'description': 'A personal website to showcase my work and skills.',
        'thumbnail': Icons.web,
      },
      {
        'title': 'Task Manager App',
        'description': 'A mobile app to manage daily tasks and productivity.',
        'thumbnail': Icons.check_circle,
      },
      {
        'title': 'E-commerce Platform',
        'description': 'A full-featured e-commerce solution for small businesses.',
        'thumbnail': Icons.shopping_cart,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              child: Icon(project['thumbnail'] as IconData),
            ),
            title: Text(project['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(project['description'] as String),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: \'${project['title']}\'')),
              );
            },
          ),
        );
      },
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();
    final additionalController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Contact Me', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Please enter your email';
                        final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+');
                        if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) => value == null || value.isEmpty ? 'Please enter a message' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: additionalController,
                      decoration: const InputDecoration(
                        labelText: 'Additional Details',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Message sent! (Not really, this is a demo.)')),
                          );
                        }
                      },
                      child: const Text('Send'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.linked_camera), // Use LinkedIn icon if available
                tooltip: 'LinkedIn',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open LinkedIn (placeholder)')),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.alternate_email), // Use X/Twitter icon if available
                tooltip: 'X',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open X (Twitter) (placeholder)')),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.code), // Use GitHub icon if available
                tooltip: 'GitHub',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open GitHub (placeholder)')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HighlightsPage extends StatelessWidget {
  const HighlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Highlights Page (Placeholder)', style: TextStyle(fontSize: 24)),
    );
  }
}

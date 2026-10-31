
import 'package:flutter/material.dart';

void main() {
  runApp(const LostFoundApp());
}

class LostFoundApp extends StatelessWidget {
  const LostFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Lost and Found',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


class LostItem {
  final String name;
  final String location;
  final String status;
  final String description;
  final String date;
  final IconData icon;

  const LostItem({
    required this.name,
    required this.location,
    required this.status,
    required this.description,
    required this.date,
    required this.icon,
  });
}


const List<LostItem> items = [
  LostItem(
    name: 'Student ID Card',
    location: 'Library',
    status: 'Lost',
    description: 'A student identification card was found missing '
        'near the library entrance.',
    date: '20 October 2026',
    icon: Icons.badge,
  ),
  LostItem(
    name: 'Blue Backpack',
    location: 'Cafeteria',
    status: 'Found',
    description: 'A blue backpack was found on a chair in the cafeteria.',
    date: '21 October 2026',
    icon: Icons.backpack,
  ),
  LostItem(
    name: 'Mobile Phone',
    location: 'Computer Lab',
    status: 'Lost',
    description: 'A black mobile phone was last seen in the computer lab.',
    date: '22 October 2026',
    icon: Icons.phone_android,
  ),
  LostItem(
    name: 'Water Bottle',
    location: 'Sports Ground',
    status: 'Found',
    description: 'A stainless steel water bottle was found near the '
        'sports ground.',
    date: '23 October 2026',
    icon: Icons.water_drop,
  ),
  LostItem(
    name: 'Notebook',
    location: 'Lecture Hall A',
    status: 'Lost',
    description: 'A blue notebook containing lecture notes is missing.',
    date: '24 October 2026',
    icon: Icons.menu_book,
  ),
  LostItem(
    name: 'Earbuds',
    location: 'Student Lounge',
    status: 'Found',
    description: 'A pair of wireless earbuds was found in the student lounge.',
    date: '25 October 2026',
    icon: Icons.headphones,
  ),
  LostItem(
    name: 'Wallet',
    location: 'Parking Area',
    status: 'Lost',
    description: 'A brown wallet was last seen near the campus parking area.',
    date: '26 October 2026',
    icon: Icons.account_balance_wallet,
  ),
  LostItem(
    name: 'House Keys',
    location: 'Main Building',
    status: 'Found',
    description: 'A set of keys was found near the main building entrance.',
    date: '27 October 2026',
    icon: Icons.key,
  ),
];


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.indigo.shade50,
            child: const Column(
              children: [
                Icon(
                  Icons.search,
                  size: 45,
                  color: Colors.indigo,
                ),
                SizedBox(height: 8),
                Text(
                  'Lost Something on Campus?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Browse the items listed below.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),


          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.indigo.shade50,
                              child: Icon(
                                item.icon,
                                color: Colors.indigo,
                              ),
                            ),
                            const SizedBox(width: 12),


                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),


                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: item.status == 'Lost'
                                    ? Colors.red.shade100
                                    : Colors.green.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item.status,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: item.status == 'Lost'
                                      ? Colors.red.shade900
                                      : Colors.green.shade900,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),


                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                'Location: ${item.location}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),


                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.visibility),
                            label: const Text('View Details'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    item: item,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class DetailsScreen extends StatelessWidget {
  final LostItem item;

  const DetailsScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLost = item.status == 'Lost';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),


            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.indigo.shade50,
              child: Icon(
                item.icon,
                size: 60,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 20),


            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),


            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailRow(
                      Icons.location_on,
                      'Location',
                      item.location,
                    ),
                    const Divider(height: 25),
                    detailRow(
                      Icons.info_outline,
                      'Status',
                      item.status,
                    ),
                    const Divider(height: 25),
                    detailRow(
                      Icons.calendar_today,
                      'Date',
                      item.date,
                    ),
                    const Divider(height: 25),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.description,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),


            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isLost
                    ? Colors.orange.shade50
                    : Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isLost
                    ? 'This item has been reported as lost.'
                    : 'This item has been reported as found.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isLost
                      ? Colors.orange.shade900
                      : Colors.green.shade900,
                ),
              ),
            ),

            const SizedBox(height: 20),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Items'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget detailRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.indigo, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

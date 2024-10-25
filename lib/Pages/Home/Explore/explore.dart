import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Explore/newGroup.dart';
import 'package:locus/widgets/exploreContainer.dart';

class Explore extends StatefulWidget {
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final exploreList = [
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera',
      'description':
          'Mohan Bala Nagendra Veera Mohan Nagendra Veera ..... hcbhbhb zjxu Abg',
      'tag': 'Organization',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera 2',
      'description': 'Another description for Mohan 2 ..... hcbhbhb zjxu Abg',
      'tag': 'local',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Mohan Veera 3',
      'description':
          'Mohan Bala Nagendra Veera Mohan Nagendra Veera ..... hcbhbhb zjxu Abg',
      'tag': 'Organization',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'John Doe',
      'description':
          'John is an expert in Flutter development and enjoys coding in Dart.',
      'tag': 'local',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Jane Smith',
      'description':
          'Jane runs a local art organization that promotes community engagement.',
      'tag': 'Organization',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Alice Johnson',
      'description':
          'Alice is a local entrepreneur who started her business from scratch.',
      'tag': 'local',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Bob Brown',
      'description':
          'Bob is the president of a non-profit organization focused on education.',
      'tag': 'Organization',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Charlie Green',
      'description':
          'Charlie is known for his local gardening workshops and community events.',
      'tag': 'local',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Diana Prince',
      'description':
          'Diana leads an organization that advocates for wildlife conservation.',
      'tag': 'Organization',
    },
    {
      'img': 'assets/img/mohan.jpg',
      'name': 'Ethan Hunt',
      'description':
          'Ethan is a local athlete who participates in community sports events.',
      'tag': 'local',
    },
  ];

  bool filter = false;
  String searchQuery = '';
  List<String> selectedTags = [];

  // Function to filter explore list based on tags and search query
  List<Map<String, String>> getFilteredExploreList() {
    return exploreList.where((item) {
      final matchesSearch =
          item['name']!.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesTag =
          selectedTags.isEmpty || selectedTags.contains(item['tag']);
      return matchesSearch && matchesTag;
    }).toList();
  }

  // Function to toggle tag selection
  void toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20,bottom: 100),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value; // Update search query
                      });
                    },
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(129, 129, 129, 1),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(129, 129, 129, 1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: () {
                          setState(() {
                            filter = !filter; // Toggle filter display
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.transparent,
                          style: BorderStyle.solid,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.transparent,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                if (filter)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        // Organization Tag
                        FilterChip(
                          label: Text('Organization'),
                          selected: selectedTags.contains('Organization'),
                          onSelected: (selected) {
                            toggleTag('Organization');
                          },
                        ),
                        const SizedBox(width: 10),
                        // Local Tag
                        FilterChip(
                          label: Text('Local'),
                          selected: selectedTags.contains('local'),
                          onSelected: (selected) {
                            toggleTag('local');
                          },
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: getFilteredExploreList().length,
                    itemBuilder: (context, index) {
                      final list = getFilteredExploreList()[index];
                      return Explorecontainer(
                        name: list['name'] as String,
                        description: list['description'] as String,
                        img: list['img'] as String,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            right: 30,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => DraggableScrollableSheet(
                    initialChildSize: 0.9,
                    maxChildSize: 0.9,
                    minChildSize: 0.5,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Newgroup(), // Display your Newgroup widget here
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

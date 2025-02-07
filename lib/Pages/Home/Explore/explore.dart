import 'package:flutter/material.dart';
import 'package:locus/Pages/Home/Explore/adminView.dart';
import 'package:locus/Pages/Home/Explore/newGroup.dart';
import 'package:locus/Pages/Home/Explore/userView.dart';
import 'package:locus/widgets/exploreContainer.dart';

class Explore extends StatefulWidget {
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  late bool isOpen = false;
  late bool isAdmin = true;
  bool isSearch = false;
  String searchQuery = '';
  List<String> selectedTags = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

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

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isOpen = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> getFilteredExploreList() {
    return exploreList.where((item) {
      final matchesSearch =
          item['name']!.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesTag =
          selectedTags.isEmpty || selectedTags.contains(item['tag']);
      return matchesSearch && matchesTag;
    }).toList();
  }

  void toggleSearch() {
    setState(() {
      isSearch = !isSearch;
      if (!isSearch) {
        _searchController.clear();
        searchQuery = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isOpen = false;
        });
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: isSearch
                ? TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  )
                : const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Electrolize',
                    ),
                  ),
            actions: [
              IconButton(
                icon: Icon(isSearch ? Icons.close : Icons.search),
                color: Colors.white,
                onPressed: toggleSearch,
              ),
            ],
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    if (isAdmin)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (builder) => Adminview(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your Group',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(
                                  size: 18,
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (isAdmin)
                      SizedBox(
                        height: 20,
                      ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: getFilteredExploreList().length,
                        itemBuilder: (context, index) {
                          final list = getFilteredExploreList()[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (builder) => Userview(
                                    name: list['name'] as String,
                                    img: list['img'] as String,
                                  ),
                                ),
                              );
                            },
                            child: Explorecontainer(
                              name: list['name'] as String,
                              description: list['description'] as String,
                              img: list['img'] as String,
                            ),
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
                            child:
                                Newgroup(), // Display your Newgroup widget here
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
          )),
    );
  }
}

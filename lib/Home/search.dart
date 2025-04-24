import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final List<String> searchHistory;
  final List<Map<String, String>> categories;

  SearchScreen({required this.searchHistory, required this.categories});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> searchHistory = [];
  List<Map<String, String>> filteredCategories = [];
  bool isSearching = false; // Controls when to show results

  @override
  void initState() {
    super.initState();
    searchHistory = List.from(widget.searchHistory);
  }

  void updateSearchResults(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      filteredCategories = widget.categories
          .where((category) =>
              category['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void removeSearchItem(int index) {
    setState(() {
      searchHistory.removeAt(index);
    });
  }

  void selectSearchItem(String query) {
    if (!searchHistory.contains(query)) {
      setState(() {
        searchHistory.insert(0, query);
        if (searchHistory.length > 10) {
          searchHistory.removeLast();
        }
      });
    }
    Navigator.pop(context, query); // Return search term to Category screen
  }

  Color c1 = Color.fromRGBO(7, 45, 68, 1);
  Color c2 = Color.fromRGBO(6, 68, 107, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: c1),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Search',
          style: TextStyle(color: c1, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: searchController,
                onChanged: updateSearchResults,
                onSubmitted: selectSearchItem,
                decoration: InputDecoration(
                  hintText: 'Search for a field...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: c2),
                  contentPadding: EdgeInsets.only(top: 12, left: 15),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Search Results (only shown when user types)
            if (isSearching)
              Expanded(
                child: filteredCategories.isEmpty
                    ? Center(child: Text("No results found"))
                    : ListView.builder(
                        itemCount: filteredCategories.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredCategories[index]['name']!),
                            onTap: () =>
                                selectSearchItem(filteredCategories[index]['name']!),
                          );
                        },
                      ),
              ),

            // Recent Searches (only shown when not searching)
            if (!isSearching && searchHistory.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Searches',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => setState(() => searchHistory.clear()),
                    child: Text('Clear All', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: searchHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchHistory[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.close, color: Colors.black54),
                        onPressed: () => removeSearchItem(index),
                      ),
                      onTap: () => selectSearchItem(searchHistory[index]),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

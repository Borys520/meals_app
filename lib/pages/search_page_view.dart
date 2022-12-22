import 'package:flutter/material.dart';

import '../providers/api_connector.dart';
import '../widgets/app_bar.dart';

class SearchPageView extends StatefulWidget {
  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  bool _isLoading = false;

  TextEditingController searchFieldController = TextEditingController();

  void Search() async {
    mealCards = await ApiConnector.createSearchMealCards(
        searchFieldController.text, _selectedSearchType);
    setState(() {});
  }

  List<Widget> mealCards = [];
  static const _searchType = ['Meal name', 'Category', 'Ingredient', 'Area'];
  String _selectedSearchType = _searchType[0];

  @override
  Widget build(BuildContext context) {
    Search();
    return Scaffold(
      appBar: MealsAppBar('Search'),
      body: Column(
        children: [
          TextField(
            controller: searchFieldController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: Search,
                icon: const Icon(Icons.search),
              ),
              contentPadding:
                  const EdgeInsets.only(top: 15, left: 20, bottom: 10),
              hintText: 'Search by $_selectedSearchType',
            ),
            onChanged: (searchFieldController) async {
              mealCards = await ApiConnector.createSearchMealCards(
                  searchFieldController, _selectedSearchType);
              setState(() {});
            },
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _searchType.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionChip(
                    label: Text(_searchType[index]),
                    backgroundColor: _selectedSearchType == _searchType[index]
                        ? Colors.orange
                        : Colors.black12,
                    onPressed: () {
                      _selectedSearchType = _searchType[index];
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ),
          _isLoading
              ? const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : mealCards.isNotEmpty
                  ? Expanded(
                      child: ListView(
                        children: mealCards,
                      ),
                    )
                  : const Expanded(
                      child: Center(
                        child: Text('There is no meals to display'),
                      ),
                    ),
        ],
      ),
    );
  }
}

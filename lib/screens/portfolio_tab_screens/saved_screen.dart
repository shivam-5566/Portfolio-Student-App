import 'package:flutter/material.dart';
import 'package:portfolio_student_app/models/product_model.dart';
import 'package:portfolio_student_app/widgets/product_list.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Product> _items = ProductListItem.productList; // Mock list of items
  late List<Product> _filteredItems;
  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = _items;
      } else {
        _filteredItems = _items
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(height: 55,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search a product',
                suffixIcon: Padding(
                  padding:const  EdgeInsets.only(right: 12.0),
                  child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                          color: Colors.red),
                      child: const Icon(Icons.search,color: Colors.white,)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _filterItems,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      Container(
                          width: 100,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  bottomLeft: Radius.circular(12.0))),
                          child: Image.asset(
                            _filteredItems[index].image,
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_filteredItems[index].title,style: TextStyle(fontWeight: FontWeight.w600),),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_filteredItems[index].desc,),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(_filteredItems[index].subDesc,style: TextStyle(color: Colors.grey,fontSize: 12),),
                                ],
                              ),
                               SizedBox(width: 20,),
                              Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: const Center(
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

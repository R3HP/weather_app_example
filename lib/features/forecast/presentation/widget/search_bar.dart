// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearchSumbit;
  const SearchBar({
    Key? key,
    required this.onSearchSumbit,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _cityNameTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8.0 * 5, bottom: 8.0 * 3, left: 8.0 * 4, right: 8.0 * 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, -2),
                      color: Color.fromARGB(255, 56, 28, 103),
                    )
                  ],
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 42, 22, 76),
                    Color.fromARGB(255, 91, 68, 132)
                  ]),
                  borderRadius: BorderRadius.circular(8.0 * 4)),
              child: TextField(
                controller: _cityNameTextController,
                textAlign: TextAlign.center,
                onSubmitted: (value) => widget.onSearchSumbit(value),
                decoration: const InputDecoration(
                    hintText: 'Search Here!',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(2),
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 42, 22, 76),
                    Color.fromARGB(255, 91, 68, 132)
                  ]),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, -2),
                      color: Color.fromARGB(255, 56, 28, 103),
                    )
                  ]),
              child: InkWell(
                  onTap: _cityNameTextController.text.isEmpty ? null : () => widget.onSearchSumbit(_cityNameTextController.text),
                  radius: 5,
                  child: SvgPicture.asset('assets/images/search.svg'))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cityNameTextController.dispose();
    super.dispose();
  }
}

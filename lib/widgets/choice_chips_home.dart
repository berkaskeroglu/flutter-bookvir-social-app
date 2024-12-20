import 'package:flutter/material.dart';

class HomePageChoiceChips extends StatefulWidget {
  const HomePageChoiceChips({super.key});

  @override
  _HomePageChoiceChipsState createState() => _HomePageChoiceChipsState();
}

class _HomePageChoiceChipsState extends State<HomePageChoiceChips> {
  final List<String> _selectedTags = ['Buddy'];
  List<String> choices = ['Locations', 'People', 'Events', 'Categories'];
  String? _selectedChoice = 'Locations';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0), // Baş ve sona padding
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 12, // Chip'ler arası yatay boşluk
          runSpacing: 12, // Chip'ler arası dikey boşluk
          children: [
            const SizedBox(width: 8),
            ...choices.map((choice) {
              return ChoiceChip(
                label: Text(
                  choice,
                  style: TextStyle(
                    fontFamily: 'Figtree',
                    color: _selectedTags == choice
                        ? const Color.fromARGB(255, 62, 62, 65)
                        : const Color(0xFF606A85),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                selected: _selectedTags == choice,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChoice = selected ? choice : null;
                  });
                },
                selectedColor: const Color.fromARGB(77, 94, 96, 99),
                backgroundColor: const Color(0xFFF1F4F8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: _selectedChoice == choice
                        ? const Color.fromARGB(255, 79, 78, 86)
                        : const Color(0xFFE5E7EB),
                    width: _selectedChoice == choice ? 2 : 1,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
      //const SizedBox(width: 16),
    );
    // if (_selectedChoice != null) ...[
    //   _getContainerForChoice(_selectedChoice!),
    // ],
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: const Column(
//         children: [
//           Text(
//             'Select your tags',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(height: 20),
//           HomePageChoiceChips(),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: HomePage(),
//   ));
// }

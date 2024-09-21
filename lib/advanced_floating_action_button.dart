import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AdvancedFloatingActionButton extends StatefulWidget {
  const AdvancedFloatingActionButton({super.key});

  @override
  State<AdvancedFloatingActionButton> createState() =>
      _AdvancedFloatingActionButtonState();
}

class _AdvancedFloatingActionButtonState
    extends State<AdvancedFloatingActionButton> {
  bool isTap = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          floatingActionButton: _advancedSolutionWithMainFlutterCode(),
        ),
      );

  Widget _advancedSolutionWithMainFlutterCode() => SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedOpacity(
              opacity: _isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  print("Add clicked");
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.add),
              ),
            ),
            AnimatedOpacity(
              opacity: _isExpanded ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  print("Edit clicked");
                },
                child: Icon(Icons.edit),
                backgroundColor: Colors.green,
              ),
            ),
            // Floating Action Button 3
            AnimatedOpacity(
              opacity: _isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                //  heroTag: null,
                onPressed: () {
                  print("Delete clicked");
                },
                child: Icon(Icons.delete),
                backgroundColor: Colors.blue,
              ),
            ),
            // Main Floating Action Button
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Icon(_isExpanded ? Icons.close : Icons.menu),
            ),
          ],
        ),
      );

  Scaffold _solutionWithSpeedDialPackage() {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        backgroundColor: Colors.green,
        icon: Icons.add,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.green,
            child: const Icon(Icons.edit),
          ),
          SpeedDialChild(
              backgroundColor: Colors.green, child: const Icon(Icons.remove)),
          SpeedDialChild(
            backgroundColor: Colors.green,
            child: const Icon(Icons.add_a_photo_rounded),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Scaffold _simpleSolution() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => isTap = !isTap),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          if (isTap)
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 70),
                child: Stack(
                  children: [
                    Positioned(
                      right: 16,
                      bottom: 10,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add_call),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 70,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.account_tree),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 130,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.account_balance_wallet_sharp),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

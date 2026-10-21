import 'package:flutter/material.dart';

// ==========================================
// 1. MAIN ENTRY POINT
// ==========================================
// Launches the Flutter application
void main() {
  runApp(const BijliBuddyApp());
}

// ==========================================
// 2. ROOT APPLICATION WIDGET
// ==========================================
// StatelessWidget: Root app configuration that defines global themes and does not maintain mutable state.
class BijliBuddyApp extends StatelessWidget {
  const BijliBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application Title
      title: 'BijliBuddy',

      // Remove debug banner from top-right corner
      debugShowCheckedModeBanner: false,

      // Global Green Theme Configuration
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        useMaterial3: true,
      ),

      // Set SplashScreen as the initial Home screen
      home: const SplashScreen(),
    );
  }
}

// ==========================================
// 3. SPLASH SCREEN
// ==========================================
// StatefulWidget: Manages dynamic state to animate the entrance fade-in of the logo on screen launch.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Opacity state variable controlling the fade-in animation
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // initState(): Lifecycle method called once when this widget is inserted into the widget tree.
    // Triggers after 100 milliseconds to start the fade-in animation after the first frame renders.
    Future.delayed(const Duration(milliseconds: 100), () {
      // setState(): Tells Flutter that mutable state has changed, triggering a rebuild with the updated _opacity.
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 32.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Top empty space to help balance vertical centering
                        const SizedBox.shrink(),

                        // ----------------------------------------
                        // Center Content: Emoji, App Name, Tagline
                        // ----------------------------------------
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Section: ⚡ Emoji wrapped in AnimatedOpacity (fades in over 2 seconds)
                            AnimatedOpacity(
                              opacity: _opacity,
                              duration: const Duration(seconds: 2),
                              child: const Text(
                                '⚡',
                                style: TextStyle(fontSize: 80),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Section: App Name
                            const Text(
                              'BijliBuddy',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Section: Tagline
                            const Text(
                              'Bijli ka bill, pehlay se maloom',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // ----------------------------------------
                        // Bottom Section: "Get Started" Button
                        // ----------------------------------------
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to HomeScreen using Navigator.push
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ==========================================
// 4. HOME SCREEN
// ==========================================
// StatelessWidget: Main hub displaying 4 static interactive navigation cards with no dynamic internal state.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BijliBuddy')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ----------------------------------------
            // Card 1: 💡 Calculate Bill (wrapped in InkWell)
            // ----------------------------------------
            InkWell(
              onTap: () {
                // Navigate to CalculatorScreen using Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculatorScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.green, size: 30),
                      SizedBox(width: 16),
                      Text(
                        'Calculate Bill',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ----------------------------------------
            // Card 2: 📖 Slab Rates (wrapped in InkWell)
            // ----------------------------------------
            InkWell(
              onTap: () {
                // Navigate to SlabRatesScreen using Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SlabRatesScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.menu_book, color: Colors.green, size: 30),
                      SizedBox(width: 16),
                      Text(
                        'Slab Rates',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ----------------------------------------
            // Card 3: 💰 Saving Tips (wrapped in InkWell)
            // ----------------------------------------
            InkWell(
              onTap: () {
                // Navigate to TipsScreen using Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TipsScreen()),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.savings, color: Colors.green, size: 30),
                      SizedBox(width: 16),
                      Text(
                        'Saving Tips',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // ----------------------------------------
            // Card 4: ℹ️ About (wrapped in InkWell)
            // ----------------------------------------
            InkWell(
              onTap: () {
                // Navigate to AboutScreen using Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info, color: Colors.green, size: 30),
                      SizedBox(width: 16),
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. CALCULATOR SCREEN
// ==========================================
// StatefulWidget: Manages dynamic state for form inputs, unit calculation, and result card visibility.
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controller for the units text input
  final TextEditingController _unitsController = TextEditingController();

  // Selected category: Domestic or Commercial
  String _selectedCategory = 'Domestic';

  // Calculated values and visibility flag
  double _calculatedTotal = 0.0;
  double _enteredUnits = 0.0;
  bool _showResult = false;

  @override
  void dispose() {
    _unitsController.dispose();
    super.dispose();
  }

  // ----------------------------------------
  // Bill calculation logic based on slabs:
  // First 100 units: Rs 16 each
  // 101-200 units: Rs 18 each
  // 201-300 units: Rs 22 each
  // Above 300: Rs 27 each
  // ----------------------------------------
  double _calculateBill(double units) {
    if (units <= 0) return 0.0;

    double bill = 0.0;
    if (units <= 100) {
      bill = units * 16;
    } else if (units <= 200) {
      bill = (100 * 16) + ((units - 100) * 18);
    } else if (units <= 300) {
      bill = (100 * 16) + (100 * 18) + ((units - 200) * 22);
    } else {
      bill = (100 * 16) + (100 * 18) + (100 * 22) + ((units - 300) * 27);
    }
    return bill;
  }

  // Handle calculation action
  void _onCalculatePressed() {
    // Validate form inputs
    if (_formKey.currentState!.validate()) {
      final double units = double.parse(_unitsController.text.trim());
      setState(() {
        _enteredUnits = units;
        _calculatedTotal = _calculateBill(units);
        _showResult = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculate Bill')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ----------------------------------------
              // 1. TextFormField for units
              // ----------------------------------------
              TextFormField(
                controller: _unitsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Units Consumed',
                  hintText: 'e.g. 150',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(
                    Icons.electric_bolt,
                    color: Colors.green,
                  ),
                ),
                validator: (value) {
                  // Validation: show error if empty
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter units';
                  }
                  if (double.tryParse(value.trim()) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ----------------------------------------
              // 2. DropdownButtonFormField: Domestic / Commercial
              // ----------------------------------------
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.category, color: Colors.green),
                ),
                items: const [
                  DropdownMenuItem(value: 'Domestic', child: Text('Domestic')),
                  DropdownMenuItem(
                    value: 'Commercial',
                    child: Text('Commercial'),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue ?? 'Domestic';
                  });
                },
              ),
              const SizedBox(height: 20),

              // ----------------------------------------
              // 3. ElevatedButton "Calculate"
              // ----------------------------------------
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _onCalculatePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ----------------------------------------
              // 4. Result Card with AnimatedOpacity fade-in
              // ----------------------------------------
              AnimatedOpacity(
                opacity: _showResult ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 600),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 24.0,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Estimated Total Bill',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Total in big bold text
                        Text(
                          'Rs ${_calculatedTotal.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Details: Category and Units
                        Text(
                          'Category: $_selectedCategory | Units: ${_enteredUnits.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 6. SLAB RATES SCREEN
// ==========================================
// StatelessWidget: Read-only display of fixed electricity slab rates that does not change at runtime.
class SlabRatesScreen extends StatelessWidget {
  const SlabRatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slab Rates')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Slab 1: 0 – 100 units
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.green, size: 28),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        '0 – 100 units | Rs 16 per unit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Slab 2: 101 – 200 units
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.green, size: 28),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        '101 – 200 units | Rs 18 per unit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Slab 3: 201 – 300 units
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.green, size: 28),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        '201 – 300 units | Rs 22 per unit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Slab 4: 300+ units
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.green, size: 28),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        '300+ units | Rs 27 per unit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 7. SAVING TIPS SCREEN
// ==========================================
// StatelessWidget: Static list of energy-saving tips with no mutable state.
class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saving Tips')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tip 1: LED bulbs
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Row(
                  children: [
                    Text('💡', style: TextStyle(fontSize: 28)),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Use LED bulbs instead of tube lights',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tip 2: AC Temperature
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Row(
                  children: [
                    Text('❄️', style: TextStyle(fontSize: 28)),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Set AC to 26 degrees',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tip 3: Unplug Chargers
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Row(
                  children: [
                    Text('🔌', style: TextStyle(fontSize: 28)),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Unplug chargers when not in use',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tip 4: Iron Clothes in Bulk
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Row(
                  children: [
                    Text('🧺', style: TextStyle(fontSize: 28)),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Iron clothes once a week in bulk',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tip 5: Sunlight
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Row(
                  children: [
                    Text('🌅', style: TextStyle(fontSize: 28)),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Use sunlight during the day',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tip 6: Fridge Door
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                child: Row(
                  children: [
                    Text('🧊', style: TextStyle(fontSize: 28)),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Keep fridge door closed properly',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 8. ABOUT SCREEN
// ==========================================
// StatelessWidget: Displays static app information and developer credits without internal state.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ⚡ Emoji
              Text('⚡', style: TextStyle(fontSize: 64)),
              SizedBox(height: 12),

              // App Name
              Text(
                'BijliBuddy',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 6),

              // Version 1.0
              Text(
                'Version 1.0',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24),

              // Short Description
              Text(
                'BijliBuddy helps Pakistani families calculate their electricity bill in advance using the official slab system.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 32),

              // Divider
              Divider(indent: 40, endIndent: 40),
              SizedBox(height: 20),

              // Developer Credit
              Text(
                'Developed by [Your Name]',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

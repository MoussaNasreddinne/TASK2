import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class SavedCardsSheet extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController nameOnCardController;
  final TextEditingController expDateController;
  final TextEditingController cvvController;

  const SavedCardsSheet({
    super.key,
    required this.cardNumberController,
    required this.nameOnCardController,
    required this.expDateController,
    required this.cvvController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      decoration: const BoxDecoration(
        color: Color(0xFF151515), // Dark background
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Saved Cards",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Main card container with gradient fade
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF2D2D2F),
                    Color(0xFF1E1E1E),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Selected Card Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.radio_button_checked, color: Colors.green, size: 18),
                          SizedBox(width: 8),
                          Text("Visa Card 1", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "VISA",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Card Number
                  _borderedField(
                    controller: cardNumberController,
                    label: "Card Number",
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),

                  // Name On Card
                  _borderedField(
                    controller: nameOnCardController,
                    label: "Name On Card",
                  ),
                  const SizedBox(height: 12),

                  // Exp Date and CVV
                  Row(
                    children: [
                      Expanded(
                        child: _borderedField(
                          controller: expDateController,
                          label: "Expiration Date",
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _borderedField(
                          controller: cvvController,
                          label: "CVV",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Add Card Button (dotted border)
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              color: Colors.grey.shade700,
              dashPattern: const [6, 4],
              strokeWidth: 1,
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: const Center(
                  child: Text("+  Add Card", style: TextStyle(color: Colors.white70, fontSize: 15)),
                ),
              ),
            ),
            const Spacer(),

            // Save Changes Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bordered text field container
  Widget _borderedField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54, fontSize: 13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

void showSavedCardsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return SavedCardsSheet(
        cardNumberController: TextEditingController(text: "1234 5678 9101 1121"),
        nameOnCardController: TextEditingController(text: "John Doe"),
        expDateController: TextEditingController(text: "10/26"),
        cvvController: TextEditingController(text: "123"),
      );
    },
  );
}

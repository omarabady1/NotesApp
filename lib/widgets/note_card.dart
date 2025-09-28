import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.cardColor});
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 24),
      margin: const EdgeInsetsGeometry.only(right: 22, left: 22, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: EdgeInsetsGeometry.all(0),
            title: Text(
              'Shai b Laban',
              style: const TextStyle(fontSize: 24, color: Colors.black87),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Boil the Water & Tea: In a small pot, bring 1 cup of water to a boil. Add the loose black tea (or tea bags). Let it simmer for about 3–5 minutes, depending on how strong you like your tea. Add the Milk: Add 1 cup of milk directly into the pot with the tea. Bring it back to a gentle boil, stirring occasionally. Allow it to simmer for another 2–3 minutes. Be careful — milk can easily overflow if left unattended. Sweeten It: Add sugar to taste while it\'s still on the heat, and stir to dissolve. Egyptians usually drink it moderately sweet, but adjust to your preference. Strain and Serve: Pour the tea through a fine strainer into cups to remove the tea leaves (if using loose tea). Serve hot, ideally in a glass cup or mug for that authentic Egyptian feel.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                size: 32,
                color: Colors.black.withValues(alpha: 0.8),
              ),
            ),
          ),
          Text(
            'September 27, 2025',
            style: TextStyle(color: Colors.black.withValues(alpha: 0.45)),
          ),
        ],
      ),
    );
  }
}

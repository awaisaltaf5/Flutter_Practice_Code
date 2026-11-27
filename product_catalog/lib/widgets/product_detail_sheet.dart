import 'package:flutter/material.dart';
import '../models/product.dart';

/// Modal bottom sheet displaying detailed product information with close action.
class ProductDetailSheet extends StatefulWidget {
  final Product product;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onCartToggle;

  const ProductDetailSheet({
    super.key,
    required this.product,
    required this.onFavoriteToggle,
    required this.onCartToggle,
  });

  /// Helper static method to trigger modal bottom sheet
  static void show(
    BuildContext context,
    Product product,
    VoidCallback onFavoriteToggle,
    VoidCallback onCartToggle,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ProductDetailSheet(
        product: product,
        onFavoriteToggle: onFavoriteToggle,
        onCartToggle: onCartToggle,
      ),
    );
  }

  @override
  State<ProductDetailSheet> createState() => _ProductDetailSheetState();
}

class _ProductDetailSheetState extends State<ProductDetailSheet> {
  late bool _isFav;
  late bool _isInCart;

  @override
  void initState() {
    super.initState();
    _isFav = widget.product.isFavorite;
    _isInCart = widget.product.isInCart;
  }

  void _handleFavoriteClick() {
    setState(() {
      _isFav = !_isFav;
    });
    widget.onFavoriteToggle();
  }

  void _handleCartClick() {
    setState(() {
      _isInCart = !_isInCart;
    });
    widget.onCartToggle();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.88,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Drag Indicator & Close Action Row
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  // Drag Handle Bar
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Explicit Close Button
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    tooltip: 'Close details',
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Main Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Header with Animated Favorite Button
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 1.25,
                            child: Image.asset(
                              widget.product.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: theme.colorScheme.surfaceContainerHighest,
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 60,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        // Floating Animated Favorite Heart Button
                        Positioned(
                          top: 12,
                          right: 12,
                          child: CircleAvatar(
                            backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.9),
                            radius: 22,
                            child: IconButton(
                              icon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 250),
                                transitionBuilder: (child, animation) =>
                                    ScaleTransition(scale: animation, child: child),
                                child: Icon(
                                  _isFav ? Icons.favorite : Icons.favorite_border,
                                  key: ValueKey<bool>(_isFav),
                                  color: _isFav ? Colors.red : Colors.grey[700],
                                ),
                              ),
                              onPressed: _handleFavoriteClick,
                              tooltip: 'Toggle Favorite',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Category Pill & Rating Badge Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text(widget.product.category),
                          backgroundColor: theme.colorScheme.secondaryContainer,
                          labelStyle: TextStyle(
                            color: theme.colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star_rounded, size: 18, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.product.rating} / 5.0',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Product Title
                    Text(
                      widget.product.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Price Tag
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Divider(),
                    const SizedBox(height: 12),

                    // Product Description Section
                    Text(
                      'Description',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.product.description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom Action Bar (Close & Add/Remove Cart)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Close Outlined Button
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 12),

                  // Add / Remove Cart Button
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: _isInCart
                            ? theme.colorScheme.errorContainer
                            : theme.colorScheme.primary,
                        foregroundColor: _isInCart
                            ? theme.colorScheme.onErrorContainer
                            : theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _handleCartClick();
                      },
                      icon: Icon(
                        _isInCart
                            ? Icons.remove_shopping_cart_rounded
                            : Icons.shopping_cart_outlined,
                      ),
                      label: Text(
                        _isInCart ? 'Remove from Cart' : 'Add to Cart',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

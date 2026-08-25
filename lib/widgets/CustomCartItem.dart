import 'package:app_multi_screens/models/CartIem.dart';
import 'package:flutter/material.dart';

class CustomCartItem extends StatelessWidget {
  final CartItem _cartItem;

  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;
  // void onIncrement(){
  //   _cartItem.quantity=_cartItem.quantity+1;
  // }
  //
  // void onDecrement(){
  //   _cartItem.quantity=_cartItem.quantity-1;
  // }
  //
  // void onRemove(){
  //   _cartItem.quantity=_cartItem.quantity-1;
  // }





  const CustomCartItem({
    super.key
    ,required this._cartItem, this.onIncrement, this.onDecrement, this.onRemove });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = _cartItem.total;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.dividerColor.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image produit
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
              _cartItem.product.url,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    width: 85,
                    height: 85,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),

            const SizedBox(width: 12),

            // Informations produit
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _cartItem.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  if (_cartItem.product.id != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Réf. $_cartItem.product.id',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],

                  const SizedBox(height: 8),

                  Text(
                    '${_cartItem.product.price.toStringAsFixed(0)} FCFA',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantité
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: theme.dividerColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            _QuantityButton(
                              icon: Icons.remove,
                              onPressed: _cartItem.quantity > 1
                                  ? onDecrement
                                  : null,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                '${_cartItem.quantity}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            _QuantityButton(
                              icon: Icons.add,
                              onPressed: onIncrement,
                            ),
                          ],
                        ),
                      ),

                      // Total
                      Text(
                        '${total.toStringAsFixed(0)} FCFA',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Supprimer
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.delete_outline),
              color: theme.colorScheme.error,
              tooltip: 'Supprimer',
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _QuantityButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}
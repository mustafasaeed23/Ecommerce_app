import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final categories = const [
    "Men's Fashion",
    "Women's Fashion",
    "Skincare",
    "Beauty",
    "Cameras",
    "Laptops & Electronics",
    "Baby & Toys",
  ];

  final gridItems = const [
    _GridItem(
      "T-shirts",
      "https://images.unsplash.com/photo-1520975693416-35a2ae711c89?q=80&w=800",
    ),
    _GridItem(
      "Shorts",
      "https://images.unsplash.com/photo-1560243563-062b9c39b89a?q=80&w=800",
    ),
    _GridItem(
      "Jeans",
      "https://images.unsplash.com/photo-1520975592562-34b58175f629?q=80&w=800",
    ),
    _GridItem(
      "Pants",
      "https://images.unsplash.com/photo-1520975653418-4a9d6c2f1ac8?q=80&w=800",
    ),
    _GridItem(
      "Footwear",
      "https://images.unsplash.com/photo-1519744792095-2f2205e87b6f?q=80&w=800",
    ),
    _GridItem(
      "Suits",
      "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=800",
    ),
    _GridItem(
      "Watches",
      "https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=800",
    ),
    _GridItem(
      "Bags",
      "https://images.unsplash.com/photo-1504805572947-34fad45aed93?q=80&w=800",
    ),
    _GridItem(
      "Eyewears",
      "https://images.unsplash.com/photo-1518544801976-3e8772abf9be?q=80&w=800",
    ),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, c) {
            final isNarrow = c.maxWidth < 700;
            final leftWidth = isNarrow ? 110.0 : 240.0;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT SIDEBAR
                Container(
                  width: leftWidth,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueColor,
                    border: Border(
                      right: BorderSide(color: Colors.black.withOpacity(0.06)),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          itemCount: categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, i) {
                            final active = i == selected;
                            return InkWell(
                              onTap: () => setState(() => selected = i),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    width: 4,
                                    height: active ? 36 : 0,
                                    decoration: BoxDecoration(
                                      color: active
                                          ? AppColors.mainColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: active
                                            ? const Color(0xFFEAF1FF)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        categories[i],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontWeight: active
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                              color: active
                                                  ? const Color(0xFF0C1B3A)
                                                  : const Color(0xFF2D3B57),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [
                      Text(
                        categories[selected],
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0C1B3A),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Promo banner card
                      _PromoBanner(
                        title: categories[selected],
                        imageUrl:
                            "https://images.unsplash.com/photo-1521334884684-d80222895322?q=80&w=1600",
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),

                      // Grid of tiles
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: gridItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: .92,
                            ),
                        itemBuilder: (context, i) {
                          final item = gridItems[i];
                          return _RoundedTile(
                            label: item.title,
                            imageUrl: item.imageUrl,
                            onTap: () {},
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/* ----------------------------- helper widgets ---------------------------- */

class _PromoBanner extends StatelessWidget {
  const _PromoBanner({
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFFEAF1FF),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // background image
            CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
            // gradient overlay for readable text
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(.5), Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            // content
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Shop Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundedTile extends StatelessWidget {
  const _RoundedTile({required this.label, required this.imageUrl, this.onTap});

  final String label;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: const Color(0xFF4A5670),
      fontWeight: FontWeight.w600,
    );

    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            height: 78,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.07),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: textStyle, textAlign: TextAlign.center),
      ],
    );
  }
}

class _GridItem {
  final String title;
  final String imageUrl;
  const _GridItem(this.title, this.imageUrl);
}

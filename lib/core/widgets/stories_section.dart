import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

/// Data model for a story item
class StoryData {
  final String name;
  final String imageUrl;
  final bool isActive;

  StoryData({
    required this.name,
    required this.imageUrl,
    required this.isActive,
  });
}

/// A horizontal scrollable list of story items
class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      StoryData(
        name: 'أفضل العروض',
        imageUrl: AppImages.camolino2,
        isActive: true,
      ),
      StoryData(
        name: 'شاهد المسابقة',
        imageUrl: AppImages.camolino2,
        isActive: false,
      ),
      StoryData(
        name: 'عرض حصري',
        imageUrl: AppImages.camolino2,
        isActive: false,
      ),
      StoryData(
        name: 'وصفة شهية',
        imageUrl: AppImages.camolino2,
        isActive: false,
      ),
      StoryData(
        name: 'وصفة شهية',
        imageUrl: AppImages.camolino2,
        isActive: false,
      ),
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return _buildStoryItem(stories[index]);
        },
      ),
    );
  }

  Widget _buildStoryItem(StoryData story) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: story.isActive
                  ? const LinearGradient(
                      colors: [Color(0xFFFDB913), Color(0xFFE41E26)],
                    )
                  : null,
              border: !story.isActive
                  ? Border.all(color: Colors.white.withOpacity(0.5), width: 2)
                  : null,
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(story.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 80,
            child: AppText.small(
              story.name,
              color: AppColors.white,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

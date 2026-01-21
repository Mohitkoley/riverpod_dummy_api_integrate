import 'package:flutter/material.dart';
import 'package:riverpod_api_integrate/data/models/post_model.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text('Post Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  child: Text(
                    post.id.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User ID: ${post.userId}',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Post #${post.id}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[500]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              post.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                post.body,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActionButton(
                  icon: Icons.favorite_border,
                  label: 'Like',
                  onTap: () {},
                ),
                _ActionButton(
                  icon: Icons.chat_bubble_outline,
                  label: 'Comment',
                  onTap: () {},
                ),
                _ActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Icon(icon, size: 28, color: Colors.grey[600]),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

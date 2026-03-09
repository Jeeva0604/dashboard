import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class PollCard extends StatefulWidget {
  const PollCard({super.key});

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  int? _selected;
  final options = [
    'Weekly',
    'Monthly',
    'Quarterly',
    'Only when required by inspections',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),

      child: Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blue.shade900,
                    child: const Text(
                      'M',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                            text: 'Poll from ',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 13,
                              fontWeight: .bold,
                            ),
                          ),

                          TextSpan(
                            text: 'MMD Chennai',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                      // border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: const Text(
                      '30 min left',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'How often does your crew conduct\nsafety training and drills?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.tealColor,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                itemCount: options.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return _buildOption(i);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(int i) {
    final selected = _selected == i;

    return GestureDetector(
      onTap: () => setState(() => _selected = i),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            /// Circle indicator
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected
                    ? AppColors.primaryColor
                    : Colors.grey.withValues(alpha: 0.3),
              ),
            ),
            const SizedBox(width: 10),

            /// Option container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selected
                        ? AppColors.primaryColor
                        : Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    /// Option number
                    Text(
                      i < 9 ? "0${i + 1}" : "${i + 1}",
                      style: const TextStyle(
                        color: AppColors.tealColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// Option text
                    Expanded(
                      child: Text(
                        options[i],
                        style: TextStyle(
                          fontSize: 13,
                          color: selected
                              ? AppColors.primaryColor
                              : Colors.black87,
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.normal,
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

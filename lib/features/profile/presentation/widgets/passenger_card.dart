import 'package:day_bus_user/core/theme/app_colors.dart';
import 'package:day_bus_user/core/theme/app_text_styles.dart';
import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassengerCard extends StatefulWidget {
  final Map<String, dynamic> passenger;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool isSelectionMode;
  final VoidCallback onLongPress;

  const PassengerCard({
    super.key,
    required this.passenger,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    this.isSelectionMode = false,
    required this.onLongPress,
  });

  @override
  State<PassengerCard> createState() => _PassengerCardState();
}

class _PassengerCardState extends State<PassengerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.passenger['isSelected'] ?? false;

    return Row(
      children: [
        // Show checkbox only if in selection mode or if this item is selected (optional logic, matching "only show check button if any of one selected" means if isSelectionMode is true)
        if (widget.isSelectionMode)
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Transform.scale(
              scale: 1.1,
              child: SizedBox(
                height: 24.h,
                width: 24.w,
                child: Checkbox(
                  value: isSelected,
                  activeColor: AppColors.primary,
                  side: BorderSide(color: Colors.grey.shade300, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    widget.onTap();
                  },
                ),
              ),
            ),
          ),

        Expanded(
          child: GestureDetector(
            onLongPress: widget.onLongPress,
            onTap: () {
              HapticFeedback.lightImpact();
              _triggerAnimation(() => widget.onTap());
            },
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey.shade100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1E6FF),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.passenger['name'][0],
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    12.wBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.passenger['name'],
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              // Hide option menu if selected
                              if (!widget.isSelectionMode)
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) async {
                                    final offset = details.globalPosition;
                                    await showMenu<String>(
                                      context: context,
                                      position: RelativeRect.fromLTRB(
                                        offset.dx,
                                        offset.dy,
                                        MediaQuery.of(context).size.width -
                                            offset.dx,
                                        MediaQuery.of(context).size.height -
                                            offset.dy,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                      color: Colors.white,
                                      elevation: 1,
                                      items: [
                                        PopupMenuItem<String>(
                                          value: 'edit',
                                          child: Center(
                                            child: Text(
                                              'Edit Passanger',
                                              style: AppTextStyles.bodyMedium
                                                  .copyWith(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        PopupMenuDivider(
                                          indent: 20,
                                          endIndent: 20,
                                          color: Colors.grey.shade200,
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'delete',
                                          child: Center(
                                            child: Text(
                                              'Delete Passanger',
                                              style: AppTextStyles.bodyMedium
                                                  .copyWith(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).then((value) {
                                      if (value == 'edit') {
                                        widget.onEdit();
                                      } else if (value == 'delete') {
                                        widget.onDelete();
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.more_vert_rounded,
                                    color: Colors.grey.shade600,
                                    size: 20.sp,
                                  ),
                                ),
                            ],
                          ),
                          8.hBox,
                          Row(
                            children: [
                              _buildTag(widget.passenger['gender']),
                              8.wBox,
                              _buildTag("${widget.passenger['age']} Years"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _triggerAnimation(VoidCallback onComplete) {
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        onComplete();
      });
    });
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodyMedium.copyWith(
          fontSize: 11.sp,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

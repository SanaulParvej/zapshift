import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../core/app_constants.dart';
import '../models/demo_data.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onActionTap,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 4.h),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        if (actionLabel != null)
          TextButton(onPressed: onActionTap, child: Text(actionLabel!)),
      ],
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.validator,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final FormFieldValidator<String>? validator;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(onPressed: onSuffixTap, icon: suffixIcon!),
      ),
    );
  }
}

class PremiumButton extends StatelessWidget {
  const PremiumButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        child: loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: Colors.white,
                ),
              )
            : Text(text),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child, this.gradient, this.padding});

  final Widget child;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? Theme.of(context).cardColor : null,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.7),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: padding ?? EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surface.withValues(alpha: 0.78),
            borderRadius: BorderRadius.circular(AppRadii.md),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.onActionTap,
    required this.actionText,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final String badge;
  final String actionText;
  final VoidCallback onActionTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: AppGradients.hero,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.24),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    badge,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  subtitle,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white.withValues(alpha: 0.86),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 170.w,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: AppColors.primary,
                    ),
                    onPressed: onActionTap,
                    child: Text(actionText),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: 14.w),
            SizedBox(
              width: 110.w,
              height: 120.h,
              child: ClipRect(child: trailing!),
            ),
          ],
        ],
      ),
    );
  }
}

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.colors,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadii.md),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white.withValues(alpha: 0.84),
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceStripCard extends StatelessWidget {
  const ServiceStripCard({super.key, required this.item, required this.onTap});

  final ServiceItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadii.md),
        onTap: onTap,
        child: Container(
          width: 230.w,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: item.gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(item.icon, color: Colors.white),
              ),
              const Spacer(),
              Text(
                item.title,
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                item.subtitle,
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white.withValues(alpha: 0.86),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParcelCardView extends StatelessWidget {
  const ParcelCardView({super.key, required this.parcel, this.onTap});

  final ParcelItem parcel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        parcel.trackingNumber,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${parcel.sender} -> ${parcel.receiver}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                _statusChip(parcel.status),
              ],
            ),
            SizedBox(height: 14.h),
            LinearProgressIndicator(
              value: parcel.status == ParcelStatus.delivered
                  ? 1
                  : (parcel.status == ParcelStatus.inTransit ? 0.72 : 0.4),
              minHeight: 8,
              backgroundColor: Theme.of(
                context,
              ).dividerColor.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(99),
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(child: _infoBlock(context, 'From', parcel.origin)),
                Expanded(child: _infoBlock(context, 'To', parcel.destination)),
                Expanded(child: _infoBlock(context, 'ETA', parcel.eta)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBlock(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        SizedBox(height: 4.h),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _statusChip(ParcelStatus status) {
    final data = switch (status) {
      ParcelStatus.created => ('Created', AppColors.muted),
      ParcelStatus.pickedUp => ('Picked', AppColors.info),
      ParcelStatus.inTransit => ('Transit', AppColors.warning),
      ParcelStatus.outForDelivery => ('Out for delivery', AppColors.primary),
      ParcelStatus.delivered => ('Delivered', AppColors.success),
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: data.$2.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        data.$1,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          color: data.$2,
        ),
      ),
    );
  }
}

class ReviewCardView extends StatelessWidget {
  const ReviewCardView({super.key, required this.review});

  final ReviewItem review;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundImage: CachedNetworkImageProvider(review.avatarUrl),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      review.location,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              _ratingBadge(review.rating),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            review.comment,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
        ],
      ),
    );
  }

  Widget _ratingBadge(double rating) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.24),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        rating.toStringAsFixed(1),
        style: GoogleFonts.plusJakartaSans(
          fontWeight: FontWeight.w800,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class NotificationCardView extends StatelessWidget {
  const NotificationCardView({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    final color = switch (notification.type) {
      NotificationType.success => AppColors.success,
      NotificationType.warning => AppColors.warning,
      NotificationType.promo => AppColors.primary,
      NotificationType.info => AppColors.info,
    };

    return AppCard(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(switch (notification.type) {
              NotificationType.success => Icons.check_circle_outline_rounded,
              NotificationType.warning => Icons.warning_amber_rounded,
              NotificationType.promo => Icons.local_offer_rounded,
              NotificationType.info => Icons.notifications_none_rounded,
            }, color: color),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 4.h),
                Text(
                  notification.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 6.h),
                Text(
                  notification.time,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineView extends StatelessWidget {
  const TimelineView({super.key, required this.items});

  final List<ParcelTimelineItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        final completed =
            item.status != ParcelStatus.created || items.length == 1;
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 14.r,
                    height: 14.r,
                    decoration: BoxDecoration(
                      color: completed ? AppColors.primary : AppColors.border,
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (item != items.last)
                    Container(width: 2, height: 52.h, color: AppColors.border),
                ],
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Text(
                            item.time,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        item.subtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class MetricTile extends StatelessWidget {
  const MetricTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary),
          SizedBox(height: 18.h),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 4.h),
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class PageDots extends StatelessWidget {
  const PageDots({super.key, required this.count, required this.activeIndex});

  final int count;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final active = index == activeIndex;
        return AnimatedContainer(
          duration: AppDurations.short,
          margin: EdgeInsets.only(right: 8.w),
          width: active ? 24.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: active ? AppColors.primary : AppColors.border,
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 34});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: AppGradients.accent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          'Z',
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: size * 0.54,
          ),
        ),
      ),
    );
  }
}

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BrandLogo(),
        SizedBox(width: 12.w),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 2.h),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}

class FormCard extends StatelessWidget {
  const FormCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard(child: child);
  }
}

class RemoteBannerAnimation extends StatelessWidget {
  const RemoteBannerAnimation({super.key, required this.url, this.height});

  final String url;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Lottie.network(url, fit: BoxFit.contain, repeat: true),
    );
  }
}

class InfoListTile extends StatelessWidget {
  const InfoListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}

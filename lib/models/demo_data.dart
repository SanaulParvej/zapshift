import 'package:flutter/material.dart';

import '../core/app_constants.dart';

enum ParcelStatus { created, pickedUp, inTransit, outForDelivery, delivered }

enum NotificationType { info, success, warning, promo }

enum ServiceAction {
  sendParcel,
  becomeRider,
  merchantService,
  pricing,
  expressDelivery,
  nationwideDelivery,
  fulfillmentSolution,
  cashOnDelivery,
  corporateService,
  parcelReturn
}

class OnboardingItem {
  const OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.lottieUrl,
    required this.accent,
  });

  final String title;
  final String subtitle;
  final String description;
  final String lottieUrl;
  final String accent;
}

class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.action,
    required this.gradient,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final ServiceAction action;
  final List<Color> gradient;
}

class ParcelTimelineItem {
  const ParcelTimelineItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
  });

  final String title;
  final String subtitle;
  final String time;
  final ParcelStatus status;
}

class ParcelItem {
  const ParcelItem({
    required this.id,
    required this.trackingNumber,
    required this.sender,
    required this.receiver,
    required this.status,
    required this.price,
    required this.eta,
    required this.origin,
    required this.destination,
    required this.riderName,
    required this.riderPhone,
    required this.riderAvatar,
    required this.timeline,
  });

  final String id;
  final String trackingNumber;
  final String sender;
  final String receiver;
  final ParcelStatus status;
  final double price;
  final String eta;
  final String origin;
  final String destination;
  final String riderName;
  final String riderPhone;
  final String riderAvatar;
  final List<ParcelTimelineItem> timeline;
}

class NotificationItem {
  const NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
  });

  final String title;
  final String subtitle;
  final String time;
  final NotificationType type;
}

class ReviewItem {
  const ReviewItem({
    required this.name,
    required this.avatarUrl,
    required this.comment,
    required this.rating,
    required this.location,
  });

  final String name;
  final String avatarUrl;
  final String comment;
  final double rating;
  final String location;
}

class PricingTier {
  const PricingTier({
    required this.name,
    required this.price,
    required this.subtitle,
    required this.features,
    required this.highlighted,
  });

  final String name;
  final String price;
  final String subtitle;
  final List<String> features;
  final bool highlighted;
}

class SupportAction {
  const SupportAction({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

class ProfileMenuItem {
  const ProfileMenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

class UserProfile {
  const UserProfile({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarUrl,
    required this.memberSince,
    required this.savedParcels,
    required this.completedTrips,
  });

  final String name;
  final String role;
  final String email;
  final String phone;
  final String address;
  final String avatarUrl;
  final String memberSince;
  final int savedParcels;
  final int completedTrips;
}

abstract final class DemoData {
  static const UserProfile user = UserProfile(
    name: 'Rahim Ahmed',
    role: 'Merchant account',
    email: 'rahim@zapshift.com',
    phone: '+880 1712 345 678',
    address: AppStrings.baseAddress,
    avatarUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
    memberSince: 'Member since 2024',
    savedParcels: 18,
    completedTrips: 248,
  );

  static const List<OnboardingItem> onboarding = [
    OnboardingItem(
      title: 'Move parcels with confidence',
      subtitle: 'Live parcel visibility',
      description:
          'ZapShift gives merchants and individual senders a calm, premium delivery experience with live parcel tracking.',
      lottieUrl: AppRemoteAssets.onboardingOneLottie,
      accent: 'Live Tracking',
    ),
    OnboardingItem(
      title: 'Scale your merchant workflow',
      subtitle: 'Built for repeat shipping',
      description:
          'Create parcels in a few taps, manage delivery history and unlock merchant-friendly pricing built for growth.',
      lottieUrl: AppRemoteAssets.onboardingTwoLottie,
      accent: 'Merchant Tools',
    ),
    OnboardingItem(
      title: 'Join the rider network',
      subtitle: 'Flexible earnings',
      description:
          'Become a rider and work with a modern logistics app designed around speed, safety and visibility.',
      lottieUrl: AppRemoteAssets.onboardingThreeLottie,
      accent: 'Driver Ready',
    ),
  ];

  static const List<ServiceItem> quickActions = [
    ServiceItem(
      title: 'Send Parcel',
      subtitle: 'Door-to-door delivery',
      icon: Icons.local_shipping_rounded,
      action: ServiceAction.sendParcel,
      gradient: [Color(0xFF0A4B50), Color(0xFF0F7B83)],
    ),
    ServiceItem(
      title: 'Become Rider',
      subtitle: 'Start earning today',
      icon: Icons.two_wheeler_rounded,
      action: ServiceAction.becomeRider,
      gradient: [Color(0xFF0A4B50), Color(0xFF244E55)],
    ),
    ServiceItem(
      title: 'Merchant Service',
      subtitle: 'Ship in scale',
      icon: Icons.storefront_rounded,
      action: ServiceAction.merchantService,
      gradient: [Color(0xFF183A3D), Color(0xFF0A4B50)],
    ),
    ServiceItem(
      title: 'Pricing',
      subtitle: 'Transparent rates',
      icon: Icons.stacked_line_chart_rounded,
      action: ServiceAction.pricing,
      gradient: [Color(0xFF4B5E0A), Color(0xFFD7F25C)],
    ),
  ];

  static const List<ServiceItem> services = [
    ServiceItem(
      title: 'Express & Standard Delivery',
      subtitle: 'Door-to-door in 24–72 hours',
      icon: Icons.local_shipping_rounded,
      action: ServiceAction.expressDelivery,
      gradient: [Color(0xFF0A4B50), Color(0xFF0F7B83)],
    ),
    ServiceItem(
      title: 'Nationwide Delivery',
      subtitle: 'Home delivery in every district',
      icon: Icons.public_rounded,
      action: ServiceAction.nationwideDelivery,
      gradient: [Color(0xFF1B4D3E), Color(0xFF2C6B56)],
    ),
    ServiceItem(
      title: 'Fulfillment Solution',
      subtitle: 'Inventory, packaging & order support',
      icon: Icons.inventory_2_rounded,
      action: ServiceAction.fulfillmentSolution,
      gradient: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
    ),
    ServiceItem(
      title: 'Cash on Home Delivery',
      subtitle: '100% COD anywhere in Bangladesh',
      icon: Icons.payments_rounded,
      action: ServiceAction.cashOnDelivery,
      gradient: [Color(0xFF7C2D12), Color(0xFFC2410C)],
    ),
    ServiceItem(
      title: 'Corporate Service',
      subtitle: 'Logistics, warehouse & contract systems',
      icon: Icons.business_rounded,
      action: ServiceAction.corporateService,
      gradient: [Color(0xFF1F2937), Color(0xFF4B5563)],
    ),
    ServiceItem(
      title: 'Parcel Return',
      subtitle: 'Easy reverse logistics for merchants',
      icon: Icons.assignment_return_rounded,
      action: ServiceAction.parcelReturn,
      gradient: [Color(0xFF581C87), Color(0xFF8B5CF6)],
    ),
  ];

  static const List<ReviewItem> reviews = [
    ReviewItem(
      name: 'Nabila Rahman',
      avatarUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80',
      comment:
          'The tracking feels premium and the updates are fast. Perfect for our daily merchant shipments.',
      rating: 4.9,
      location: 'Dhanmondi',
    ),
    ReviewItem(
      name: 'Siam Hossain',
      avatarUrl:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&q=80',
      comment:
          'ZapShift keeps the delivery experience calm and predictable. Our customers trust it.',
      rating: 4.8,
      location: 'Uttara',
    ),
  ];

  static const List<ParcelItem> recentParcels = [
    ParcelItem(
      id: 'ZX-1045',
      trackingNumber: 'ZX1045BD',
      sender: 'Rahim Ahmed',
      receiver: 'Nabila Rahman',
      status: ParcelStatus.inTransit,
      price: 120,
      eta: 'Today, 6:15 PM',
      origin: 'Uttara',
      destination: 'Dhanmondi',
      riderName: 'Arif Hossain',
      riderPhone: '+880 1888 222 111',
      riderAvatar:
          'https://images.unsplash.com/photo-1504257432389-52343af06ae3?auto=format&fit=crop&w=200&q=80',
      timeline: [
        ParcelTimelineItem(
          title: 'Parcel booked',
          subtitle: 'Pickup created successfully',
          time: '10:20 AM',
          status: ParcelStatus.created,
        ),
        ParcelTimelineItem(
          title: 'Rider assigned',
          subtitle: 'Arif is heading to pickup point',
          time: '10:42 AM',
          status: ParcelStatus.pickedUp,
        ),
        ParcelTimelineItem(
          title: 'In transit',
          subtitle: 'On the way to destination',
          time: '01:10 PM',
          status: ParcelStatus.inTransit,
        ),
      ],
    ),
    ParcelItem(
      id: 'ZX-1088',
      trackingNumber: 'ZX1088BD',
      sender: 'Rahim Ahmed',
      receiver: 'Mim Akter',
      status: ParcelStatus.delivered,
      price: 90,
      eta: 'Delivered',
      origin: 'Mirpur',
      destination: 'Bashundhara',
      riderName: 'Tanvir Hasan',
      riderPhone: '+880 1777 444 222',
      riderAvatar:
          'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?auto=format&fit=crop&w=200&q=80',
      timeline: [
        ParcelTimelineItem(
          title: 'Parcel booked',
          subtitle: 'Pickup confirmed',
          time: '08:10 AM',
          status: ParcelStatus.created,
        ),
        ParcelTimelineItem(
          title: 'Picked up',
          subtitle: 'Package collected by rider',
          time: '08:44 AM',
          status: ParcelStatus.pickedUp,
        ),
        ParcelTimelineItem(
          title: 'Delivered',
          subtitle: 'Receiver accepted the parcel',
          time: '11:30 AM',
          status: ParcelStatus.delivered,
        ),
      ],
    ),
    ParcelItem(
      id: 'ZX-1047',
      trackingNumber: 'ZX1047BD',
      sender: 'Ayesha Rahman',
      receiver: 'Tanvir Hasan',
      status: ParcelStatus.outForDelivery,
      price: 140,
      eta: 'Today, 7:20 PM',
      origin: 'Mohakhali',
      destination: 'Mirpur',
      riderName: 'Pending assignment',
      riderPhone: '—',
      riderAvatar:
          'https://images.unsplash.com/photo-1527980965255-d3b416303d12?auto=format&fit=crop&w=200&q=80',
      timeline: [
        ParcelTimelineItem(
          title: 'Parcel booked',
          subtitle: 'Sender details captured',
          time: '11:20 AM',
          status: ParcelStatus.created,
        ),
        ParcelTimelineItem(
          title: 'Pickup assigned',
          subtitle: 'Searching for rider',
          time: '12:05 PM',
          status: ParcelStatus.pickedUp,
        ),
        ParcelTimelineItem(
          title: 'Out for delivery',
          subtitle: 'Rider is en route',
          time: '05:40 PM',
          status: ParcelStatus.outForDelivery,
        ),
      ],
    ),
  ];

  static const List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Parcel ZX1045BD is on the way',
      subtitle: 'Your rider is 12 minutes away from destination.',
      time: '5m ago',
      type: NotificationType.success,
    ),
    NotificationItem(
      title: 'Merchant pricing updated',
      subtitle: 'New tier benefits are available for bulk senders.',
      time: '2h ago',
      type: NotificationType.promo,
    ),
    NotificationItem(
      title: 'Payment received',
      subtitle: 'Cashless payment for ZX1088BD has been confirmed.',
      time: 'Today',
      type: NotificationType.info,
    ),
  ];

  static const List<PricingTier> pricing = [
    PricingTier(
      name: 'Standard',
      price: 'From ৳70',
      subtitle: 'Best for everyday local deliveries.',
      features: [
        'Pickup within 60 minutes',
        'Live tracking',
        'Proof of delivery',
      ],
      highlighted: false,
    ),
    PricingTier(
      name: 'Express',
      price: 'From ৳120',
      subtitle: 'Priority handling for urgent parcels.',
      features: ['Priority pickup', 'Live rider contact', 'Faster ETA updates'],
      highlighted: true,
    ),
    PricingTier(
      name: 'Merchant',
      price: 'Custom',
      subtitle: 'Volume-friendly pricing for businesses.',
      features: [
        'Monthly invoicing',
        'Bulk dispatch dashboard',
        'Dedicated support',
      ],
      highlighted: false,
    ),
  ];

  static const List<SupportAction> supportActions = [
    SupportAction(
      title: 'Call support',
      subtitle: AppStrings.supportPhone,
      icon: Icons.call_rounded,
    ),
    SupportAction(
      title: 'Email support',
      subtitle: AppStrings.supportEmail,
      icon: Icons.mail_rounded,
    ),
    SupportAction(
      title: 'Live chat',
      subtitle: 'Available 24/7',
      icon: Icons.chat_bubble_rounded,
    ),
  ];

  static const List<ProfileMenuItem> profileMenus = [
    ProfileMenuItem(
      title: 'Personal Information',
      subtitle: 'Update profile details',
      icon: Icons.person_rounded,
    ),
    ProfileMenuItem(
      title: 'Address Book',
      subtitle: 'Manage saved pickup locations',
      icon: Icons.location_on_rounded,
    ),
    ProfileMenuItem(
      title: 'Order History',
      subtitle: 'View previous deliveries',
      icon: Icons.receipt_long_rounded,
    ),
    ProfileMenuItem(
      title: 'Payment Methods',
      subtitle: 'Add or edit cards and wallet',
      icon: Icons.credit_card_rounded,
    ),
    ProfileMenuItem(
      title: 'Saved Parcels',
      subtitle: 'Track repeat shipments quickly',
      icon: Icons.bookmark_rounded,
    ),
    ProfileMenuItem(
      title: 'Help Center',
      subtitle: 'Get instant support',
      icon: Icons.support_agent_rounded,
    ),
  ];
}

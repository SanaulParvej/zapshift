import 'package:flutter/material.dart';

class OnboardingItem {
  const OnboardingItem({
    required this.title,
    required this.description,
    required this.badge,
    required this.lottieUrl,
    required this.icon,
  });

  final String title;
  final String description;
  final String badge;
  final String lottieUrl;
  final IconData icon;
}

class ServiceItem {
  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    required this.tint,
  });

  final String title;
  final String description;
  final IconData icon;
  final String route;
  final Color tint;
}

class TimelineEvent {
  const TimelineEvent({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.completed,
  });

  final String title;
  final String subtitle;
  final String time;
  final bool completed;
}

class ParcelItem {
  const ParcelItem({
    required this.trackingNumber,
    required this.title,
    required this.status,
    required this.origin,
    required this.destination,
    required this.eta,
    required this.progress,
    required this.amount,
    required this.riderName,
    required this.riderPhone,
    required this.timeline,
  });

  final String trackingNumber;
  final String title;
  final String status;
  final String origin;
  final String destination;
  final String eta;
  final double progress;
  final String amount;
  final String riderName;
  final String riderPhone;
  final List<TimelineEvent> timeline;
}

class NotificationItem {
  const NotificationItem({
    required this.title,
    required this.body,
    required this.time,
    required this.read,
    required this.icon,
  });

  final String title;
  final String body;
  final String time;
  final bool read;
  final IconData icon;
}

class ReviewItem {
  const ReviewItem({
    required this.name,
    required this.role,
    required this.comment,
    required this.rating,
    required this.avatarUrl,
  });

  final String name;
  final String role;
  final String comment;
  final double rating;
  final String avatarUrl;
}

class PricingTier {
  const PricingTier({
    required this.title,
    required this.price,
    required this.eta,
    required this.features,
    required this.highlight,
  });

  final String title;
  final String price;
  final String eta;
  final List<String> features;
  final bool highlight;
}

class UserProfile {
  const UserProfile({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatarUrl,
  });

  final String name;
  final String role;
  final String email;
  final String phone;
  final String address;
  final String avatarUrl;
}

class SupportOption {
  const SupportOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

class ZapShiftDemoData {
  static const onboarding = <OnboardingItem>[
    OnboardingItem(
      badge: 'Live parcel visibility',
      title: 'Track every parcel with confidence',
      description:
          'Give merchants and customers a clear, real-time view of every delivery stage.',
      lottieUrl:
          'https://lottie.host/08b6d98d-8f8f-45ce-a8f4-4b3d40c9b3fb/5x7fYqS7dQ.json',
      icon: Icons.local_shipping_outlined,
    ),
    OnboardingItem(
      badge: 'Fast merchant onboarding',
      title: 'Built for growing delivery operations',
      description:
          'From one parcel to thousands, ZapShift keeps the workflow simple and premium.',
      lottieUrl:
          'https://lottie.host/6c7e2d3d-92cb-4db1-9f90-5d1c2f3cf4a9/L1hQhB0m2e.json',
      icon: Icons.storefront_outlined,
    ),
    OnboardingItem(
      badge: 'Driver and customer trust',
      title: 'Smooth delivery experiences on every order',
      description:
          'Elegant status updates, route details, and support tools keep everyone informed.',
      lottieUrl:
          'https://lottie.host/5b4b3d36-5e0c-4eb3-b0dd-8d4c9bc9e8e4/8G2s7lB0h3.json',
      icon: Icons.verified_outlined,
    ),
  ];

  static const services = <ServiceItem>[
    ServiceItem(
      title: 'Send Parcel',
      description: 'Book a pickup and send anywhere with a few taps.',
      icon: Icons.inventory_2_outlined,
      route: '/create-parcel',
      tint: Color(0xFFEFFBF2),
    ),
    ServiceItem(
      title: 'Become Rider',
      description: 'Join the fleet and start earning with flexible schedules.',
      icon: Icons.pedal_bike_outlined,
      route: '/become-rider',
      tint: Color(0xFFF4F8FF),
    ),
    ServiceItem(
      title: 'Merchant Service',
      description: 'Scale fulfillment with dependable delivery support.',
      icon: Icons.store_mall_directory_outlined,
      route: '/merchant-registration',
      tint: Color(0xFFFFF8E8),
    ),
    ServiceItem(
      title: 'Pricing',
      description: 'Transparent delivery rates by weight and distance.',
      icon: Icons.payments_outlined,
      route: '/pricing',
      tint: Color(0xFFF2FBFA),
    ),
  ];

  static const recentParcels = <ParcelItem>[
    ParcelItem(
      trackingNumber: 'ZP-10482',
      title: 'Electronics delivery',
      status: 'Out for delivery',
      origin: 'Gulshan, Dhaka',
      destination: 'Banani, Dhaka',
      eta: 'Today, 4:40 PM',
      progress: 0.78,
      amount: '৳180',
      riderName: 'Rafi Ahmed',
      riderPhone: '+880 1711-234567',
      timeline: [
        TimelineEvent(
          title: 'Parcel booked',
          subtitle: 'Merchant confirmed pickup',
          time: '09:10 AM',
          completed: true,
        ),
        TimelineEvent(
          title: 'Picked up',
          subtitle: 'Rider collected from sender',
          time: '10:30 AM',
          completed: true,
        ),
        TimelineEvent(
          title: 'In transit',
          subtitle: 'Heading to destination zone',
          time: '01:15 PM',
          completed: true,
        ),
        TimelineEvent(
          title: 'Out for delivery',
          subtitle: 'Near delivery address now',
          time: '03:45 PM',
          completed: true,
        ),
        TimelineEvent(
          title: 'Delivered',
          subtitle: 'Waiting for POD completion',
          time: '04:40 PM',
          completed: false,
        ),
      ],
    ),
    ParcelItem(
      trackingNumber: 'ZP-10421',
      title: 'Fashion sample',
      status: 'Delivered',
      origin: 'Dhanmondi, Dhaka',
      destination: 'Uttara, Dhaka',
      eta: 'Completed',
      progress: 1,
      amount: '৳220',
      riderName: 'Shuvo Karim',
      riderPhone: '+880 1812-456789',
      timeline: [
        TimelineEvent(
          title: 'Parcel booked',
          subtitle: 'Order created',
          time: 'Yesterday, 11:00 AM',
          completed: true,
        ),
        TimelineEvent(
          title: 'Picked up',
          subtitle: 'Collected from sender',
          time: 'Yesterday, 12:12 PM',
          completed: true,
        ),
        TimelineEvent(
          title: 'Delivered',
          subtitle: 'Handed to recipient',
          time: 'Yesterday, 03:30 PM',
          completed: true,
        ),
      ],
    ),
    ParcelItem(
      trackingNumber: 'ZP-10477',
      title: 'Documents packet',
      status: 'Assigned',
      origin: 'Mohakhali, Dhaka',
      destination: 'Mirpur, Dhaka',
      eta: 'Today, 6:20 PM',
      progress: 0.38,
      amount: '৳140',
      riderName: 'Pending assignment',
      riderPhone: '—',
      timeline: [
        TimelineEvent(
          title: 'Parcel booked',
          subtitle: 'Sender details captured',
          time: '11:20 AM',
          completed: true,
        ),
        TimelineEvent(
          title: 'Pickup assigned',
          subtitle: 'Searching for rider',
          time: '12:05 PM',
          completed: true,
        ),
        TimelineEvent(
          title: 'Pickup in progress',
          subtitle: 'Rider approaching sender',
          time: '02:15 PM',
          completed: false,
        ),
      ],
    ),
  ];

  static const notifications = <NotificationItem>[
    NotificationItem(
      title: 'Parcel ZP-10482 is out for delivery',
      body:
          'Your parcel is nearing the destination. Share the ETA with the recipient.',
      time: '2 min ago',
      read: false,
      icon: Icons.delivery_dining_outlined,
    ),
    NotificationItem(
      title: 'Merchant plan activated',
      body: 'Your business account is ready for bulk parcel creation.',
      time: '35 min ago',
      read: true,
      icon: Icons.verified_outlined,
    ),
    NotificationItem(
      title: 'Weekly delivery summary',
      body: '12 parcels were successfully completed this week.',
      time: 'Today',
      read: true,
      icon: Icons.insights_outlined,
    ),
  ];

  static const reviews = <ReviewItem>[
    ReviewItem(
      name: 'Nusrat Jahan',
      role: 'Merchant partner',
      comment:
          'The tracking experience is premium and the delivery updates feel transparent for our customers.',
      rating: 4.9,
      avatarUrl: 'https://i.pravatar.cc/150?img=32',
    ),
    ReviewItem(
      name: 'Mehedi Hasan',
      role: 'Regular user',
      comment:
          'Best courier UX I have used. It feels fast, polished, and reliable.',
      rating: 5.0,
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
    ),
  ];

  static const pricing = <PricingTier>[
    PricingTier(
      title: 'Same City',
      price: 'From ৳120',
      eta: '2-4 hours',
      highlight: true,
      features: [
        'Pickup within 45 minutes',
        'Live tracking',
        'SMS and app notifications',
      ],
    ),
    PricingTier(
      title: 'Inter City',
      price: 'From ৳220',
      eta: 'Next day',
      highlight: false,
      features: [
        'Route optimized delivery',
        'Proof of delivery',
        'Priority support',
      ],
    ),
    PricingTier(
      title: 'Merchant Plan',
      price: 'Custom',
      eta: 'Dedicated SLA',
      highlight: false,
      features: ['Bulk pricing', 'Account manager', 'Dashboard and reports'],
    ),
  ];

  static const supportOptions = <SupportOption>[
    SupportOption(
      title: 'Call support',
      subtitle: '+880 1611-00-2026',
      icon: Icons.call_outlined,
    ),
    SupportOption(
      title: 'Email us',
      subtitle: 'support@zapshift.com',
      icon: Icons.mail_outline,
    ),
    SupportOption(
      title: 'Live chat',
      subtitle: 'Average reply under 3 minutes',
      icon: Icons.chat_bubble_outline,
    ),
  ];

  static const user = UserProfile(
    name: 'Ayesha Rahman',
    role: 'Merchant account',
    email: 'ayesha@zapshift.com',
    phone: '+880 1700-000000',
    address: 'House 12, Road 5, Banani, Dhaka',
    avatarUrl: 'https://i.pravatar.cc/150?img=47',
  );
}

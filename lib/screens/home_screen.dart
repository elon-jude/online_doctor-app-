import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import 'doctor_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedSpecialty = 'All';
  final _searchController = TextEditingController();
  String _searchQuery = '';

  List<Doctor> get _filteredDoctors {
    return sampleDoctors.where((d) {
      final matchesSpecialty =
          _selectedSpecialty == 'All' || d.specialty == _selectedSpecialty;
      final matchesSearch = _searchQuery.isEmpty ||
          d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          d.specialty.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesSpecialty && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  24, MediaQuery.of(context).padding.top + 16, 24, 24),
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning, Jude 👋',
                            style: GoogleFonts.nunito(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Find a Doctor',
                            style: GoogleFonts.nunito(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor:
                                  Colors.white.withOpacity(0.2),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppTheme.accent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppTheme.primary, width: 2),
                                ),
=======
// we need the Doctor class
// ─────────────────────────────────────────────
// MODEL CLASS: a plain Dart object that holds
// the data describing one doctor.
// ─────────────────────────────────────────────
class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final bool isOnline;
 
  const Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.isOnline,
  });
}
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  // Our "database" — a hard-coded list for this lab.
  // In ENCE 216 Part 2 we will replace this with a real API call.
  static const List<Doctor> doctors = [
    Doctor(
        name: 'Dr. Ama Mensah',
        specialty: 'General Practitioner',
        rating: 4.9,
        isOnline: true),
    Doctor(
        name: 'Dr. Kofi Asante',
        specialty: 'Cardiologist',
        rating: 4.8,
        isOnline: true),
    Doctor(
        name: 'Dr. Efua Boateng',
        specialty: 'Pediatrician',
        rating: 4.7,
        isOnline: false),
    Doctor(
        name: 'Dr. Yaw Owusu',
        specialty: 'Dermatologist',
        rating: 4.6,
        isOnline: true),
    Doctor(
        name: 'Dr. Akosua Darko',
        specialty: 'Psychiatrist',
        rating: 4.9,
        isOnline: false),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Doctors'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // hides the back arrow —
        // remember, we CLEARED the stack after login, so there is
        // nothing to go back to anyway.
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // Logging out = wipe the stack and return to login.
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Tap a doctor to start a consultation',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Expanded(
            // ListView.builder only builds the items currently
            // visible on screen — efficient even for 10,000 items.
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.teal.shade100,
                      child: const Icon(Icons.person,
                          color: Colors.teal, size: 30),
                    ),
                    title: Text(
                      doctor.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctor.specialty),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 16, color: Colors.amber),
                            Text(' ${doctor.rating}'),
                            const SizedBox(width: 12),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: doctor.isOnline
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            Text(
                              doctor.isOnline ? ' Online' : ' Offline',
                              style: TextStyle(
                                fontSize: 12,
                                color: doctor.isOnline
                                    ? Colors.green
                                    : Colors.grey,
>>>>>>> 53f1c756c15a72f04b26b8f5a4ea12932d653af1
                              ),
                            ),
                          ],
                        ),
<<<<<<< HEAD
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search bar
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _searchQuery = v),
                      decoration: InputDecoration(
                        hintText: 'Search doctors, specialties...',
                        hintStyle: GoogleFonts.nunito(
                          color: AppTheme.textLight,
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: AppTheme.textLight,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14),
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        final isSelected =
                            _selectedSpecialty == cat['specialty'];
                        return GestureDetector(
                          onTap: () => setState(() {
                            _selectedSpecialty = isSelected
                                ? 'All'
                                : cat['specialty'] as String;
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 72,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppTheme.primary
                                  : AppTheme.surface,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: isSelected
                                      ? AppTheme.primary.withOpacity(0.3)
                                      : Colors.black.withOpacity(0.04),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cat['icon'] as String,
                                  style: const TextStyle(fontSize: 28),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  cat['label'] as String,
                                  style: GoogleFonts.nunito(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : AppTheme.textMid,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Banner
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF27C69C), Color(0xFF0B8FAC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'COVID-19 Safety',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Consult online and\nstay safe at home',
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.85),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Learn More',
                              style: GoogleFonts.nunito(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text('🏥', style: TextStyle(fontSize: 64)),
                  ],
                ),
              ),
            ),
          ),

          // Doctors list
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Doctors',
                      style: Theme.of(context).textTheme.titleMedium),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: GoogleFonts.nunito(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final doc = _filteredDoctors[index];
                return Padding(
                  padding:
                      const EdgeInsets.fromLTRB(24, 0, 24, 12),
                  child: _DoctorCard(
                    doctor: doc,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DoctorDetailScreen(doctor: doc)),
                    ),
                  ),
                );
              },
              childCount: _filteredDoctors.length,
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
=======
                      ],
                    ),
                    trailing: const Icon(Icons.chat_bubble_outline,
                        color: Colors.teal),
                    onTap: () {
                      // ─────────────────────────────────────
                      // PASSING DATA TO THE NEXT SCREEN:
                      // the 'arguments' parameter can carry
                      // ANY Dart object — here, a Doctor.
                      // ─────────────────────────────────────
                      Navigator.pushNamed(
                        context,
                        '/chat',
                        arguments: doctor,
                      );
                    },
                  ),
                );
              },
            ),
          ),
>>>>>>> 53f1c756c15a72f04b26b8f5a4ea12932d653af1
        ],
      ),
    );
  }
}
<<<<<<< HEAD

class _DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onTap;

  const _DoctorCard({required this.doctor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    doctor.imageUrl,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 72,
                      height: 72,
                      color: AppTheme.primaryLight,
                      child: const Icon(Icons.person,
                          color: AppTheme.primary, size: 36),
                    ),
                  ),
                ),
                if (doctor.isAvailable)
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppTheme.accent,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    doctor.specialty,
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: AppTheme.star, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${doctor.rating}',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textDark,
                        ),
                      ),
                      Text(
                        ' (${doctor.reviewCount})',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.work_outline_rounded,
                          size: 12, color: AppTheme.textLight),
                      const SizedBox(width: 4),
                      Text(
                        '${doctor.experience} yrs',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${doctor.consultationFee.toInt()}',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textDark,
                  ),
                ),
                Text(
                  '/session',
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    color: AppTheme.textLight,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: doctor.isAvailable
                        ? AppTheme.accentLight
                        : AppTheme.divider,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    doctor.isAvailable ? 'Available' : 'Busy',
                    style: GoogleFonts.nunito(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: doctor.isAvailable
                          ? AppTheme.accent
                          : AppTheme.textLight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
=======
>>>>>>> 53f1c756c15a72f04b26b8f5a4ea12932d653af1

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Appointment> _appointments = [
    Appointment(
      id: '1',
      doctor: sampleDoctors[0],
      dateTime: DateTime.now().add(const Duration(days: 2, hours: 10)),
      type: AppointmentType.video,
      status: AppointmentStatus.upcoming,
      notes: 'Routine heart checkup',
    ),
    Appointment(
      id: '2',
      doctor: sampleDoctors[1],
      dateTime: DateTime.now().add(const Duration(days: 5, hours: 14)),
      type: AppointmentType.chat,
      status: AppointmentStatus.upcoming,
    ),
    Appointment(
      id: '3',
      doctor: sampleDoctors[3],
      dateTime: DateTime.now().subtract(const Duration(days: 3)),
      type: AppointmentType.inPerson,
      status: AppointmentStatus.completed,
      notes: 'General checkup - all good',
    ),
    Appointment(
      id: '4',
      doctor: sampleDoctors[4],
      dateTime: DateTime.now().subtract(const Duration(days: 10)),
      type: AppointmentType.video,
      status: AppointmentStatus.completed,
    ),
    Appointment(
      id: '5',
      doctor: sampleDoctors[2],
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      type: AppointmentType.video,
      status: AppointmentStatus.cancelled,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Appointment> _filtered(AppointmentStatus status) =>
      _appointments.where((a) => a.status == status).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Appointments'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.primary,
          indicatorWeight: 3,
          labelColor: AppTheme.primary,
          unselectedLabelColor: AppTheme.textLight,
          labelStyle:
              GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w700),
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _AppointmentList(
              appointments: _filtered(AppointmentStatus.upcoming)),
          _AppointmentList(
              appointments: _filtered(AppointmentStatus.completed)),
          _AppointmentList(
              appointments: _filtered(AppointmentStatus.cancelled)),
        ],
      ),
    );
  }
}

class _AppointmentList extends StatelessWidget {
  final List<Appointment> appointments;

  const _AppointmentList({required this.appointments});

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('📅', style: TextStyle(fontSize: 56)),
            const SizedBox(height: 16),
            Text(
              'No appointments yet',
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.textLight,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: appointments.length,
      itemBuilder: (context, index) => _AppointmentCard(
        appointment: appointments[index],
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const _AppointmentCard({required this.appointment});

  Color get _statusColor {
    switch (appointment.status) {
      case AppointmentStatus.upcoming:
        return AppTheme.primary;
      case AppointmentStatus.completed:
        return AppTheme.accent;
      case AppointmentStatus.cancelled:
        return AppTheme.error;
    }
  }

  String get _typeLabel {
    switch (appointment.type) {
      case AppointmentType.video:
        return 'Video Call';
      case AppointmentType.chat:
        return 'Chat';
      case AppointmentType.inPerson:
        return 'In-Person';
    }
  }

  IconData get _typeIcon {
    switch (appointment.type) {
      case AppointmentType.video:
        return Icons.video_call_rounded;
      case AppointmentType.chat:
        return Icons.chat_bubble_rounded;
      case AppointmentType.inPerson:
        return Icons.location_on_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  appointment.doctor.imageUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 56,
                    height: 56,
                    color: AppTheme.primaryLight,
                    child:
                        const Icon(Icons.person, color: AppTheme.primary),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctor.name,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      appointment.doctor.specialty,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  appointment.status.name.capitalize(),
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: _statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: AppTheme.divider),
          const SizedBox(height: 10),
          Row(
            children: [
              _InfoChip(
                icon: Icons.calendar_today_rounded,
                label: DateFormat('MMM dd, yyyy')
                    .format(appointment.dateTime),
              ),
              const SizedBox(width: 12),
              _InfoChip(
                icon: Icons.schedule_rounded,
                label: DateFormat('h:mm a').format(appointment.dateTime),
              ),
              const SizedBox(width: 12),
              _InfoChip(
                icon: _typeIcon,
                label: _typeLabel,
              ),
            ],
          ),
          if (appointment.status == AppointmentStatus.upcoming) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppTheme.divider),
                      foregroundColor: AppTheme.textMid,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Join Now'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: AppTheme.textLight),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 11,
            color: AppTheme.textMid,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

extension StringExt on String {
  String capitalize() =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

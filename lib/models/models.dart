class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final int experience; // years
  final double consultationFee;
  final bool isAvailable;
  final String about;
  final List<String> workingHours;
  final List<String> tags;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.experience,
    required this.consultationFee,
    required this.isAvailable,
    required this.about,
    required this.workingHours,
    required this.tags,
  });
}

class Appointment {
  final String id;
  final Doctor doctor;
  final DateTime dateTime;
  final AppointmentType type;
  final AppointmentStatus status;
  final String? notes;

  const Appointment({
    required this.id,
    required this.doctor,
    required this.dateTime,
    required this.type,
    required this.status,
    this.notes,
  });
}

enum AppointmentType { video, chat, inPerson }

enum AppointmentStatus { upcoming, completed, cancelled }

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime time;

  const ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
  });
}

// --- Sample Data ---

final List<Doctor> sampleDoctors = [
  const Doctor(
    id: '1',
    name: 'Dr. Ama Serwaa',
    specialty: 'Cardiologist',
    imageUrl: 'https://i.pravatar.cc/150?img=47',
    rating: 4.9,
    reviewCount: 312,
    experience: 12,
    consultationFee: 80,
    isAvailable: true,
    about:
        'Dr. Ama Serwaa is a board-certified cardiologist with over 12 years of experience treating heart conditions. She specializes in preventive cardiology and heart failure management.',
    workingHours: ['Mon-Fri: 8am - 5pm', 'Sat: 9am - 1pm'],
    tags: ['Heart', 'Hypertension', 'ECG'],
  ),
  const Doctor(
    id: '2',
    name: 'Dr. Kofi Mensah',
    specialty: 'Dermatologist',
    imageUrl: 'https://i.pravatar.cc/150?img=12',
    rating: 4.7,
    reviewCount: 198,
    experience: 8,
    consultationFee: 65,
    isAvailable: true,
    about:
        'Dr. Kofi Mensah specializes in skin disorders and cosmetic dermatology. He has extensive experience in treating acne, eczema, psoriasis, and skin cancer screening.',
    workingHours: ['Mon-Thu: 9am - 6pm', 'Fri: 9am - 3pm'],
    tags: ['Acne', 'Eczema', 'Skin Cancer'],
  ),
  const Doctor(
    id: '3',
    name: 'Dr. Efua Boateng',
    specialty: 'Pediatrician',
    imageUrl: 'https://i.pravatar.cc/150?img=5',
    rating: 4.8,
    reviewCount: 425,
    experience: 15,
    consultationFee: 70,
    isAvailable: false,
    about:
        'Dr. Efua Boateng is a highly experienced pediatrician dedicated to the health and well-being of children from birth through adolescence.',
    workingHours: ['Mon-Fri: 7am - 4pm'],
    tags: ['Children', 'Vaccines', 'Growth'],
  ),
  const Doctor(
    id: '4',
    name: 'Dr. Kwame Asante',
    specialty: 'General Practitioner',
    imageUrl: 'https://i.pravatar.cc/150?img=68',
    rating: 4.6,
    reviewCount: 540,
    experience: 10,
    consultationFee: 50,
    isAvailable: true,
    about:
        'Dr. Kwame Asante is a dedicated general practitioner providing comprehensive primary care for patients of all ages. He focuses on preventive medicine and chronic disease management.',
    workingHours: ['Mon-Sat: 8am - 7pm'],
    tags: ['Primary Care', 'Diabetes', 'Hypertension'],
  ),
  const Doctor(
    id: '5',
    name: 'Dr. Abena Osei',
    specialty: 'Neurologist',
    imageUrl: 'https://i.pravatar.cc/150?img=9',
    rating: 4.9,
    reviewCount: 167,
    experience: 18,
    consultationFee: 100,
    isAvailable: true,
    about:
        'Dr. Abena Osei is a leading neurologist with expertise in treating migraines, epilepsy, and neurodegenerative diseases.',
    workingHours: ['Tue-Fri: 9am - 5pm', 'Sat: 10am - 2pm'],
    tags: ['Migraine', 'Epilepsy', 'Stroke'],
  ),
  const Doctor(
    id: '6',
    name: 'Dr. Yaw Darko',
    specialty: 'Orthopedic Surgeon',
    imageUrl: 'https://i.pravatar.cc/150?img=33',
    rating: 4.7,
    reviewCount: 289,
    experience: 14,
    consultationFee: 90,
    isAvailable: false,
    about:
        'Dr. Yaw Darko is an orthopedic surgeon specializing in sports injuries, joint replacements, and spinal disorders.',
    workingHours: ['Mon-Wed: 8am - 4pm', 'Fri: 8am - 2pm'],
    tags: ['Joints', 'Sports Injury', 'Spine'],
  ),
];

final List<String> specialties = [
  'All',
  'Cardiologist',
  'Dermatologist',
  'Pediatrician',
  'General Practitioner',
  'Neurologist',
  'Orthopedic Surgeon',
];

final List<Map<String, dynamic>> categories = [
  {'icon': '❤️', 'label': 'Cardiology', 'specialty': 'Cardiologist'},
  {'icon': '🧴', 'label': 'Dermatology', 'specialty': 'Dermatologist'},
  {'icon': '👶', 'label': 'Pediatrics', 'specialty': 'Pediatrician'},
  {'icon': '🧠', 'label': 'Neurology', 'specialty': 'Neurologist'},
  {'icon': '🦴', 'label': 'Orthopedics', 'specialty': 'Orthopedic Surgeon'},
  {'icon': '🩺', 'label': 'General', 'specialty': 'General Practitioner'},
];

//Gpt code


// hospital.dart

class Appointment {
  DateTime date;
  String purpose;

  Appointment(this.date, this.purpose);

  @override
  String toString() => "Appointment on $date for $purpose";
}

class Diagnosis {
  DateTime date;
  String condition;

  Diagnosis(this.date, this.condition);

  @override
  String toString() => "[$date] Diagnosis: $condition";
}

class Treatment {
  String description;
  bool isOngoing;

  Treatment(this.description, {this.isOngoing = true});

  void complete() {
    isOngoing = false;
  }

  @override
  String toString() => "Treatment: $description (Ongoing: $isOngoing)";
}

class Patient {
  String name;
  Doctor? _primaryDoctor; // Data hiding: only Doctor assigns
  List<Appointment> _appointments = [];
  List<Diagnosis> _medicalHistory = [];
  List<Treatment> _treatments = [];

  Patient(this.name);

  // Assign doctor
  void assignDoctor(Doctor doctor) {
    _primaryDoctor = doctor;
  }

  // Getters (properties)
  List<Appointment> get appointments => _appointments;
  List<Diagnosis> get medicalHistory => _medicalHistory;
  List<Treatment> get treatments => _treatments;
  Doctor? get primaryDoctor => _primaryDoctor;

  // Methods for doctor actions
  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
  }

  void addDiagnosis(Diagnosis diagnosis) {
    _medicalHistory.add(diagnosis);
  }

  void addTreatment(Treatment treatment) {
    _treatments.add(treatment);
  }

  void discharge() {
    _treatments.clear();
    print("$name has been discharged.");
  }

  // Patient-side views
  void viewAppointments() {
    print("Appointments for $name:");
    _appointments.forEach((a) => print(" - $a"));
  }

  void viewTreatments() {
    print("Treatments for $name:");
    if (_treatments.isEmpty) {
      print(" - No ongoing treatments");
    } else {
      _treatments.forEach((t) => print(" - $t"));
    }
  }

  void viewMedicalHistory() {
    print("Medical history for $name:");
    _medicalHistory.forEach((d) => print(" - $d"));
  }
}

class Doctor {
  String name;
  List<Patient> _patients = [];

  Doctor(this.name);

  List<Patient> get patients => _patients;

  void addPatient(Patient patient) {
    if (!_patients.contains(patient)) {
      _patients.add(patient);
      patient.assignDoctor(this);
      print("${patient.name} is now under Dr. $name's care.");
    }
  }

  void scheduleAppointment(Patient patient, DateTime date, String purpose) {
    patient.addAppointment(Appointment(date, purpose));
    print("Dr. $name scheduled an appointment for ${patient.name} on $date.");
  }

  void diagnose(Patient patient, String condition) {
    patient.addDiagnosis(Diagnosis(DateTime.now(), condition));
    print("Dr. $name diagnosed ${patient.name} with $condition.");
  }

  void prescribeTreatment(Patient patient, String description) {
    patient.addTreatment(Treatment(description));
    print("Dr. $name prescribed treatment for ${patient.name}: $description.");
  }

  void dischargePatient(Patient patient) {
    patient.discharge();
    _patients.remove(patient);
    print("${patient.name} is no longer under Dr. $name's care.");
  }
}

// Demo
void main() {
  // Create doctor and patients
  Doctor drSmith = Doctor("Smith");
  Patient john = Patient("John Doe");
  Patient mary = Patient("Mary Jane");

  // Assign patients to doctor
  drSmith.addPatient(john);
  drSmith.addPatient(mary);

  // Doctor schedules appointments
  drSmith.scheduleAppointment(john, DateTime(2025, 8, 22, 10, 30), "General Checkup");
  drSmith.scheduleAppointment(mary, DateTime(2025, 8, 23, 14, 00), "Follow-up");

  // Doctor diagnoses patients
  drSmith.diagnose(john, "Flu");
  drSmith.diagnose(mary, "High Blood Pressure");

  // Doctor prescribes treatments
  drSmith.prescribeTreatment(john, "Antiviral medication for 5 days");
  drSmith.prescribeTreatment(mary, "Daily blood pressure medication");

  // Patient views records
  john.viewAppointments();
  john.viewMedicalHistory();
  john.viewTreatments();

  mary.viewAppointments();
  mary.viewMedicalHistory();
  mary.viewTreatments();

  // Discharge John
  drSmith.dischargePatient(john);
}

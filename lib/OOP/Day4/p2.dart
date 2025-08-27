/*
In a hospital system, each patient can be prescribed multiple medications,
and each medication can also be prescribed to multiple patients
(Many-to-Many relationship).

Medications include:
- Anti-Inflammatories
- Muscle Relaxants
- Antibiotics
- Cough Syrup
- Insulin
- Anticoagulants
- CNS Depressants
- Statins

⚠️ Safety Rule:
The following medication combinations are NOT allowed to be prescribed together:
1. Antibiotics & Statins
2. Muscle Relaxants & CNS Depressants
3. Anti-Inflammatories & Anticoagulants
*/



enum MedicationsType{
  antiInflammatories,
  muscleRelaxants,
  antibiotics,
  coughSyrup,
  insulin,
  anticoagulants,
  cNSDepressants,
  statins
}

String getMedicationName(MedicationsType med) {
  switch (med) {
    case MedicationsType.antiInflammatories:
      return "Anti-Inflammatories";
    case MedicationsType.muscleRelaxants:
      return "Muscle Relaxants";
    case MedicationsType.antibiotics:
      return "Antibiotics";
    case MedicationsType.coughSyrup:
      return "Cough Syrup";
    case MedicationsType.insulin:
      return "Insulin";
    case MedicationsType.anticoagulants:
      return "Anticoagulants";
    case MedicationsType.cNSDepressants:
      return "CNS Depressants";
    case MedicationsType.statins:
      return "Statins";
    }
}


class Medications{
  MedicationsType? medicationsType;
  Medications(this.medicationsType);
}

class Patient{
  String? name;
  int? age;
  List<Medications> _MedicationsTypeList = [];

  Patient(this.name, this.age);


  bool addMedications(Medications medication) {
    if(checkMedicationEligible(_MedicationsTypeList, medication)) {
      _MedicationsTypeList.add(medication);
      return true;
    }
    return false;
  }


  void showSubscribedMedications() {
    if(_MedicationsTypeList.isEmpty) {
      print("No medications are subscribe");
    }else {
      for(Medications medication in _MedicationsTypeList) {
        print("Subscribed: ${getMedicationName(medication.medicationsType!)}");
      }
    }
  }

}


bool checkMedicationEligible(List<Medications> MedicationsTypeList, Medications newMedication) {
  if(newMedication.medicationsType == MedicationsType.statins && MedicationsTypeList.any((item) => item.medicationsType == MedicationsType.antibiotics )) {
    return false;
  } else if(newMedication.medicationsType == MedicationsType.antibiotics && MedicationsTypeList.any((item) => item.medicationsType == MedicationsType.statins )) {
    return false;
  } else if(newMedication.medicationsType == MedicationsType.muscleRelaxants && MedicationsTypeList.any((item) => item.medicationsType == MedicationsType.cNSDepressants )) {
    return false;
  } else if(newMedication.medicationsType == MedicationsType.cNSDepressants && MedicationsTypeList.any((item) => item.medicationsType == MedicationsType.muscleRelaxants )) {
    return false;
  } else if(newMedication.medicationsType == MedicationsType.antiInflammatories && MedicationsTypeList.any((item) => item.medicationsType == MedicationsType.anticoagulants)) {
    return false;
  } else if(newMedication.medicationsType == MedicationsType.anticoagulants && MedicationsTypeList.any((item) => item.medicationsType == MedicationsType.antiInflammatories)) {
    return false;
  } else{
    return true;
  }
}


void main() {

  Patient Patient1 = Patient("Rahim", 22);
  Patient Patient2 = Patient("Karim", 25);

  Medications medications1 = Medications(MedicationsType.antibiotics);
  Medications medications2 =Medications(MedicationsType.muscleRelaxants);

  Patient1.addMedications(medications1);

  bool sub1 = Patient2.addMedications(medications1);
  print(sub1);

  bool sub2 = Patient2.addMedications(medications2);
  print(sub2);

  Patient1.showSubscribedMedications();
  Patient2.showSubscribedMedications();
}
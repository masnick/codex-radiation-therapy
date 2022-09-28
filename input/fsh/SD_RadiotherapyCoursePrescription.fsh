Profile: RadiotherapyCoursePrescription
Parent: ServiceRequest
Id: codexrt-radiotherapy-course-prescription
Title: "Radiotherapy Course Cumulative Prescription"
Description: "A Radiotherapy Course Prescription is a high-level request for a complete Course of Radiotherapy, which may be fulfilled by one or more Phases."
* ^status = #draft
* insert RadiotherapyPrescriptionsCommon
* insert ModalityAndTechniqueZeroToMany
* extension contains
    $mCODEProcedureIntent named treatmentIntent 0..1 MS and
    RadiotherapyDosePrescribedToVolume named radiotherapyDosePrescribedToVolume 0..* MS
* extension[radiotherapyDosePrescribedToVolume]
  * extension[fractionDose] 0..0
  * extension[fractionDose] ^short = "Not used in this profile. See Phase Prescriptions for detailed Fractionation."
  * extension[fractionDose] ^definition = "Fraction dose is not defined in the Course Prescription because dose may not be equal in all Fractions in which this volume receives dose."
* occurrencePeriod only Period
* occurrencePeriod MS
* code = $mCODESCT_TBD#USCRS-33529 "Radiotherapy Course of Treatment (regime/therapy)"
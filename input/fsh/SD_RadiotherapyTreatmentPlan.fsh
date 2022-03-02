Profile: RadiotherapyTreatmentPlan
Parent: ServiceRequest
Id: codexrt-radiotherapy-treatment-plan
Title: "Radiotherapy Treatment Plan"
Description: "A Radiotherapy Treatment Plan resource describes the treatment that is planned to be delivered with a single Radiotherapy Treatment Plan."
* ^status = #draft
* insert RadiotherapyRequestCommon
* extension contains
    RadiotherapyFractionsPlanned named radiotherapy-fractions-planned 1..1 MS and
    RadiotherapyDosePlannedToVolume named radiotherapy-dose-planned-to-volume 0..* MS and
    DicomReference named radiotherapy-dicom-plan-reference 0..1
* extension[radiotherapy-dose-planned-to-volume]
  * extension[fractionsPlanned] 0..0
  * extension[fractionsPlanned] ^short = "Not used in this profile. In a Treatment Plan, all volumes are involved in all Fractions."
  * extension[fractionsPlanned] ^definition = "Not used in this profile. In a Treatment Plan, all volumes are involved in all Fractions and the number of Fractions is defined in extension radiotherapy-fractions-planned. To achieve different numbers of Fractions for different volumes, multiple Phases have to be defined."
* extension[radiotherapy-dicom-plan-reference] ^short = "DICOM Treatment Plan"
* extension[radiotherapy-dicom-plan-reference] ^definition = "Reference to a DICOM SOP instance representing a Treatment Plan such as RT Plan or RT Ion Plan."
* code = RadiotherapyRequest#radiotherapy-treatment-plan "Radiotherapy Treatment Plan"
* occurrenceTiming only Timing
* occurrenceTiming MS
  * repeat
    * boundsPeriod 0..1
    * boundsPeriod only Period
    * frequency 0..1
    * period 0..1
    * periodUnit 0..1


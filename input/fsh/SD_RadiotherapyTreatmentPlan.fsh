Profile: RadiotherapyTreatmentPlan
Parent: ServiceRequest
Id: codexrt-radiotherapy-treatment-plan
Title: "Radiotherapy Treatment Plan"
Description: "A Radiotherapy Treatment Plan resource describes the treatment that is planned to be delivered with a single Radiotherapy Treatment Plan."
* ^status = #draft
* insert RadiotherapyPlannedPhaseAndTreatmentPlanCommon
* extension contains
    DicomReference named radiotherapy-dicom-plan 0..1
* extension[radiotherapy-dicom-plan] ^short = "DICOM Treatment Plan"
* extension[radiotherapy-dicom-plan] ^definition = "Reference to a DICOM SOP instance representing a Treatment Plan such as RT Plan or RT Ion Plan."
* code = RadiotherapyRequest#radiotherapy-treatment-plan "Radiotherapy Treatment Plan"

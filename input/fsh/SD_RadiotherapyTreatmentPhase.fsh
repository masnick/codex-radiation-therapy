//--------------------------------------------------------------------------------------------------------
// First drafts for XRTS/RTTD discussions. Not reviewed with IHE-RO XRTS yet.
// Contact: martin.vonsiebenthal@varian.com
//--------------------------------------------------------------------------------------------------------



Profile: TeleradiotherapyTreatmentPhase
Parent: RadiotherapyTreatmentPhase
Id: TeleradiotherapyTreatmentPhase
Title: "Teleradiotherapy Treatment Phase"
Description: "A Summary of the Treatment Progress over an External Beam Treatment Phase.
Whenever new contributions in the scope of the same Phase are delivered, this resource is updated (no new resource created)."
* insert RadiotherapyTreatmentPhaseCommon
* ^status = #draft
* basedOn ^short = "Should Reference a https://profiles.ihe.net/RO.XRTS/StructureDefinition/TeleradiotherapyPhasePrescription" // only Reference(TeleradiotherapyPhasePrescription)

Profile: BrachytherapyTreatmentPhase
Parent: RadiotherapyTreatmentPhase
Id: BrachytherapyTreatmentPhase
Title: "Brachytherapy Treatment Phase"
Description: "A Summary of the Treatment Progress over a Brachytherapy Treatment Phase.
Whenever new contributions in the scope of the same Phase are delivered, this resource is updated (no new resource created)."
* insert RadiotherapyTreatmentPhaseCommon
* ^status = #draft
* basedOn ^short = "Should Reference a https://profiles.ihe.net/RO.XRTS/StructureDefinition/BrachytherapyPhasePrescription" // only Reference(BrachytherapyPhasePrescription)

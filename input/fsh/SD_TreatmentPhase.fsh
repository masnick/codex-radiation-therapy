/*  We have an open request for a Radiotherapy Treatment Phase (USCRS-33527)
//  If we need distinct codes for Brachy and teleRadio we should request them
CodeSystem: ResourceIdentifierCS
Id: codexrt-resource-identifier-cs
Title: "codexrt Resource Identifier Code System"
Description: "Concepts describing instance types, to be used in the `code` element of instances. These codes were created because no appropriate concept could be found in established vocabularies. These concepts are analogous to LOINC codes for laboratory observations: they identify the type of thing an instance represents.

Please note that while these codes may imply conformance to the profiles that use them, they are not synonymous with profiles and do not serve the same purpose in a FHIR resource for several reasons:

1. An instance of a resource like Group, Observation, or Procedure may conform to multiple profiles, but may only have one 'type of thing' as determined by the value of `code` (which has a maximum cardinality of 1).
2. `Procedure.code`, `Observation.code`, and `Group.code` elements require a [CodeableConcept data type](http://www.hl7.org/fhir/datatypes.html#CodeableConcept), which can be satisfied with a code from this code system. In contrast, a profile is identified with a [canonical URL](http://www.hl7.org/fhir/structuredefinition-definitions.html#StructureDefinition.url), which is represented by a [URI data type](http://www.hl7.org/fhir/datatypes.html#uri). In other words, a profile's canonical URL belongs in the `meta.profile` element, whereas the codes in this code system belong in `Resource.code` elements.
3. The same `code` can correspond to more than one profile (although not the case here)."

* #codexrt-teleradiotherapy-treatment-phase "Teleradiotherapy Treatment Phase Resource" "Identifies a Procedure resource that describes delivery of teleradiotherapy (external beam radiation) and conforms to the TeleradiotherapyTreatmentPhase profile." // SNOMED Code Requested USCRS-33293
* #codexrt-brachytherapy-treatment-phase "Brachytherapy Treatment Phase Resource" "Identifies a Procedure resource that describes delivery of brachytherapy (internal or surface radiation) and conforms to the BrachytherapyTreatmentPhase profile." // SNOMED Code Requested USCRS-33294
*/

RuleSet: RadiotherapyCommon
* category 1.. MS
* category = SCT#108290001 // "Radiation oncology AND/OR radiotherapy (procedure)"
* performed[x] only Period
* subject only Reference($mCODECancerPatient)   // must reference mCODE Cancer Patient
* extension and category MS

// ------------- Phase Summaries -----------------
Profile:  RadiotherapyTreatmentPhase
Parent:   USCoreProcedure
Id:       codexrt-radiotherapy-treatment-phase
Title: "Radiotherapy Treatment Phase"
Description: "A summary of a phase of radiotherapy treatment that has been delivered. The scope is a treatment consisting of one or multiple identical fractions.  A phase consists of a set of identical fractions. In this context, identical means that each fraction uses the same modality, technique, dose per fraction, and is applied to the same treatment volume or volumes. Because of their spatial relationship or the technique used,  all treatment volumes do not necessarily receive the same total dose during a phase."
* insert RadiotherapyCommon
* code = SnomedRequestedCS#USCRS-33527  // Radiotherapy Treatment Phase (therapy/regime)
* partOf only Reference($mCODERadiotherapyCourseSummary)
* partOf ^definition = "The partOf element, if present, MUST reference an mCODE RadiotherapyCourseSummary-conforming Procedure resource."
* extension contains
    $mCODERadiotherapyModalityAndTechnique named modalityAndTechnique 0..1 MS and
    RadiotherapyFractionsDelivered named fractionsDelivered 0..1 MS and
    $mCODERadiotherapyDoseDeliveredToVolume named doseDeliveredToVolume 0..* MS
* extension[doseDeliveredToVolume].extension[fractionsDelivered] 0..0
* extension[doseDeliveredToVolume].extension[fractionsDelivered] ^short = "Not used in this profile."
* extension[doseDeliveredToVolume].extension[fractionsDelivered] ^definition = "Record the fractions delivered in this phase in the top-level extension also named fractionDelivered."
* extension[doseDeliveredToVolume].extension[fractionsDelivered] ^definition = "Record the fractions delivered in this phase in the top-level extension also named fractionDelivered."
* extension[doseDeliveredToVolume].extension[totalDoseDelivered] ^definition = "The total amount of radiation delivered to this volume within the scope of this phase, not including dose from any other phase. For summary over multiple phases, see Radiotherapy Course Summary."
* extension[fractionsDelivered] ^short = "Number of Fractions Delivered"
* extension[fractionsDelivered] ^definition = "The number of fractions delivered during this phase."
* bodySite from $mCODERadiotherapyTreatmentLocationVS (required)
* bodySite ^short = "All body structure(s) treated in this phase"
* bodySite ^definition = "Coded body structure(s) treated in this phase of radiotherapy. These codes represent general locations. For additional detail, refer to the BodyStructures references in the doseDeliveredToVolume extension."



/*
Profile:  TeleradiotherapyTreatmentPhase
Parent:   USCoreProcedure
Id:       mcode-teleradiotherapy-treatment-phase
Title: "Teleradiotherapy Treatment Phase"
Description: "A summary of a phase of teleradiotherapy treatment that has been delivered. The scope is a treatment consisting of one or multiple identical fractions.  A phase consists of a set of identical fractions. In this context, identical means that each fraction uses the same modality, technique, dose per fraction, and is applied to the same treatment volume or volumes. Because of their spatial relationship or the technique used,  all treatment volumes do not necessarily receive the same total dose during a phase."
* insert RadiotherapyPhaseCommon
// Teleradiotherapy specific content:
* code = RID#codexrt-teleradiotherapy-treatment-phase
* extension[modality].value[x] from TeleradiotherapyModalityVS (required)
* extension[modality] ^short = "Teleradiotherapy (EBRT) Modality"
* extension[modality] ^definition = "The modality (radiation type) for the external beam radiation therapy."
* extension[technique].value[x] from TeleradiotherapyTechniqueVS (required)
* extension[technique] ^short = "Teleradiotherapy (EBRT) Technique"
* extension[technique] ^definition = "The method by which a radiation modality is applied (e.g., intensity modulated radiation therapy, intraoperative radiation therapy)."
//* usedCode from TeleradiotherapyDeviceVS (extensible) // device-related, defer




Profile:  BrachytherapyTreatmentPhase
Parent:   USCoreProcedure
Id:       mcode-brachytherapy-treatment-phase
Title:    "Brachytherapy Treatment Phase"
Description: "A summary of a phase of brachytherapy treatment that has been delivered. The scope is a treatment consisting of one or multiple identical fractions. A phase consists of a set of identical fractions. In this context, identical means that each fraction uses the same modality, technique, dose per fraction, and is applied to the same treatment volume or volumes. Because of their spatial relationship or the technique used, all treatment volumes do not necessarily receive the same total dose during a phase."
* insert RadiotherapyPhaseCommon
// Content specific to Brachytherapy:
* code = RID#codexrt-brachytherapy-treatment-phase
* extension[modality].value[x] from  BrachytherapyModalityVS (required)
* extension[modality] ^short = "Brachytherapy Modality"
* extension[modality] ^definition = "The modality for the Brachytherapy procedure."
* extension[technique].value[x] from BrachytherapyTechniqueVS (required)
* extension[technique] ^short = "Brachytherapy Technique"
* extension[technique] ^definition = "The method by which the brachytherapy modality is applied."
//* usedCode from BrachytherapyDeviceVS (extensible)  // device-related, defer
//* focalDevice.manipulated only Reference(BrachytherapyImplantableDevice)   // device-related, defer

Instance: teleradiotherapy-treatment-phase-chest-wall-jenny-m
InstanceOf: TeleradiotherapyTreatmentPhase
Description: "Example of teleradiotherapy treatment phase involving external beam radiation to chest wall and regional node radiation"
* status = #completed "completed"
* code = RID#mcode-teleradiotherapy-treatment-phase
* category = SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* partOf = Reference(radiotherapy-treatment-summary-chest-wall-jenny-m)
* performedPeriod.start = "2018-05-01"
* performedPeriod.end = "2018-06-29"
* extension[modality].valueCodeableConcept = SCT#1156506007 "External beam radiation therapy using photons (procedure)"
* extension[technique].valueCodeableConcept = SCT#1156530009 "Volumetric Modulated Arc Therapy (procedure)"
* extension[fractionsDelivered].valueUnsignedInt = 25
* extension[doseDeliveredToVolume][0].extension[volume].valueReference = Reference(jenny-m-chest-wall-treatment-volume)
* extension[doseDeliveredToVolume][0].extension[totalDoseDelivered].valueQuantity = 5000 'cGy'
* extension[doseDeliveredToVolume][1].extension[volume].valueReference = Reference(jenny-m-chest-wall-lymph-nodes-treatment-volume)
* extension[doseDeliveredToVolume][1].extension[totalDoseDelivered].valueQuantity = 5000 'cGy'
* subject = Reference(cancer-patient-jenny-m)
* asserter = Reference(us-core-practitioner-kyle-anydoc)

Instance: teleradiotherapy-treatment-phase-boost-jenny-m
InstanceOf: TeleradiotherapyTreatmentPhase
Description: "Example of teleradiotherapy treatment boost phase"
* status = #completed "completed"
* code = RID#mcode-teleradiotherapy-treatment-phase
* category = SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* partOf = Reference(radiotherapy-treatment-summary-chest-wall-jenny-m)
* performedPeriod.start = "2018-08-01"
* performedPeriod.end = "2018-09-30"
* extension[modality].valueCodeableConcept = SCT#45643008  "Teleradiotherapy using electrons (procedure)"
* extension[technique].valueCodeableConcept = SCT#118641002 "Three dimensional treatment planning for teleradiotherapy (procedure)"
* extension[fractionsDelivered].valueUnsignedInt = 5
* extension[doseDeliveredToVolume].extension[volume].valueReference = Reference(jenny-m-chest-wall-treatment-volume)
* extension[doseDeliveredToVolume].extension[totalDoseDelivered].valueQuantity = 1000 'cGy'
* subject = Reference(cancer-patient-jenny-m)
* asserter = Reference(us-core-practitioner-kyle-anydoc)

Instance: brachytherapy-treatment-phase-low-dose-rate-temporary
InstanceOf: BrachytherapyTreatmentPhase
Description: "Example of a brachytherapy therapy phase."
* status = #completed "completed"
* code = RID#mcode-brachytherapy-treatment-phase
* extension[modality].valueCodeableConcept = RT#LDR-TEMP "Low Dose Rate Brachytherapy - Temporary Placement"
* extension[technique].valueCodeableConcept = SCT#113120007 "Interstitial brachytherapy (procedure)"
* subject = Reference(cancer-patient-john-anyperson)
* asserter = Reference(us-core-practitioner-kyle-anydoc)
* performedPeriod.start = "2019-03-01"
* performedPeriod.end = "2019-03-01"
* reasonReference = Reference(primary-cancer-condition-nsclc)
* extension[doseDeliveredToVolume].extension[volume].valueReference = Reference(john-anyperson-treatment-volume)
*/
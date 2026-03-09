# Patient Endpoints Comparison: LabBook vs. Open Hospital

## Introduction

This document compares patient-related endpoints and data structures between LabBook (a laboratory data management system) and Open Hospital (a hospital information system). The goal is to identify differences, potential field mappings, and strategies for integrating Open Hospital patient payloads into LabBook. Analysis is based on API specifications (`api-docs.yaml` for LabBook, `oh.yaml` for Open Hospital) and backend models (`Patient.py`, `PatientRest.py`).

LabBook's patient system focuses on lab-centric data with extensible custom fields, while Open Hospital emphasizes comprehensive patient demographics and medical history.

## Endpoint Differences

| Aspect | LabBook | Open Hospital |
|--------|---------|---------------|
| Base Path | `/services/patient/` | `/patients/` |
| HTTP Methods | GET (list, details, search, historic, form items); POST (combine/merge) | GET (list, details, search, merge); POST (create); PUT (update); DELETE (delete); additional endpoints like cities, all |
| Response Format | Wrapped in `Success` object or plain arrays | Direct `PatientDTO` or `PagePatientDTO` |
| Pagination | Limited (basic list) | Full pagination support (PagePatientDTO) |
| CRUD Support | Read-heavy; merge/combine for updates | Full CRUD operations |
| Additional Features | Historic data, form items for custom fields | Cities list, merge operations, comprehensive patient data |

LabBook endpoints are more specialized for lab workflows (e.g., patient codes tied to lab), while Open Hospital provides standard hospital CRUD with richer search/merge capabilities.

## Field Mappings

### Core Patient Fields

| LabBook Field (DB: sigl_03_data) | OH Field (PatientDTO) | Mapping Notes | Transformation Needed |
|----------------------------------|-----------------------|---------------|-----------------------|
| pat_code | code | Direct match (patient code/ID) | None |
| pat_name | secondName | Direct match (last name) | None |
| pat_firstname | firstName | Direct match (first name) | None |
| pat_birth | birthDate | Direct match (date of birth) | Ensure ISO format consistency |
| pat_sex | sex | Gender field | Convert OH strings ('M'/'F') to LabBook integers (1=Male, 2=Female, 3=Other) |
| pat_address | address | Direct match (address) | None |
| pat_city | city | Direct match (city) | None |
| pat_phone1 | telephone | Direct match (primary phone) | None |
| pat_profession | profession | Direct match (occupation) | None |
| pat_blood_group | bloodType | Blood type | Convert OH string (e.g., "A+") to LabBook format if needed; LabBook has separate group/rhesus fields |
| pat_rhesus | bloodType | Blood rhesus | Extract rhesus from OH string or store separately |

### Extended Fields

OH includes additional fields not directly in LabBook core:

- motherName, fatherName: Store in LabBook's `patient_form_item` as custom fields.
- education, allergies, anamnesis, diseaseType1-16: Map to `patient_form_item` or `patient_hist_form_item` for extensibility.
- age: Computed from birthDate; LabBook may calculate dynamically.

LabBook supports history via `patient_hist_form_item`, allowing versioning of patient data, which OH lacks explicitly.

## Potential Integration Strategies

1. **Direct Mapping**: For ~70% of fields (core demographics), use direct field assignments with type conversions (e.g., sex enum).
2. **Custom Fields Storage**: Use LabBook's `patient_form_item` table for OH extras like allergies or education, enabling flexible storage without schema changes.
3. **Data Transformation Layer**: Implement converters for formats (e.g., blood type parsing, date standardization) in integration scripts.
4. **Migration Considerations**: For bulk import, handle duplicates via LabBook's merge endpoints; validate required fields (e.g., pat_code).
5. **API Integration**: Create a bridge service that fetches OH patient data and maps/transforms it before POSTing to LabBook endpoints.
6. **Extensibility**: Leverage LabBook's form items for OH's richer medical data, maintaining LabBook's lab focus.

## Conclusion

Integration is feasible with direct mappings for core fields and custom storage for extensions. Key challenges include data type conversions (e.g., sex, blood types) and handling OH's broader medical scope via LabBook's flexible fields. Test mappings against actual API responses and consider bidirectional sync for full interoperability.
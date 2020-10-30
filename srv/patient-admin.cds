using {sap.capire.virtualprescription as my} from '../db/schema';

service PatientAdmin @(_requires : 'authenticated-user') {
    entity Patients        as projection on my.Patients;
    entity HealthInurances as projection on my.HealthInurances ; 
}


annotate PatientAdmin.Patients with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Patient',
        TypeNamePlural : 'Patients',
        Title          : {Value : name},
        Description    : {Value: ID}
    },
    SelectionFields  : [
    ID,
    dni,
    name,
    lastName
    ],
    LineItem         : [
    {Value : ID},
    {Value : name},
    {Value : lastName},
    {Value : HealthNr.name},
    {Value : HealthNr.plan}
    ],
    Facets           : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Patient Details',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Main',
            Label  : 'Personal Information'
        },{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Address',
            Label  : 'Address Information'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#HealthInsurance',
            Label  : 'Health Insurance Information'
        },]
    }],
    FieldGroup #Main : {Data : [
    {Value : ID},
    {Value : name},
    {Value : lastName},
    {Value : birthDate},
    {Value : dni}
    ]},
    FieldGroup #Address : {Data : [
    {Value : contact.address, Label: '{i18n>Address}'},
    {Value : contact.city, Label: '{i18n>City}'},
    {Value : contact.country, Label: '{i18n>Country}'},
    {Value : contact.zipcode,  Label: '{i18n>ZipCode}'},
    ]},
    FieldGroup #HealthInsurance : {Data : [
    {Value : HealthNr.name, Label: '{i18n>Insurance Company}'}, 
    {Value : HealthNr.ID, Label: '{i18n>Insurance Nr.}'}, 
    {Value : HealthNr.benNr, Label: '{i18n>Beneficiary}'},
    {Value : HealthNr.filial, Label: '{i18n>Filial}'},
    {Value : HealthNr.control,  Label: '{i18n>Control Code}'},
    {Value : HealthNr.TAXCond,  Label: '{i18n>TAX Condition}'},
    {Value : HealthNr.plan,  Label: '{i18n>Insurance Plan}'},
    ]}
});

annotate PatientAdmin.Patients with {
    ID @( Common: { Label: '{i18n>Pat.ID}'} );
    benNr @( Common: { Label: '{i18n>Pat.beneficiaryNumber}'} );
    name @( Common: { Label: '{i18n>Name}'} );
    lastName @( Common: { Label: '{i18n>LastName}'} );
    dni @( Common: { Label: '{i18n>DNI}'} );
    birthDate @( Common: { Label: '{i18n>BirthDate}'} );
    plan @( Common: { Label: '{i18n>Plan}'} );
}
annotate PatientAdmin.HealthInurances with {
    name @( Common: { Label: '{i18n>InsuranceCompany}'} ); 
}

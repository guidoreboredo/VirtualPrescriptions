using {sap.capire.virtualprescription as my} from '../db/schema';

service PatientAdmin @(_requires : 'authenticated-user') {
    entity Patients        as projection on my.Patients;
    entity HealthInurances as projection on my.HealthInurances;
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
        }]
    }],
    FieldGroup #Main : {Data : [
    {Value : ID},
    {Value : name},
    {Value : lastName},
    {Value : birthDate},
    {Value : dni}
    ]},
    FieldGroup #Address : {Data : [
    {Value : address},
    {Value : city},
    {Value : country},
    {Value : zipcode},
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
    address @( Common: { Label: '{i18n>Address}'} );
    city    @( Common: { Label: '{i18n>City}'} );
    country   @( Common: { Label: '{i18n>Country}'} );
    zipcode @( Common: { Label: '{i18n>ZipCode}'} );
}

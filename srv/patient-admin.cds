using {sap.capire.virtualprescription as my} from '../db/schema';

service DoctorAdmin @(_requires : 'authenticated-user') {
    entity Doctors        as projection on my.Doctors;
}


annotate DoctorAdmin.Doctors with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Doctor',
        TypeNamePlural : 'Doctors',
        Title          : {Value : ID},
        Description    : {Value: name}
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
    {Value : email}
    ],
    Facets           : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Doctor Details',
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
    name @( Common: { Label: '{i18n>Name}'} );
    lastName @( Common: { Label: '{i18n>LastName}'} );
    dni @( Common: { Label: '{i18n>DNI}'} );
    birthDate @( Common: { Label: '{i18n>BirthDate}'} );
    address @( Common: { Label: '{i18n>Address}'} );
    city    @( Common: { Label: '{i18n>City}'} );
    country   @( Common: { Label: '{i18n>Country}'} );
    zipcode @( Common: { Label: '{i18n>ZipCode}'} );
}

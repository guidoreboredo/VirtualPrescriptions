using {sap.capire.virtualprescription as my} from '../db/schema';

service DoctorAdmin @(_requires : 'authenticated-user') {
    entity doctor  as projection on my.Doctors;
    entity HealthCenters as projection on my.HealthCenters;
}


annotate DoctorAdmin.doctor with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Doctor',
        TypeNamePlural : 'Doctors',
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
    {Value : speciality}
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
        },{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#HealthCenter',
            Label  : 'Medical Details'
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
    ]},
    FieldGroup #HealthCenter: {Data : [
    {Value : speciality},
    {Value : ID},
    {Value : HealthCenter.name},
    ]}
});

annotate DoctorAdmin.doctor with {
    speciality @( Common: { Label: '{i18n>speciality}'} );
    ID @( Common: { Label: '{i18n>Doc.ID}'} );
    name @( Common: { Label: '{i18n>Name}'} );
    lastName @( Common: { Label: '{i18n>LastName}'} );
    dni @( Common: { Label: '{i18n>DNI}'} );
    birthDate @( Common: { Label: '{i18n>BirthDate}'} );
    address @( Common: { Label: '{i18n>Address}'} );
    city    @( Common: { Label: '{i18n>City}'} );
    country   @( Common: { Label: '{i18n>Country}'} );
    zipcode @( Common: { Label: '{i18n>ZipCode}'} );
}


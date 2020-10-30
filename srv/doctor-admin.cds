using {sap.capire.virtualprescription as my} from '../db/schema';

service DoctorAdmin @(_requires : 'authenticated-user') {
    entity doctor as projection on my.Doctors;
}


annotate DoctorAdmin.doctor with @(UI : {
    HeaderInfo               : {
        TypeName       : 'Doctor',
        TypeNamePlural : 'Doctors',
        Title          : {Value : name},
        Description    : {Value : ID}
    },
    SelectionFields          : [
    ID,
    dni,
    name,
    lastName
    ],
    LineItem                 : [
    {Value : ID},
    {Value : name},
    {Value : lastName},
    {Value : speciality}
    ],
    HeaderFacets             : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Header',
        Label  : 'Doctor'
    }],
    Facets                   : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Doctor Details',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Main',
                Label  : 'Personal Information'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Address',
                Label  : 'Address Information'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#HealthCenter',
                Label  : 'Medical Details'
            }
        ]
    }],
    FieldGroup #Header       : {Data : [
    {Value : lastName},
    {Value : birthDate},
    {Value : dni},
    {Value : ID},
    {Value : speciality},
    ]},
    FieldGroup #Main         : {Data : [
    {Value : ID},
    {Value : name},
    {Value : lastName},
    {Value : birthDate},
    {Value : dni}
    ]},
    FieldGroup #Address      : {Data : [
    {Value : contact.address},
    {Value : contact.city},
    {Value : contact.country},
    {Value : contact.zipcode},
    ]},
    FieldGroup #HealthCenter : {Data : [
    {Value : speciality},
    {Value : ID},
    {
        $Type : 'UI.DataField',
        Value : healthcenter.name,
        Label : '{i18n>helthcenterName}'
    },
    ]}
});

annotate DoctorAdmin.doctor with {
    speciality @(Common : {Label : '{i18n>speciality}'});
    ID         @(Common : {Label : '{i18n>Doc.ID}'});
    name       @(Common : {Label : '{i18n>Name}'});
    lastName   @(Common : {Label : '{i18n>LastName}'});
    dni        @(Common : {Label : '{i18n>DNI}'});
    birthDate  @(Common : {Label : '{i18n>BirthDate}'});
    address    @(Common : {Label : '{i18n>Address}'});
    city       @(Common : {Label : '{i18n>City}'});
    country    @(Common : {Label : '{i18n>Country}'});
    zipcode    @(Common : {Label : '{i18n>ZipCode}'});
}

using {sap.capire.virtualprescription as my} from '../db/schema';

service CenterAdmin @(_requires : 'authenticated-user') {
    entity HealthCenters as projection on my.HealthCenters;
}


annotate CenterAdmin.HealthCenters with @(UI : {
    HeaderInfo               : {
        TypeName       : 'Health Centers',
        TypeNamePlural : 'Health Center',
        Title          : {Value : name},
        Description    : {Value : ID}
    },
    SelectionFields          : [
    ID,
    type.descr,
    name,
    speciality
    ],
    LineItem                 : [
    {Value : ID},
    {Value : name},
    {Value : type.descr},
    {Value : speciality}
    ],
    Facets                   : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Health Center Details',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Main',
                Label  : 'Center Details'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Address',
                Label  : 'Address Information'
            }
        ]
    }],
    FieldGroup #Main         : {Data : [
    {Value : ID},
    {Value : name},
    {Value : type.descr},
    {Value : speciality},
    ]},
    FieldGroup #Address      : {Data : [
    {Value : contact.address},
    {Value : contact.city},
    {Value : contact.country},
    {Value : contact.zipcode},
    ]}
});

annotate CenterAdmin.HealthCenters with {
    speciality @(Common : {Label : '{i18n>speciality}'});
    ID         @(Common : {Label : '{i18n>ID}'});
    name       @(Common : {Label : '{i18n>Name}'});
    type       @(Common : {Label : '{i18n>CenterType}'});
}


annotate contact  with{
    address @( Common: { Label: '{i18n>Address}'} );
    city    @( Common: { Label: '{i18n>City}'} );
    country @( Common: { Label: '{i18n>Country}'} );
    zipcode @( Common: { Label: '{i18n>ZipCode}'} );
} ;

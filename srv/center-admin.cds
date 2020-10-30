using {sap.capire.virtualprescription as my} from '../db/schema';

service CenterAdmin @(_requires : 'authenticated-user') {
    @odata.draft.enabled
    entity HealthCenters as projection on my.HealthCenters;
}

annotate CenterAdmin.HealthCenters with @(UI : {
    HeaderInfo          : {
        TypeName       : 'Health Centers',
        TypeNamePlural : 'Health Center',
        Title          : {Value : name},
        Description    : {Value : ID}
    },
    SelectionFields     : [
    ID,
    type.descr,
    name,
    speciality
    ],
    LineItem            : [
    {Value : ID},
    {Value : name},
    {Value : type.descr, Label : '{i18n>CenterType}'},
    {Value : speciality}
    ],
    HeaderFacets        : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Header',
        Label  : 'Health Center'
    }],
    Facets              : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Health Center Details',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#ContactInfo',
                Label  : 'Contact Details'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Address',
                Label  : 'Address Information'
            }
        ]
    }],
    FieldGroup #Header    : {Data : [
    {Value : name},
    {Value : type.descr},
    {Value : speciality, Label : '{i18n>CenterType}'},
    ]},
    FieldGroup #ContactInfo : {Data : [
    {Value : contact.email},
    {Value : contact.phone},
    ]},
    FieldGroup #Address : {Data : [
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


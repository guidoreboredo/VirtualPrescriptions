namespace sap.capire.virtualprescription;

using {
    Currency,
    managed,
    cuid,
    Country
} from '@sap/cds/common';

entity Patients {
    key ID             : String(8); @title : '{i18n>Pat.ID}'
        name           : String(30);@title : '{i18n>Name}'
        lastName       : String(30);@title : '{i18n>LastName}'
        dni            : Integer;   @title : '{i18n>DNI}'
        birthDate      : Date;      @title : '{i18n>BirthDate}'
        email          : String(30);@title : '{i18n>Email}'
        phone          : Integer;   @title : '{i18n>Phone}'
        address        : String(30);@title : '{i18n>Address}'
        city           : String(30);@title : '{i18n>City}'
        country        : String(30);@title : '{i18n>Country}'
        zipcode        : String(30);
        HealthNr       : Association to HealthInurances
};

entity Doctors {
    key ID             : String(8);
        name           : String(30);
        @title : '{i18n>Name}'
        lastName       : String(30);
        dni            : Integer;
        birthDate      : Date;
        email          : String(30);
        phone          : Integer;
        address        : String(30);
        city           : String(30);
        country        : String(30);
        zipcode        : String(30);
        speciality     : String(30);
        healthcenter   : Association to HealthCenters;
}

@cds.autoexpose
entity HealthInurances {
    key ID: String(8);
    key benNr: String(2);
    filial: String (2);
    control: String(1);
    TAXCond: String(2);
    plan: String(3) @title: '{i18n>Plan}'
}


@cds.autoexpose
entity Contacts {
    key ID         : String(6);
    email          : String(30);
    phone          : Integer;
    address        : String(30);
    city           : String(30);
    country        : String(30);
    zipcode        : String(30);
}


@cds.autoexpose
entity HealthCenters: Contacts {
    key ID         : String(8);
    Type           : String (2);
    name           : String(30);
    speciality     : String(30);
    contact        : Association to Contacts;
}


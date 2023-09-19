using RiskService from '../../srv/risk-service';

 // Risk List Report Page
 annotate RiskService.Risks with @(UI : {
     HeaderInfo : {
       TypeName : 'Risk',
       TypeNamePlural : 'Risks',
       Title : {
         $Type : 'UI.DataField',
         Value : title
       },
       Description : {
         $Type : 'UI.DataField',
         Value : descr
       }
   },
   SelectionFields : [prio],
   Identification : [{Value : title}],
   // Define the table columns
   LineItem : [
   {Value : title},
     {Value : miti_ID},
     {Value : owner},
     //### BEGIN OF INSERT
     {Value : bp_BusinessPartner},
     //### END OF INSERT
     {
       Value : prio,
       Criticality : criticality
     },
     {
       Value : impact,
       Criticality : criticality
     },
   ],
 });

 // Risk Object Page
 annotate RiskService.Risks with @(UI : {
   Facets : [{
     $Type : 'UI.ReferenceFacet',
     Label : 'Main',
     Target : '@UI.FieldGroup#Main',
   },
       {
           $Type : 'UI.ReferenceFacet',
           Label : 'Additional Info',
           ID : 'AdditionalInfo',
           Target : '@UI.FieldGroup#AdditionalInfo',
       }],
   FieldGroup #Main : {Data : [
     {
           $Type : 'UI.DataField',
           Value : title,
       },
       {Value : miti_ID},
       {Value : owner},
       //### BEGIN OF INSERT
     {Value : bp_BusinessPartner},
       //### END OF INSERT
     {
       Value : prio,
       Criticality : criticality
     },
       {
       Value : impact,
       Criticality : criticality
     }
   ]},
 });

annotate RiskService.Risks with @(
    UI.FieldGroup #AdditionalInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },{
                $Type : 'UI.DataField',
                Value : createdBy,
            },{
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },{
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },],
    }
);

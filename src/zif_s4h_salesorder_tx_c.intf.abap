interface ZIF_S4H_SALESORDER_TX_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF ZS4H_SALESORDER_TX,
 CREATE_ZS4H_SALESORDER_TX      TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F109146368C578',
 DELETE_ZS4H_SALESORDER_TX      TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F1091463694578',
 LOCK_ZS4H_SALESORDER_TX        TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F1091463680578',
 SAVE_ZS4H_SALESORDER_TX        TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F109146369C578',
 SET_TO_PAID                    TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F20C9AD3056DD7',
 UNLOCK_ZS4H_SALESORDER_TX      TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F1091463684578',
 UPDATE_ZS4H_SALESORDER_TX      TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F1091463690578',
 VALIDATE_ZS4H_SALESORDER_TX    TYPE /BOBF/ACT_KEY VALUE '288023A883C01EE8A7F1091463698578',
      END OF ZS4H_SALESORDER_TX,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZS4H_SALESORDER_TX,
        BEGIN OF LOCK_ZS4H_SALESORDER_TX,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF LOCK_ZS4H_SALESORDER_TX,
        BEGIN OF UNLOCK_ZS4H_SALESORDER_TX,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF UNLOCK_ZS4H_SALESORDER_TX,
      END OF ZS4H_SALESORDER_TX,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZS4H_SALESORDER_TX,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '288023A883C01EE8A7F10BA6E97D4595',
      END OF ZS4H_SALESORDER_TX,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZS4H_SALESORDER_TX,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01EE8A7F109146367E578',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01EE8A7F109146367A578',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01EE8A7F109146368A578',
      END OF ZS4H_SALESORDER_TX,
      BEGIN OF ZS4H_SALESORDER_TX_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01EE8A7F10914636A2578',
      END OF ZS4H_SALESORDER_TX_LOCK,
      BEGIN OF ZS4H_SALESORDER_TX_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01EE8A7F10914636A0578',
      END OF ZS4H_SALESORDER_TX_MESSAGE,
      BEGIN OF ZS4H_SALESORDER_TX_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01EE8A7F10914636A4578',
      END OF ZS4H_SALESORDER_TX_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZS4H_SALESORDER_TX,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZS4H_SALESORDER_TX,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '288023A883C01EE8A7F108E037FA0578' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZS4H_SALESORDER_TX' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF ZS4H_SALESORDER_TX,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '288023A883C01EE8A7F10BA6E97D6595',
      END OF ZS4H_SALESORDER_TX,
    END OF SC_DETERMINATION .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 ZS4H_SALESORDER_TX             TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01EE8A7F108E037FA4578',
 ZS4H_SALESORDER_TX_LOCK        TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01EE8A7F109146367C578',
 ZS4H_SALESORDER_TX_MESSAGE     TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01EE8A7F1091463678578',
 ZS4H_SALESORDER_TX_PROPERTY    TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01EE8A7F1091463688578',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZS4H_SALESORDER_TX,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  SALESORDER                     TYPE STRING VALUE 'SALESORDER',
  BUSINESSPARTNER                TYPE STRING VALUE 'BUSINESSPARTNER',
  CURRENCYCODE                   TYPE STRING VALUE 'CURRENCYCODE',
  GROSSAMOUNT                    TYPE STRING VALUE 'GROSSAMOUNT',
  NETAMOUNT                      TYPE STRING VALUE 'NETAMOUNT',
  BILLINGSTATUS                  TYPE STRING VALUE 'BILLINGSTATUS',
  OVERALLSTATUS                  TYPE STRING VALUE 'OVERALLSTATUS',
  CREA_DATE_TIME                 TYPE STRING VALUE 'CREA_DATE_TIME',
  CREA_UNAME                     TYPE STRING VALUE 'CREA_UNAME',
  LCHG_DATE_TIME                 TYPE STRING VALUE 'LCHG_DATE_TIME',
  LCHG_UNAME                     TYPE STRING VALUE 'LCHG_UNAME',
      END OF ZS4H_SALESORDER_TX,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZS4H_SALESORDER_TX,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '288023A883C01EE8A7F108E037FA6578',
      END OF ZS4H_SALESORDER_TX,
    END OF SC_NODE_CATEGORY .
endinterface.

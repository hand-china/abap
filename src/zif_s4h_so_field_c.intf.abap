interface ZIF_S4H_SO_FIELD_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF ZS4H_SO_FIELD,
 CREATE_ZS4H_SO_FIELD           TYPE /BOBF/ACT_KEY VALUE '288023A883C01ED8A9D3AF9CF5147D6B',
 DELETE_ZS4H_SO_FIELD           TYPE /BOBF/ACT_KEY VALUE '288023A883C01ED8A9D3AF9CF514FD6B',
 LOCK_ZS4H_SO_FIELD             TYPE /BOBF/ACT_KEY VALUE '288023A883C01ED8A9D3AF9CF513BD6B',
 SAVE_ZS4H_SO_FIELD             TYPE /BOBF/ACT_KEY VALUE '288023A883C01ED8A9D3AF9CF5157D6B',
 UNLOCK_ZS4H_SO_FIELD           TYPE /BOBF/ACT_KEY VALUE '288023A883C01ED8A9D3AF9CF513FD6B',
 UPDATE_ZS4H_SO_FIELD           TYPE /BOBF/ACT_KEY VALUE '288023A883C01ED8A9D3AF9CF514BD6B',
 VALIDATE_ZS4H_SO_FIELD         TYPE /BOBF/ACT_KEY VALUE '288023A883C01ED8A9D3AF9CF5153D6B',
      END OF ZS4H_SO_FIELD,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZS4H_SO_FIELD,
        BEGIN OF LOCK_ZS4H_SO_FIELD,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF LOCK_ZS4H_SO_FIELD,
        BEGIN OF UNLOCK_ZS4H_SO_FIELD,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF UNLOCK_ZS4H_SO_FIELD,
      END OF ZS4H_SO_FIELD,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZS4H_SO_FIELD,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '288023A883C01ED8A9D3AF9CF5165D6B',
      END OF ZS4H_SO_FIELD,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZS4H_SO_FIELD,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01ED8A9D3AF9CF5139D6B',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01ED8A9D3AF9CF5135D6B',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01ED8A9D3AF9CF5145D6B',
      END OF ZS4H_SO_FIELD,
      BEGIN OF ZS4H_SO_FIELD_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01ED8A9D3AF9CF515DD6B',
      END OF ZS4H_SO_FIELD_LOCK,
      BEGIN OF ZS4H_SO_FIELD_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01ED8A9D3AF9CF515BD6B',
      END OF ZS4H_SO_FIELD_MESSAGE,
      BEGIN OF ZS4H_SO_FIELD_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '288023A883C01ED8A9D3AF9CF515FD6B',
      END OF ZS4H_SO_FIELD_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZS4H_SO_FIELD,
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
      END OF ZS4H_SO_FIELD,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '288023A883C01ED8A9D3AF9CF512BD6B' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZS4H_SO_FIELD' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF ZS4H_SO_FIELD,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '288023A883C01ED8A9D3AFC266909D6B',
      END OF ZS4H_SO_FIELD,
    END OF SC_DETERMINATION .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 ZS4H_SO_FIELD                  TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01ED8A9D3AF9CF512FD6B',
 ZS4H_SO_FIELD_LOCK             TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01ED8A9D3AF9CF5137D6B',
 ZS4H_SO_FIELD_MESSAGE          TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01ED8A9D3AF9CF5133D6B',
 ZS4H_SO_FIELD_PROPERTY         TYPE /BOBF/OBM_NODE_KEY VALUE '288023A883C01ED8A9D3AF9CF5143D6B',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZS4H_SO_FIELD,
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
      END OF ZS4H_SO_FIELD,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZS4H_SO_FIELD,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '288023A883C01ED8A9D3AF9CF5131D6B',
      END OF ZS4H_SO_FIELD,
    END OF SC_NODE_CATEGORY .
endinterface.
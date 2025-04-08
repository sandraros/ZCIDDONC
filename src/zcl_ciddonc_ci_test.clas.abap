CLASS zcl_ciddonc_ci_test DEFINITION
  PUBLIC
  INHERITING FROM cl_ci_test_root
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor.

    METHODS get_attributes              REDEFINITION.
    METHODS put_attributes              REDEFINITION.
    METHODS run                         REDEFINITION.
    METHODS if_ci_test~query_attributes REDEFINITION.

  PROTECTED SECTION.
    METHODS get REDEFINITION.

  PRIVATE SECTION.
    DATA pa_tabl_prefix         TYPE ddobjname.
    DATA pa_stru_prefix         TYPE ddobjname.
    DATA pa_custom_field_prefix TYPE ddobjname.
    DATA pa_view_prefix         TYPE ddobjname.
    DATA pa_dtel_prefix         TYPE ddobjname.
    DATA pa_doma_prefix         TYPE ddobjname.
    DATA pa_ttyp_prefix         TYPE ddobjname.
    DATA pa_shlp_prefix         TYPE ddobjname.
    DATA pa_type_prefix         TYPE ddobjname.

    CONSTANTS c_my_name TYPE sci_chk VALUE 'ZCL_CIDDONC_CI_TEST' ##NO_TEXT.
ENDCLASS.


CLASS zcl_ciddonc_ci_test IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    description = 'Extended Naming Conventions for DDIC objects'(000).
    category    = 'CL_CI_CATEGORY_CONVENTIONS'.
    position    = '910'.
    version     = '001'.

    add_obj_type( c_type_ddic_table ).
    add_obj_type( 'VIEW' ).
    add_obj_type( 'DOMA' ).
    add_obj_type( 'DTEL' ).
    add_obj_type( 'TTYP' ).
    add_obj_type( 'SHLP' ).
    add_obj_type( 'TYPE' ).

    has_attributes = c_true.
    has_documentation = c_true.

    pa_tabl_prefix = 'Z(FI|MM|CO|PM)_'.
    pa_stru_prefix = 'ZS_'.
    pa_custom_field_prefix = 'ZZ'.
    pa_view_prefix = 'ZV_'.
    pa_dtel_prefix = 'ZE_'.
    pa_doma_prefix = 'ZD_'.
    pa_ttyp_prefix = 'ZTT_'.
    pa_shlp_prefix = 'ZSH_'.
    pa_type_prefix = 'ZZ'.

    attributes_ok = c_true.

    scimessages = VALUE #( test = c_my_name
                           kind = 'E'
                           ( code = 'TABLE'      text = 'Table prefix should be &1'(001) )
                           ( code = 'STRUCTURE'  text = 'Structure prefix should be &1'(002) )
                           ( code = 'CUST_FIELD' text = 'Custom field &1 prefix should be &2'(030) )
                           ( code = 'VIEW'       text = 'View prefix should be &1'(003) )
                           ( code = 'DOMA'       text = 'Domain prefix should be &1'(004) )
                           ( code = 'DTEL'       text = 'Data element prefix should be &1'(005) )
                           ( code = 'TTYP'       text = 'Table type prefix should be &1'(006) )
                           ( code = 'SHLP'       text = 'Search help prefix should be &1'(007) )
                           ( code = 'TYPE'       text = 'Type pool prefix should be &1'(008) ) ).
  ENDMETHOD.

  METHOD get.
    super->get( ).
  ENDMETHOD.

  METHOD get_attributes.
    EXPORT pa_tabl_prefix         = pa_tabl_prefix
           pa_stru_prefix         = pa_stru_prefix
           pa_custom_field_prefix = pa_custom_field_prefix
           pa_view_prefix         = pa_view_prefix
           pa_doma_prefix         = pa_doma_prefix
           pa_dtel_prefix         = pa_dtel_prefix
           pa_ttyp_prefix         = pa_ttyp_prefix
           pa_shlp_prefix         = pa_shlp_prefix
           pa_type_prefix         = pa_type_prefix
           TO DATA BUFFER p_attributes.
  ENDMETHOD.

  METHOD if_ci_test~query_attributes.
    " REF:
    "   - Reference to DDIC data element to define the field length -> PARAMETERS.
    "     STRING and XSTRING types are not permitted.
    "   - It may also be a DDIC table type -> SELECT-OPTIONS ... FOR ... OBLIGATORY NO INTERVALS
    "   - ignored if KIND = "G"
    " KIND:
    "   - G: selection screen block
    "   - C: checkbox
    "   - R: radio button group
    "   - L: listbox
    "   - Other: normal
    DATA(l_attributes) = VALUE sci_atttab( ( ref = REF #( sy-abcde )               text = 'DDIC Objects'(010) kind = 'G' )
                                           ( ref = REF #( pa_tabl_prefix )         text = 'Table prefix'(011) )
                                           ( ref = REF #( pa_stru_prefix )         text = 'Structure prefix'(012) )
                                           ( ref = REF #( pa_custom_field_prefix ) text = 'Custom field prefix of std tab'(019) )
                                           ( ref = REF #( pa_view_prefix )         text = 'View prefix'(013) )
                                           ( ref = REF #( pa_doma_prefix )         text = 'Domain prefix'(014) )
                                           ( ref = REF #( pa_dtel_prefix )         text = 'Data element prefix'(015) )
                                           ( ref = REF #( pa_ttyp_prefix )         text = 'Table type prefix'(016) )
                                           ( ref = REF #( pa_shlp_prefix )         text = 'Search help prefix'(017) )
                                           ( ref = REF #( pa_type_prefix )         text = 'Type pool prefix'(018) ) ).

    cl_ci_query_attributes=>generic( p_name       = 'ZCL_CIDDONC_CI_TEST'  ##NEEDED
                                     p_title      = 'DDIC Object Naming'(020)
                                     p_attributes = l_attributes
                                     p_display    = p_display ).
    " Check screen values, late verified when the SCI variant is saved.
    IF    pa_tabl_prefix         IS INITIAL
       OR pa_stru_prefix         IS INITIAL
       OR pa_custom_field_prefix IS INITIAL
       OR pa_view_prefix         IS INITIAL
       OR pa_doma_prefix         IS INITIAL
       OR pa_dtel_prefix         IS INITIAL
       OR pa_ttyp_prefix         IS INITIAL
       OR pa_shlp_prefix         IS INITIAL
       OR pa_type_prefix         IS INITIAL.
      attributes_ok = c_false.
    ELSE.
      attributes_ok = c_true.
    ENDIF.
  ENDMETHOD.

  METHOD put_attributes.
    IMPORT pa_tabl_prefix         = pa_tabl_prefix
           pa_stru_prefix         = pa_stru_prefix
           pa_custom_field_prefix = pa_custom_field_prefix
           pa_view_prefix         = pa_view_prefix
           pa_doma_prefix         = pa_doma_prefix
           pa_dtel_prefix         = pa_dtel_prefix
           pa_ttyp_prefix         = pa_ttyp_prefix
           pa_shlp_prefix         = pa_shlp_prefix
           pa_type_prefix         = pa_type_prefix
           FROM DATA BUFFER p_attributes.
  ENDMETHOD.

  METHOD run.
    IF object_type NOT IN typelist.
      RETURN.
    ENDIF.
    CASE object_type.
      WHEN 'TABL'.
        SELECT SINGLE tabclass, sqltab
          FROM dd02l
          WHERE tabname = @object_name
          INTO (@DATA(table_structure_or_append),@DATA(extended_table_structure)).
        IF sy-subrc <> 0.
          RETURN.
        ENDIF.

        IF    table_structure_or_append = 'INTTAB'
           OR table_structure_or_append = 'APPEND'.
          FIND REGEX |^{ pa_stru_prefix }| IN object_name.
          IF sy-subrc <> 0.
            inform( p_test    = c_my_name
                    p_code    = 'STRUCTURE' " CODE key in internal table SCIMESSAGES
                    p_param_1 = pa_stru_prefix ).
          ELSEIF table_structure_or_append = 'APPEND'.
            SELECT fieldname
              FROM dd03l
              WHERE tabname          = @object_name
                AND fieldname NOT LIKE '.%'
              INTO TABLE @DATA(extended_fields).
            LOOP AT extended_fields REFERENCE INTO DATA(extended_field).
              FIND REGEX |^{ pa_custom_field_prefix }| IN extended_field->fieldname.
              IF sy-subrc <> 0.
                inform( p_test    = c_my_name
                        p_code    = 'CUST_FIELD' " CODE key in internal table SCIMESSAGES
                        p_param_1 = extended_field->fieldname
                        p_param_2 = pa_custom_field_prefix ).
              ENDIF.
            ENDLOOP.
          ENDIF.
        ELSEIF object_name NP 'CI_*'.
          FIND REGEX |^{ pa_tabl_prefix }| IN object_name.
          IF sy-subrc <> 0.
            inform( p_test    = c_my_name
                    p_code    = 'TABLE' " CODE key in internal table SCIMESSAGES
                    p_param_1 = pa_tabl_prefix ).
          ENDIF.
        ENDIF.

      WHEN 'VIEW'.
        FIND REGEX |^{ pa_view_prefix }| IN object_name.
        IF sy-subrc <> 0.
          inform( p_test    = c_my_name
                  p_code    = 'VIEW' " CODE key in internal table SCIMESSAGES
                  p_param_1 = pa_view_prefix ).
        ENDIF.
      WHEN 'DOMA'.
        FIND REGEX |^{ pa_doma_prefix }| IN object_name.
        IF sy-subrc <> 0.
          inform( p_test    = c_my_name
                  p_code    = 'DOMA' " CODE key in internal table SCIMESSAGES
                  p_param_1 = pa_doma_prefix ).
        ENDIF.
      WHEN 'DTEL'.
        FIND REGEX |^{ pa_dtel_prefix }| IN object_name.
        IF sy-subrc <> 0.
          inform( p_test    = c_my_name
                  p_code    = 'DTEL' " CODE key in internal table SCIMESSAGES
                  p_param_1 = pa_dtel_prefix ).
        ENDIF.
      WHEN 'TTYP'.
        FIND REGEX |^{ pa_ttyp_prefix }| IN object_name.
        IF sy-subrc <> 0.
          inform( p_test    = c_my_name
                  p_code    = 'TTYP' " CODE key in internal table SCIMESSAGES
                  p_param_1 = pa_ttyp_prefix ).
        ENDIF.
      WHEN 'SHLP'.
        FIND REGEX |^{ pa_shlp_prefix }| IN object_name.
        IF sy-subrc <> 0.
          inform( p_test    = c_my_name
                  p_code    = 'SHLP' " CODE key in internal table SCIMESSAGES
                  p_param_1 = pa_shlp_prefix ).
        ENDIF.
      WHEN 'TYPE'.
        FIND REGEX |^{ pa_type_prefix }| IN object_name.
        IF sy-subrc <> 0.
          inform( p_test    = c_my_name
                  p_code    = 'TYPE' " CODE key in internal table SCIMESSAGES
                  p_param_1 = pa_type_prefix ).
        ENDIF.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.

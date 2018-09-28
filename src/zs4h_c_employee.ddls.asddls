@AbapCatalog.sqlViewName: 'ZS4H_EMP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Contact data'
@OData: {
    publish: true
}
--@ObjectModel.semanticKey: 'Employees'

@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.compositionRoot: true
@ObjectModel.transactionalProcessingEnabled: true
@ObjectModel.writeActivePersistence: 'SNWD_EMPLOYEES'

@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.updateEnabled: true
define view ZS4H_C_EMPLOYEE
  as select from snwd_employees
{
      @UI.identification.position: 10
  key node_key,
      @UI.identification.position: 20
      @ObjectModel.readOnly: true
      snwd_employees.employee_id,
      @UI.identification.position: 30
      @Semantics.name.givenName: true
      snwd_employees.first_name,
      @UI.identification.position: 40
      @Semantics.name.additionalName: true
      snwd_employees.middle_name,
      @UI.identification.position: 50
      @Semantics.name.familyName: true
      snwd_employees.last_name,
      @UI.identification.position: 60
      snwd_employees.initials,
      @UI.identification.position: 70
      @Semantics.url
      snwd_employees.employee_pic_url,
      @UI.identification.position: 80
      @Semantics.telephone.type: #PREF
      phone_number,
      @UI.identification.position: 90
      @Semantics.eMail.address: true
      snwd_employees.email_address
}

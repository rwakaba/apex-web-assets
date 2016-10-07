public abstract class ActionHandler {

    protected Map<String, String> getParameters;
    protected  Object property;

    /**
     * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_system_pagereference.htm
     */
    public PageReference action() {
        try {
            this.getParameters = ApexPages.currentPage().getParameters();
            before();
            PageReference forward = handleAction();
            after();
            return forward;
        } catch (Exception e) {
            return handleException(e);
        }
    }

    protected String getParameter(String name) {
        return ApexPages.currentPage().getParameters().get(name);
    }

    protected Integer getParameterAsInteger(String name, Integer defaultVal) {
        String val = getParameter(name);
        return String.isNotBlank(val) ? Integer.valueOf(val) : defaultVal;
    }
    
    public ActionHandler setProperty(Object property) {
        this.property = property;
        return this;
    }

    protected Id getSalesforceId(String name) {
        Id ret = null;
        try {
            ret = Id.valueOf(getParameters.get(name));
        } catch (TypeException e) {
            handleException(e);
        }
        return ret;
    }

    /**
      * Get Sample.
      * public class GetHandler extends ActionHandler {
      *   public override PageReference handleAction() {
      *       Id accountId = getSalesforceId('id');
      *       Account a = [SELECT name FROM Account WHERE Id = :accountId];
      *
      *       if (a == null) {
      *           throw new NoDataFoundException();
      *       }

      *       SampleProperty prop = (SampleProperty) property;
      *       prop.myAccount = a;
      *       return null;
      *   }
      * }
      *
      * Get Sample.
      * public class SearchHandler extends ActionHandler {
      *     public override PageReference handleAction() {
      *         return null;
      *     }
      * }
      * 
      * Post Sample.
      * public class ConfirmHandler extends ActionHandler {
      *     public override PageReference handleAction() {
      *         return null;
      *     }
      * }
      * 
      * Post and Redirect Sample.
      * public class SaveHandler extends ActionHandler {
      *     public override PageReference handleAction() {
      *         return null;
      *     }
      * }
      */
    public abstract PageReference handleAction();

    public abstract void before();
    public abstract void after();
    public abstract PageReference handleException(Exception e);
}

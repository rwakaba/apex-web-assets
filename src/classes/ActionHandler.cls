public abstract class ActionHandler {

    protected  Object properties;

    /**
     * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_system_pagereference.htm
     */
    public PageReference action() {
        try {
            before();
            PageReference forward = handleAction();
            after();
            return forward;
        } catch (Exception e) {
            return handleException(e);
        }
    }
    
    public ActionHandler setProperty(Object properties) {
        this.properties = properties;
        return this;
    }

    /**
      * All action classes must implement this method.
      */
    public abstract PageReference handleAction();

    public abstract void before();
    public abstract void after();
    public abstract PageReference handleException(Exception e);
}

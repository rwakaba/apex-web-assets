public class ParameterHandler {

    protected String getParameter(String name) {
        return ApexPages.currentPage().getParameters().get(name);
    }

    protected Integer getParameterAsInteger(String name, Integer defaultVal) {
        String val = getParameter(name);
        return String.isNotBlank(val) ? Integer.valueOf(val) : defaultVal;
    }
    
    protected Id getParameterAsSalesforceId(String name) {
        return Id.valueOf(getParameter(name));
    }
}

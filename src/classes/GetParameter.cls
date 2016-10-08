public class GetParameter {

    private static GetParameter instance;
    private GetParameter() {
    }

    public static GetParameter getInstance() {
        if (instance == null) {
            instance = new GetParameter();
        }
        return instance;
    }

    public String get(String name) {
        return ApexPages.currentPage().getParameters().get(name);
    }

    public Integer intValue(String name, Integer defaultVal) {
        String val = get(name);
        return String.isNotBlank(val) ? Integer.valueOf(val) : defaultVal;
    }
    
    public Id salesforceId(String name) {
        return Id.valueOf(get(name));
    }
}

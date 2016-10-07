public class ParameterCheck {

    private String parameterName = null;

    public ParameterCheck(String parameterName) {
        this.parameterName = parameterName;
    }

    private List<ParameterCheckRule> rules = new List<ParameterCheckRule>();

    /**
     * Add check rule of null value.
     * @param cThen type of behaviore after check ng.
     * @return Return own.
     */
    public ParameterCheck caseNull(ParameterCheckRule.CheckThen cThen) {
        this.rules.add(new ParameterCheckRule(
            new ParameterCheckRule.NullCheckRule(), cThen));
        return this;
    }

    /**
     * Add check rule of salesforce-id value.
     * @param cThen type of behaviore after check ng.
     * @return Return own.
     */
    public ParameterCheck caseIsNotSalesforceId(ParameterCheckRule.CheckThen cThen) {
        this.rules.add(new ParameterCheckRule(
            new ParameterCheckRule.SalesforceIdRule(), cThen));
        return this;
    }

    /**
     * Add check rule of integer value.
     * @param cThen type of behaviore after check ng.
     * @return Return own.
     */
    public ParameterCheck caseIsNotInteger(ParameterCheckRule.CheckThen cThen) {
        this.rules.add(new ParameterCheckRule(
            new ParameterCheckRule.IntegerCheckRule(), cThen));
        return this;
    }

    public void check() {
        String val = ApexPages.currentPage().getParameters().get(parameterName);
        system.debug('--------------------------------------');
        system.debug(parameterName + ' -> ' + val);
        system.debug('--------------------------------------');

        for (ParameterCheckRule r : rules) {
            if (!r.check(val)) {
                break;
            }
        }
    }
}

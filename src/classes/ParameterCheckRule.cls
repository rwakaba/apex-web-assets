public class ParameterCheckRule {

    private RuleImplementation rule;
    private CheckThen ct;

    public ParameterCheckRule(RuleImplementation rule, CheckThen ct) {
        this.rule = rule; this.ct = ct;
    }

    public Boolean check(String val) {
        if (!rule.checkRule(val)) {
            if (ct == CheckThen.Ignore) {
              // do nothing.
              return false;
            }
            if (ct == CheckThen.NotFound) {
                throw new NotFoundException();
            }
            if (ct == CheckThen.BadRequest) {
                throw new BadRequestException();
            }
            if (ct == CheckThen.IllegalState) {
                throw new IllegalStateException();
            }
        }
        return true;
    }

    /////////////////////////////////////////////////////////
    // Enum Definition.
    /////////////////////////////////////////////////////////

    public enum CheckThen {
        NotFound, BadRequest, IllegalState, Ignore
    }

    /////////////////////////////////////////////////////////
    // Inner Class and Interface Definition.
    /////////////////////////////////////////////////////////

    public Interface RuleImplementation {
        Boolean checkRule(String val);
    }

    /**
     * Rule implementation of Null.
     */
    public class NullCheckRule implements RuleImplementation {
        public Boolean checkRule(String val) {
            return String.isNotBlank(val);
        }
    }

    /**
     * Rule implementation of SalesforceId.
     */
    public class SalesforceIdRule implements RuleImplementation {
        public Boolean checkRule(String val) {
            try {
                Id.valueOf(val);
                system.debug('[check salesforce id -> OK]');
            } catch (Exception e) {
                system.debug('[check salesforce id -> NG]');
                return false;
            }
            return true;
        }
    }

    /**
     * Rule implementation of Integer.
     */
    public class IntegerCheckRule implements RuleImplementation {
        public Boolean checkRule(String val) {
            try {
                Integer.valueOf(val);
                system.debug('[check integer -> OK]');
            } catch (Exception e) {
                system.debug('[check integer -> NG]');
                return false;
            }
            return true;
        }
    }

    /////////////////////////////////////////////////////////
    // TODO remove to other place.
    /////////////////////////////////////////////////////////

    public class NotFoundException extends Exception {}
    public class BadRequestException extends Exception {}
    public class IllegalStateException extends Exception {}
}

/**
 * Wrap validation logic and provide continueous validation execution.
 *
 * TODO trim handling switch
 */
public class DefaultValidator {

    public ValidationResults results { get; private set; }

    public DefaultValidator() {
        results = new ValidationResults();
    }

    public InputResult checkRequired(String name, Object value) {
        InputResult r = Validation.checkRequired(value);
        results.put(name, r);
        return r;
    }

    public InputResult checkPattern(String name, String value, String regex, String label) {
        InputResult r = Validation.checkPattern(value, regex, label);
        results.put(name, r);
        return r;
    }

    public InputResult checkLength(String name, String value, Integer len) {
        InputResult r = Validation.checkLength(value, len);
        results.put(name, r);
        return r;
    }

    public InputResult checkMax(String name, String value, Decimal max) {
        InputResult r = Validation.checkMax(value, max);
        results.put(name, r);
        return r;
    }

    public InputResult checkMin(String name, String value, Decimal min) {
        InputResult r = Validation.checkMin(value, min);
        results.put(name, r);
        return r;
    }

    public InputResult checkCustomRule(String name, String value, Validation.CustomRule rule, String label) {
        InputResult r = Validation.checkCustomRule(value, rule, label);
        results.put(name, r);
        return r;
    }
}

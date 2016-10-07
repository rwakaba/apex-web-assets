public class Validation {

    /**
     * check the value to be input
     * @param value [Object] input value
     */
    public static InputResult checkRequired(Object value) {
        Boolean input = false;
        if (value != null) {
            if (value instanceof String) {
                input = !String.isEmpty((String) value);
            } else {
                input = true;
            }
        }
        if (input) {
            return new InputResult.Valid();
        } else {
            return new InputResult.NotInput();
        }
    }

    /**
     * check the value to be not over length
     * @param value [String] input value
     */
    public static InputResult checkLength(String value, Integer max) {
        if (value != null && value.length() > max) {
            return new InputResult.TooLong(max);
        }
        return new InputResult.Valid();
    }

    /**
     * check the value to be match the pattern
     * @param value [String] input value
     */
    public static InputResult checkPattern(String value, String regex, String label) {
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(value);

        if (!m.matches()) {
            return new InputResult.BadPattern(label);
        }
        return new InputResult.Valid();
    }

    /**
     * check the value to be not over max value
     * @param value [String] input value
     * @param max [Decimal] max value
     */
    public static InputResult checkMax(String value, Decimal max) {
        try {
            Decimal d = Decimal.valueOf(value);
            if (d > max) {
                return new InputResult.BigValue(max);
            }
            return new InputResult.Valid();
        } catch (TypeException e) {
            return new InputResult.InValid();
        }
    }

    /**
     * check the value to be not over min value
     * @param value [String] input value
     * @param max [Decimal] max value
     */
    public static InputResult checkMin(String value, Decimal min) {
        try {
            Decimal d = Decimal.valueOf(value);
            if (d < min) {
                return new InputResult.SmallValue(min);
            }
            return new InputResult.Valid();
        } catch (TypeException e) {
            return new InputResult.InValid();
        }
    }

    /**
     * check the value to be match the custom rule.
     * @param value [String] input value
     */
    public static InputResult checkCustomRule(String value, CustomRule rule, String label) {

        if (value == null) {
            return new InputResult.InValid();
        }
        if (!rule.fulfill(value)) {
            return new InputResult.CustomRuleError(label);
        }
        return new InputResult.Valid();
    }

    /**
     * Application Custom Rule.
     */
    public interface CustomRule {
        Boolean fulfill(String value);
    }
}


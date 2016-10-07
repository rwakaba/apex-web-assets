/**
 * represent one validation result class.
 */
public virtual class InputResult {
    public virtual String getValidContent() { return null; }
    public virtual String getMessage() { return null; }
    public virtual Type getType() { return null; }

    public class Valid extends InputResult {
        public override Type getType() {
            return Type.Valid;
        }
    }

    public class InValid extends InputResult {
        public override Type getType() {
            return Type.InValid;
        }
    }

    public class NotInput extends InputResult {
        public override Type getType() {
            return Type.NotInput;
        }
    }

    public class TooLong extends InputResult {
        public Integer value { get; private set; }

        public TooLong(Integer value) {
            this.value = value;
        }

        public override Type getType() {
            return Type.TooLong;
        }

        public override String getValidContent() {
            return String.valueOf(value);
        }
    }

    public class BadPattern extends InputResult {
        public String pattern { get; private set; }

        public BadPattern(String pattern) {
            this.pattern = pattern;
        }

        public override Type getType() {
            return Type.BadPattern;
        }

        public override String getValidContent() {
            return pattern;
        }
    }

    public class BigValue extends InputResult {
        public Decimal value { get; private set; }

        public BigValue(Decimal value) {
            this.value = value;
        }

        public override Type getType() {
            return Type.BigValue;
        }

        public override String getValidContent() {
            return String.valueOf(value);
        }
    }

    public class SmallValue extends InputResult {
        public Decimal value { get; private set; }

        public SmallValue(Decimal value) {
            this.value = value;
        }

        public override Type getType() {
            return Type.SmallValue;
        }

        public override String getValidContent() {
            return String.valueOf(value);
        }
    }

    public class CustomRuleError extends InputResult {
        private String message;

        public CustomRuleError(String message) {
            this.message = message;
        }

        public override Type getType() {
            return Type.CustomRuleError;
        }

        public override String getMessage() {
            return message;
        }
    }

    public enum Type {
        Valid, InValid, NotInput, TooLong, BadPattern, BigValue, SmallValue, CustomRuleError
    }
}

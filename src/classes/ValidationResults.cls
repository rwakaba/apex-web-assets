/**
 * holding all validatin results class.
 */
public class ValidationResults {
    private Map<String, List<InputResult>> results = new Map<String, List<InputResult>>();

    /**
     * Put validation result by name
     * @param name
     * @param result
     */
    public void put(String name, InputResult result) {
        getResults(name).add(result);
    }

    /**
     * Return true if error item exists.
     */
    public Boolean hasError() {
        for (String key : results.keySet()) {
            for (InputResult r : results.get(key)) {
                if (!(r instanceof InputResult.Valid)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * Return validation result list of the name.
     * @param name
     * @return list of validatin result.
     */
    public List<InputResult> getResults(String name) {
        if (!results.containsKey(name)) {
            List<InputResult> l = new List<InputResult>();
            results.put(name, l);
        }
        return results.get(name);
    }
}

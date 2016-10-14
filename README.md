# Apex Web Assets
## Features
### Action
ActionHandler is for Template Method Pattern.

before

    public class GetHandler extends ActionHandler {
        public override void before() {
            setRule('id').caseNull(NotFound).caseIsNotSalesforceId(NotFound).check();
        }
    }

handle exception

    public override PageReference handleException(Exception e) {
        //throw e;
        PageReference p= Page.DebugPage;
        p.setRedirect(true);
        p.getParameters().put('message', e.getMessage());
        p.getParameters().put('typeName', e.getTypeName());
        p.getParameters().put('stacktrace', e.getStackTraceString());
        return p;
    }

### Get Parameter Handling

    ParameterCheck rule = new ParameterCheck(paramName);
    rule('id').caseNull(NotFound).caseIsNotSalesforceId(NotFound).check();

### Form Validation
Controller
- First.

    // validation
    DefaultValidator val = new DefaultValidator();

- Required Check.

    val.checkRequired('title', ctrl.todo.Name);

- Length Check.

    val.checkLength('title', 80);

- Last.

    if (val.results.hasError()) {
        ctrl.vResult = val.results;
        return null;
    }

Components
For to show error messages, matching your application design, write your own message components.


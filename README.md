# apex web assets
## features
### get parameter handling

    parametercheck check = new parametercheck('id');
    check.casenull(notfound)
         .caseisnotsalesforceid(notfound)
         .check();

### action
actionhandler is for template method pattern.

#### extends

    public class gethandler extends actionhandler {
    }

#### before
write exception case in before method.

    public override void before() {
        parametercheck check = new parametercheck('id');
        check.casenull(notfound)
             .caseisnotsalesforceid(notfound)
             .check();
    }

then, main logic in action can be focused on the normal case.

    id accountid = getparameter.getinstance().salesforceid('id');
    account a = [select name from account where id = :accountid];

#### handle exception

    public override pagereference handleexception(exception e) {
        error__c log = new error__c();
        log.message__c = e.getmessage();
        log.typtname__c = e.gettypename();
        log.stacktracestring__c = e.getstacktracestring();
        insert log;

        if (debug) {
            pagereference p= page.debugpage;
            p.setredirect(true);
            p.getparameters().put('message', e.getmessage());
            p.getparameters().put('typename', e.gettypename());
            p.getparameters().put('stacktrace', e.getstacktracestring());
            return p;
        } else {
          throw e;
        }
    }

### form validation
#### controller

instantiation

    // validation
    defaultvalidator val = new defaultvalidator();

required check.

    val.checkrequired('title', ctrl.title);

length check.

    val.checkrequired('title', ctrl.title);
    val.checklength('title', 80);

check the result.

    if (val.results.haserror()) {
        ctrl.vresult = val.results;
        return null;
    }

#### components
for to show error messages, matching your application design, write your own message components.

1. Implements the ValidationErrorFormat

        public class AppValidationErrorFormat implements ValidationErrorFormat {
            public String requiredErrorFormat() {
                return 'field {0} is required';
            }

            public String badPatternErrorFormat() {
                return 'field {0} is bad pattern. Input by {1}';
            }

            public String tooLongErrorFormat() {
                return 'field {0} is bad pattern. Input by {1}';
            }

            public String bigErrorFormat() {
                return 'field {0} is bad pattern. Input by {1}';
            }

            public String smallErrorFormat() {
                return 'field {0} is bad pattern. Input by {1}';
            }
        }

2. Extends the ErrorMessageController

        public class AppErrorMessageController extends ErrorMessageController {
            protected override ValidationErrorFormat errorFormat() {
                return new AppValidationErrorFormat();
            }
        }

3. Write the Components.

        <apex:component controller="AppErrorMessageController" layout="none">

            <apex:attribute name="validationresults" type="validationresults" required="true" description="" assignto="{!results}"/>

            <apex:attribute name="name" type="string" required="true" description="" assignto="{!key}"/>

            <apex:attribute name="label" type="string" required="true" description="" assignto="{!displayname}"/>

            <!-- Required -->
            <apex:outputpanel rendered="{!shownotinputerror}" layout="none">
            <p class="error-msg"><i class="icon icon-error"></i>{!messagenotinput}</p>
            </apex:outputpanel>

            <!-- Pattern -->
            <apex:outputpanel rendered="{!showbadpatternerror}" layout="none">
            <p class="error-msg"><i class="icon icon-error"></i>{!messagebadpattern}</p>
            </apex:outputpanel>

            <!-- Length -->
            <apex:outputpanel rendered="{!showtoolongerror}" layout="none">
            <p class="error-msg"><i class="icon icon-error"></i>{!messagetoolong}</p>
            </apex:outputpanel>
        </apex:component>


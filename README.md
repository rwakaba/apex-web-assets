# uml
## view diagram
http://www.plantuml.com/plantuml/uml/SyfFKj2rKt3CoKnELR1Io4ZDoSa70000

## class diagram
@startuml
package "common components" #DDDDDD {
  class ActionHandler
  class GetParameter
  class Session
  class ParameterCheck
  class ParameterCheckRule
  class ParameterCheckRule.RuleImplementation
  class Validation
  class ValidationResults
  class InputResult
  class DefaultValidator
  class ErrorMessageController
}

package "app base components" #EEEEEE {
  class AppActionHandler
  class AppSession
  class AppErrorMessageController
  class ValidationMessage <<Components>>
}

package "Function Foo" #FFFFFF {
  class FooPage <<Page>>
  class FooController
  class FooAction
}

ActionHandler <|-up- AppActionHandler
Session <|-up- AppSession
AppActionHandler <|-up- FooAction

ParameterCheck *-- ParameterCheckRule
ParameterCheckRule *-- ParameterCheckRule.RuleImplementation
AppActionHandler o-- GetParameter
AppActionHandler o-- AppSession
AppActionHandler --> ParameterCheck
Validation --> InputResult
ValidationResults --> InputResult
DefaultValidator --> Validation
DefaultValidator o-- ValidationResults
ErrorMessageController o-- ValidationResults
ValidationMessage *-- ErrorMessageController
FooPage *-- FooController
FooController *-- FooAction
FooAction --> DefaultValidator
FooPage *-- ValidationMessage
@enduml

<apex:component controller="ErrorMessageController" layout="none">

    <apex:attribute name="validationResults" type="ValidationResults" required="true" description="" assignTo="{!results}"/>

    <apex:attribute name="name" type="String" required="true" description="" assignTo="{!key}"/>

    <apex:attribute name="label" type="String" required="true" description="" assignTo="{!displayName}"/>

	<!-- 必須エラー -->
    <apex:outputPanel rendered="{!showNotInputError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!messageNotInput}</p>
    </apex:outputPanel>

	<!-- 形式エラー -->
    <apex:outputPanel rendered="{!showBadPatternError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!messageBadPattern}</p>
    </apex:outputPanel>

	<!-- 文字数エラー -->
    <apex:outputPanel rendered="{!showTooLongError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!messageTooLong}</p>
    </apex:outputPanel>

	<!-- 最大数数エラー -->
    <apex:outputPanel rendered="{!showBigError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!messageBigValue}</p>
    </apex:outputPanel>

	<!-- 最小数数エラー -->
    <apex:outputPanel rendered="{!showSmallError}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!messageSmallValue}</p>
    </apex:outputPanel>

	<!-- 任意ルールエラー -->
    <apex:outputPanel rendered="{!showCustomRule}" layout="none">
		<p class="error-msg"><i class="icon icon-error"></i>{!resultCustomRuleError.message}</p>
    </apex:outputPanel>
</apex:component>

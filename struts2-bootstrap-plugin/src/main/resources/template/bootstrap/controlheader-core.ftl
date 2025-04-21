<#--
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#--
	Only show message if errors are available.
	This will be done if ActionSupport is used.
-->

<#assign hasFieldErrors = attributes.name?? && fieldErrors?? && fieldErrors.get(attributes.name?j_string)??/>
<#assign formControlClass = "form-control"/>

<#if (attributes.dynamicAttributes?? && attributes.dynamicAttributes?size > 0 && attributes.dynamicAttributes["labelCssClass"]??)><#rt/>
    <#assign labelCssClass = attributes.dynamicAttributes.remove("labelCssClass")/><#rt/>
<#else>
    <#assign labelCssClass ><@s.property value="#s2b_form_label_class" /></#assign><#rt/>
</#if><#rt/>
<#if (attributes.dynamicAttributes?? && attributes.dynamicAttributes?size > 0 && attributes.dynamicAttributes["elementCssClass"]??)><#rt/>
    <#assign elementCssClass = attributes.dynamicAttributes.remove("elementCssClass")/><#rt/>
<#else>
    <#assign elementCssClass ><@s.property value="#s2b_form_element_class" /></#assign><#rt/>
</#if><#rt/>
<#if (attributes.dynamicAttributes?? && attributes.dynamicAttributes?size > 0 && attributes.dynamicAttributes["formGroupCssClass"]??)><#rt/>
    <#assign formGroupCssClass = attributes.dynamicAttributes.remove("formGroupCssClass")/><#rt/>
<#else>
    <@s.if test="#s2b_form_class == 'form-horizontal'">
        <#assign formGroupCssClass >mb-3 row</#assign><#rt/>
    </@s.if><#rt/>
    <@s.else>
        <#assign formGroupCssClass ></#assign><#rt/>
    </@s.else><#rt/>
</#if><#rt/>
<#if (attributes.dynamicAttributes?? && attributes.dynamicAttributes?size > 0 && attributes.dynamicAttributes["formLabelCssClass"]??)><#rt/>
    <#assign formLabelCssClass = attributes.dynamicAttributes.remove("formLabelCssClass")/><#rt/>
<#else>
    <@s.if test="#s2b_form_class == 'form-horizontal'">
        <#assign formLabelCssClass >col-form-label</#assign><#rt/>
    </@s.if><#rt/>
    <@s.else>
        <#assign formLabelCssClass >form-label</#assign><#rt/>
    </@s.else><#rt/>
</#if><#rt/>

<@s.if test="#s2b_form_element_class != 'form-inline'">
<div class="${formGroupCssClass} <#rt/>
<#if hasFieldErrors>
 is-invalid <#rt/>
</#if>
"><#rt/>
<#if attributes.label??>
    <label class="${formLabelCssClass} ${labelCssClass}" <#t/>
        <#if attributes.id??>
           for="${attributes.id}" <#rt/>
        </#if>
            ><#rt/>
        <#if (attributes.required!false) && ((attributes.requiredPosition!"right") != 'right')>
            <span class="required">*</span>
        </#if>
    ${attributes.label}<#t/>
        <#if (attributes.required!false) && ((attributes.requiredPosition!"right") == 'right')>
            <span class="required">*</span>
        </#if>
    ${attributes.labelseparator!""}
        <#include "/${attributes.templateDir}/${attributes.expandTheme}/tooltip.ftl" />
    </label><#rt/>
<#else>
    <div class="${formLabelCssClass} ${labelCssClass}"></div>
</#if>
<#lt/>
    <div class="${elementCssClass}">
    <#if (attributes.dynamicAttributes?? && attributes.dynamicAttributes?size > 0 && attributes.dynamicAttributes["helpText"]??)><#rt/>
        <#assign helpText = attributes.dynamicAttributes.remove("helpText")/><#rt/>
    </#if><#rt/>
</@s.if>
<@s.else>
    <div class="col-auto">
</@s.else><#rt/>

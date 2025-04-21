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
<#assign hasFieldErrors = fieldErrors?? && fieldErrors.get(attributes.name?j_string)??/>
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
<div class="form-group ${formGroupCssClass} <#t/>
    <#if hasFieldErrors>
        is-invalid invalid-feedback <#t/>
    </#if>
    ${attributes.cssClass!''}" <#t/>
    <#if attributes.cssStyle??>
        style="${attributes.cssStyle}" <#t/>
    </#if>
>
    <div class="<@s.property value="#s2b_form_label_class" />"></div>
    <div class="<@s.property value="#s2b_form_element_class" /> controls">
    <#lt/>
    <#if (attributes.labelPosition!"") == 'left'>
    <div class="form-check-inline">
    <#else>
    <div class="form-check">
    </#if>
    <#if attributes.label??>
         <#include "/${attributes.templateDir}/${attributes.expandTheme}/simple/checkbox.ftl" />
        <label <#rt/>
                <#if attributes.id??>
                    for="${attributes.id}" <#t/>
                </#if>
                class="form-check-label"><#lt/>
            <#if (attributes.required!false) && ((attributes.requiredPosition!"right") != 'right')>
                <span class="required">*</span><#rt/>
            </#if>
        ${attributes.label}<#t/>
        <#if (attributes.required!false) && ((attributes.requiredPosition!"right") == 'right')>
            <span class="required">*</span><#t/>
        </#if>
        ${attributes.labelseparator!""}<#t/>
        <#include "/${attributes.templateDir}/${attributes.expandTheme}/tooltip.ftl" />
    </#if>
    <#if attributes.label??>
    </label>
    </div><#t/>
    </#if>
    <#include "/${attributes.templateDir}/${attributes.expandTheme}/controlfooter.ftl" /><#nt/>

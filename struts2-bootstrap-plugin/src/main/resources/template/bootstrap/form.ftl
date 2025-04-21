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

<#if attributes.cssClass?? && attributes.cssClass?contains("form-horizontal") >
    <@s.set var="s2b_form_class">form-horizontal</@s.set>
    <#if (attributes.dynamicAttributes?? && attributes.dynamicAttributes?size > 0 && attributes.dynamicAttributes["labelCssClass"]??)><#rt/>
        <#assign labelCssClass = attributes.dynamicAttributes.remove("labelCssClass")/><#rt/>
    <#else>
        <#assign labelCssClass = "col-sm-3"/><#rt/>
    </#if><#rt/>
    <#if (attributes.dynamicAttributes?? && attributes.dynamicAttributes?size > 0 && attributes.dynamicAttributes["elementCssClass"]??)><#rt/>
        <#assign elementCssClass = attributes.dynamicAttributes.remove("elementCssClass")/><#rt/>
    <#else>
        <#assign elementCssClass = "col-sm-9"/><#rt/>
    </#if><#rt/>
    <@s.set var="s2b_form_label_class">${labelCssClass}</@s.set>
    <@s.set var="s2b_form_element_class">${elementCssClass}</@s.set>
<#else>
    <@s.set var="s2b_form_class"></@s.set>
    <#if attributes.cssClass?? && attributes.cssClass?contains("form-inline")>
        <@s.set var="s2b_form_label_class">form-inline</@s.set>
        <@s.set var="s2b_form_element_class">form-inline</@s.set>
    <#else>
        <@s.set var="s2b_form_label_class"> </@s.set>
        <@s.set var="s2b_form_element_class"> </@s.set>
    </#if>
</#if>

<#include "/${attributes.templateDir}/simple/form-common.ftl" />
<#if (attributes.validate!false)>
 onreset="${attributes.onreset!'clearErrorMessages(this);clearErrorLabels(this);'}"
<#else>
    <#if attributes.onreset??>
 onreset="${attributes.onreset}"
    </#if>
</#if>
>
<#include "/${attributes.templateDir}/${attributes.expandTheme}/control.ftl" />

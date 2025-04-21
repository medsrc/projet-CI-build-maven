<#--
/*
 * $Id: doubleselect.ftl 1366884 2012-07-29 18:23:06Z jogep $
 *
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
<#include "/${attributes.templateDir}/simple/select.ftl" />
<#assign startCount = 0/>
<#if attributes.headerKey?? && attributes.headerValue??>
    <#assign startCount = startCount + 1/>
</#if>
<#if attributes.emptyOption??>
    <#assign startCount = startCount + 1/>
</#if>

<br/>
<select<#rt/>
 name="${attributes.doubleName!""}"<#rt/>
<#if attributes.disabled!false>
 disabled="disabled"<#rt/>
</#if>
<#if attributes.doubleTabindex??>
 tabindex="${attributes.doubleTabindex}"<#rt/>
</#if>
<#if attributes.doubleId??>
 id="${attributes.doubleId}"<#rt/>
</#if>
<#if attributes.doubleCss??>
 class="form-control ${attributes.doubleCss}"<#rt/>
<#else>
 class="form-control"<#rt/>
</#if>
<#if attributes.doubleStyle??>
 style="${attributes.doubleStyle}"<#rt/>
</#if>
<#if attributes.title??>
 title="${attributes.title}"<#rt/>
</#if>
<#if attributes.multiple!false>
 multiple="multiple"<#rt/>
</#if>
<#if attributes.get("doubleSize")??>
 size="${attributes.get("doubleSize")}"<#rt/>
</#if>
<#if attributes.doubleMultiple!false>
 multiple="multiple"<#rt/>
</#if>
<#if attributes.doubleDisabled!false>
 disabled="disabled"<#rt/>
</#if>
>
</select>
<#if attributes.doubleMultiple!false>
<input type="hidden" id="__multiselect_${attributes.doubleId}"<#rt/>
 name="__multiselect_${attributes.doubleName!""}" value=""<#rt/>
<#if attributes.doubleDisabled!false>
 disabled="disabled"<#rt/>
</#if>
/>
</#if>
<@s.script>
    <#assign itemCount = startCount/>
    var ${attributes.id}Group = new Array(${attributes.listSize} + ${startCount});
    for (i = 0; i < (${attributes.listSize} + ${startCount}); i++)
        ${attributes.id}Group[i] = [];

    <@s.iterator value="attributes.list">
        <#if attributes.listKey??>
            <#assign itemKey = stack.findValue(attributes.listKey)/>
        <#else>
            <#assign itemKey = stack.findValue('top')/>
        </#if>
        <#if attributes.listValue??>
            <#assign itemValue = stack.findString(attributes.listValue)/>
        <#else>
            <#assign itemValue = stack.findString('top')/>
        </#if>
        <#assign doubleItemCount = 0/>
        <#if attributes.doubleHeaderKey?? && attributes.doubleHeaderValue??>
        ${attributes.id}Group[${itemCount}][${doubleItemCount}] = new Option("${doubleHeaderValue?js_string}", "${doubleHeaderKey?js_string}");
            <#assign doubleItemCount = doubleItemCount + 1/>
        </#if>
        <#if attributes.doubleEmptyOption??>
        ${attributes.id}Group[${itemCount}][${doubleItemCount}] = new Option("", "");
            <#assign doubleItemCount = doubleItemCount + 1/>
        </#if>
        <@s.iterator value="${attributes.doubleList}">
            <#if attributes.doubleListKey??>
                <#assign doubleItemKey = stack.findValue(attributes.doubleListKey)/>
            <#else>
                <#assign doubleItemKey = stack.findValue('top')/>
            </#if>
            <#assign doubleItemKeyStr = doubleItemKey.toString() />
            <#if attributes.doubleListValue??>
                <#assign doubleItemValue = stack.findString(attributes.doubleListValue)/>
            <#else>
                <#assign doubleItemValue = stack.findString('top')/>
            </#if>
            <#if attributes.doubleListCssClass??>
                <#if stack.findString(attributes.doubleListCssClass)??>
                    <#assign itemDoubleCssClass= stack.findString(attributes.doubleListCssClass)/>
                <#else>
                    <#assign itemDoubleCssClass = ''/>
                </#if>
            </#if>
            <#if attributes.doubleListCssStyle??>
                <#if stack.findString(attributes.doubleListCssStyle)??>
                    <#assign itemDoubleCssStyle= stack.findString(attributes.doubleListCssStyle)/>
                <#else>
                    <#assign itemDoubleCssStyle = ''/>
                </#if>
            </#if>
            <#if attributes.doubleListTitle??>
                <#if stack.findString(attributes.doubleListTitle)??>
                    <#assign itemDoubleTitle= stack.findString(attributes.doubleListTitle)/>
                <#else>
                    <#assign itemDoubleTitle = ''/>
                </#if>
            </#if>
        ${attributes.id}Group[${itemCount}][${doubleItemCount}] = new Option("${doubleItemValue?js_string}", "${doubleItemKeyStr?js_string}");
            <#if itemDoubleCssClass?has_content>
            ${attributes.id}Group[${itemCount}][${doubleItemCount}].setAttribute("class", "${itemDoubleCssClass}");
            </#if>
            <#if itemDoubleCssStyle?has_content>
            ${attributes.id}Group[${itemCount}][${doubleItemCount}].setAttribute("style", "${itemDoubleCssStyle}");
            </#if>
            <#if itemDoubleTitle?has_content>
            ${attributes.id}Group[${itemCount}][${doubleItemCount}].setAttribute("title", "${itemDoubleTitle}");
            </#if>

            <#assign doubleItemCount = doubleItemCount + 1/>
        </@s.iterator>
        <#assign itemCount = itemCount + 1/>
    </@s.iterator>

    var ${attributes.id}Temp = document.${attributes.formName}.${attributes.doubleId};
    <#assign itemCount = startCount/>
    <#assign redirectTo = 0/>
    <@s.iterator value="attributes.list">
        <#if attributes.listKey??>
            <#assign itemKey = stack.findValue(attributes.listKey)/>
        <#else>
            <#assign itemKey = stack.findValue('top')/>
        </#if>
        <#if tag.contains(attributes.nameValue, itemKey)>
            <#assign redirectTo = itemCount/>
        </#if>
        <#assign itemCount = itemCount + 1/>
    </@s.iterator>
    ${attributes.id}Redirect(${redirectTo});
    function ${attributes.id}Redirect(x) {
        var selected = false;
        for (m = ${attributes.id}Temp.options.length - 1; m >= 0; m--) {
            ${attributes.id}Temp.remove(m);
        }

        for (i = 0; i < ${attributes.id}Group[x].length; i++) {
            ${attributes.id}Temp.options[i] = new Option(${attributes.id}Group[x][i].text, ${attributes.id}Group[x][i].value);
        <#if attributes.doubleNameValue??>
            <#if attributes.doubleMultiple??>
                for (j = 0; j < ${attributes.doubleNameValue}.
                length;
                j++
            )
                {
                    if (${attributes.id}Temp.options[i].value === ${attributes.doubleNameValue?js_string}[j]) {
                        ${attributes.id}Temp.options[i].selected = true;
                        selected = true;
                    }
                }
            <#else>
                if (${attributes.id}Temp.options[i].value === '${attributes.doubleNameValue?js_string}') {
                    ${attributes.id}Temp.options[i].selected = true;
                    selected = true;
                }
            </#if>
        </#if>
        }

        if ((${attributes.id}Temp.options.length > 0) && (!selected)) {
            ${attributes.id}Temp.options[0].selected = true;
        }
    }
</@s.script>

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
<#assign itemCount = 0/>
<@s.iterator value="attributes.list">
    <#assign itemCount = itemCount + 1/>
    <#if attributes.listKey??>
        <#assign itemKey = stack.findValue(attributes.listKey)/>
    <#else>
        <#assign itemKey = stack.findValue('top')/>
    </#if>
    <#assign itemKeyStr = itemKey.toString() />
    <#if attributes.listValue??>
        <#assign itemValue = stack.findString(attributes.listValue)/>
    <#else>
        <#assign itemValue = stack.findString('top')/>
    </#if>
    <#if attributes.labelPosition?default("") == 'left'>
        <#assign inlineAttr="form-check-inline"/><#lt/>
    </#if>
    <#if attributes.disabled!false>
        <#assign disabledAttr="disabled"/><#lt/>
    </#if>
<div class="form-check ${inlineAttr!""} ${disabledAttr!""}"><#lt/>
        <input type="radio" class="form-check-input" <#t/>
            <#if attributes.name??>
               name="${attributes.name}" <#t/>
            </#if>
               id="${attributes.name}-${itemCount}" <#t/>
            <#if tag.contains(attributes.nameValue!'', itemKeyStr)>
               checked="checked" <#t/>
            </#if>
            <#if itemKey??>
               value="${itemKeyStr}" <#t/>
            </#if>
            <#if attributes.disabled!false>
               disabled="disabled" <#t/>
            </#if>
            <#if attributes.tabindex??>
               tabindex="${attributes.tabindex}" <#t/>
            </#if>
            <#if attributes.cssStyle??>
               style="${attributes.cssStyle}" <#t/>
            </#if>
            <#include "/${attributes.templateDir}/simple/css.ftl" /> <#t/>
            <#if attributes.title??>
               title="${attributes.title}" <#t/>
            </#if>
            <#include "/${attributes.templateDir}/simple/scripting-events.ftl" />
            <#include "/${attributes.templateDir}/simple/common-attributes.ftl" />
        /><#lt/>
    <label for="${attributes.name}-${itemCount}" class="form-check-label">
        ${itemValue}
    </label>
</div><#lt/>
</@s.iterator>

<#--
/*
 * $Id: checkbox.ftl 1536435 2013-10-28 17:29:30Z lukaszlenart $
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
<input type="checkbox" name="${attributes.name}" value="${attributes.fieldValue}" class="form-check-input" <#rt/>
    <#if attributes.nameValue?? && attributes.nameValue>
        checked="checked" <#t/>
    </#if>
    <#if attributes.disabled!false>
        disabled="disabled" <#t/>
    </#if>
    <#if attributes.readonly!false>
        readonly="readonly" <#t/>
    </#if>
    <#if attributes.tabindex??>
        tabindex="${attributes.tabindex}" <#t/>
    </#if>
    <#if attributes.id??>
        id="${attributes.id}" <#t/>
    </#if>
    <#include "/${attributes.templateDir}/simple/css.ftl" />
    <#if attributes.title??>
        title="${attributes.title}" <#t/>
    </#if>
    <#include "/${attributes.templateDir}/${attributes.expandTheme}/scripting-events.ftl" /> <#t/>
    <#include "/${attributes.templateDir}/${attributes.expandTheme}/common-attributes.ftl" /> <#t/>
    <#include "/${attributes.templateDir}/${attributes.expandTheme}/dynamic-attributes.ftl" /> <#t/>
/>
<input type="hidden" id="__checkbox_${attributes.id}" name="__checkbox_${attributes.name}" <#rt/>
    value="${attributes.fieldValue}" <#t/>
    <#if attributes.disabled!false>
        disabled="disabled"<#rt/>
    </#if>
/>

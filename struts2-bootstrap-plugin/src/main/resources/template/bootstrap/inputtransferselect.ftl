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
<#include "/${attributes.templateDir}/${attributes.expandTheme}/controlheader.ftl" />

<#if !stack.findValue("#inputtransferselect_js_included")??><#t/>
<@s.script src="${base}${attributes.staticContentPath}/inputtransferselect.js" encode='false' includeParams='none'/>
    <#assign temporaryVariable = stack.setValue("#inputtransferselect_js_included", "true") /><#t/>
</#if><#t/>
<div class="mb-3 row">
    <div class="col-md-5">

    <#if attributes.leftTitle??><#t/>
        <label for="leftTitle">${attributes.leftTitle}</label><br/>
    </#if><#t/>


        <input type="text"<#rt/>
               name="${attributes.name!""}_input"<#rt/>
        <#if attributes.disabled!false>
               disabled="disabled"<#rt/>
        </#if>
        <#if attributes.readonly!false>
               readonly="readonly"<#rt/>
        </#if>
        <#if attributes.tabindex??>
               tabindex="${attributes.tabindex}"<#rt/>
        </#if>
        <#if attributes.id??>
               id="${attributes.id}_input"<#rt/>
        </#if>
        <#if attributes.cssClass??>
               class="form-control ${attributes.cssClass}"<#rt/>
        <#else>
               class="form-control"<#rt/>
        </#if>
        <#if attributes.cssStyle??>
               style="${attributes.cssStyle}"<#rt/>
        </#if>
        <#if attributes.title??>
               title="${attributes.title}"<#rt/>
        </#if>
        <#include "/${attributes.templateDir}/${attributes.expandTheme}/scripting-events.ftl" />
        <#include "/${attributes.templateDir}/${attributes.expandTheme}/common-attributes.ftl" />
                />
    </div>

    <div class="col-md-2 text-center">
        <div class="btn-group-vertical transferselect-btn transferselect-btn-middle">
        <#assign addLabel=attributes.addLabel!"Add" /><#t/>
            <button type="button"
            <#if attributes.buttonCssClass??><#t/>
                    class="btn ${attributes.buttonCssClass}"
            <#else><#t/>
                    class="btn btn-outline-secondary"
            </#if><#t/>
            <#if attributes.buttonCssStyle??><#t/>
                    style="${attributes.buttonCssStyle}"
            </#if><#t/>
                    title="${addLabel}"
                    onclick="addOption(document.getElementById('${attributes.id}_input'), document.getElementById('${attributes.id}'))"
                    ><#t/>
                <span class="bi bi-plus-circle"></span>
            </button>
        <#t/>
        <#assign removeLabel=attributes.removeLabel!"Remove" /><#t/>
            <button type="button"
            <#if attributes.buttonCssClass??><#t/>
                    class="btn ${attributes.buttonCssClass}"
            <#else><#t/>
                    class="btn btn-outline-secondary"
            </#if><#t/>
            <#if attributes.buttonCssStyle??><#t/>
                    style="${attributes.buttonCssStyle}"
            </#if><#t/>
                    title="${removeLabel}"
                    onclick="removeOptions(document.getElementById('${attributes.id}'))"
                    ><#t/>
                <span class="bi bi-dash-circle"></span>
            </button>
        <#t/>
        <#assign removeAllLabel=attributes.removeAllLabel!"Remove all" /><#t/>
            <button type="button"
            <#if attributes.buttonCssClass??><#t/>
                    class="btn ${attributes.buttonCssClass}"
            <#else><#t/>
                    class="btn btn-outline-secondary"
            </#if><#t/>
            <#if attributes.buttonCssStyle??><#t/>
                    style="${attributes.buttonCssStyle}"
            </#if><#t/>
                    title="${removeAllLabel}"
                    onclick="removeAllOptions(document.getElementById('${attributes.id}'))"
                    ><#t/>
                <span class="bi bi-dash-circle-fill"></span>
            </button>
        </div>
    </div>
    <div class="col-md-5">
    <#if attributes.rightTitle??><#t/>
        <label for="rightTitle">${attributes.rightTitle}</label><br/>
    </#if><#t/>
    <#include "/${attributes.templateDir}/${attributes.expandTheme}/simple/select.ftl" />
    <#if attributes.allowUpDown!true>
        <div class="text-center">
            <div class="btn-group transferselect-btn transferselect-btn-bottom">
                <button type="button" class="btn btn-outline-secondary"
                    <#if attributes.downLabel??>
                        title="${attributes.downLabel}"
                    </#if>
                    <#if attributes.headerKey??>
                        onclick="moveOptionDown(document.getElementById('${attributes.id}'), 'key', '${attributes.headerKey}');"
                    <#else>
                        onclick="moveOptionDown(document.getElementById('${attributes.id}'), 'key', '');"
                    </#if>
                        ><#t/>
                    <span class="bi bi-arrow-down-circle"></span>
                </button>
                <button type="button" class="btn btn-outline-secondary"
                    <#if attributes.downLabel??>
                        title="${attributes.upLabel}"
                    </#if>
                    <#if attributes.headerKey??>
                        onclick="moveOptionUp(document.getElementById('${attributes.id}'), 'key', '${attributes.headerKey}');"
                    <#else>
                        onclick="moveOptionUp(document.getElementById('${attributes.id}'), 'key', '');"
                    </#if>
                        ><#t/>
                    <span class="bi bi-arrow-up-circle"></span>
                </button>
            </div>
        </div>
    </#if>
    </div>
</div>
<#include "/${attributes.templateDir}/${attributes.expandTheme}/controlfooter.ftl" /><#nt/>

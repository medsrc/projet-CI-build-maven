<#--
/*
 * $Id: optiontransferselect.ftl 1351491 2012-06-18 21:20:49Z jogep $
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
<#include "/${attributes.templateDir}/${attributes.expandTheme}/controlheader.ftl" />

<#if !stack.findValue("#optiontransferselect_js_included")??><#t/>
<@s.script src="${base}${attributes.staticContentPath}/optiontransferselect.js" encode='false' includeParams='none'/>
    <#assign temporaryVariable = stack.setValue("#optiontransferselect_js_included", "true") /><#t/>
</#if><#t/>
<div class="row">
<div class="col-md-5">

<#if attributes.leftTitle??><#t/>
    <label for="leftTitle">${attributes.leftTitle}</label><br/>
</#if><#t/>
<#include "/${attributes.templateDir}/simple/select.ftl" />
<#if attributes.allowUpDownOnLeft!true>
    <div class="text-center">
        <div class="btn-group transferselect-btn transferselect-btn-bottom">
            <button type="button" class="btn btn-outline-secondary"
                <#if attributes.rightDownLabel??>
                    title="${attributes.rightDownLabel}"
                </#if>
                    onclick="moveOptionDown(document.getElementById('${attributes.id}'), 'key', <#if attributes.headerKey??>'${attributes.headerKey}'<#else>''</#if>);<#if attributes.upDownOnLeftOnclick?has_content>${attributes.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-down-circle"></span>
            </button>
            <button type="button" class="btn btn-outline-secondary"
                <#if attributes.rightUpLabel??>
                    title="${attributes.rightUpLabel}"
                </#if>
                    onclick="moveOptionUp(document.getElementById('${attributes.id}'), 'key', <#if attributes.headerKey??>'${attributes.headerKey}'<#else>''</#if>);<#if attributes.upDownOnLeftOnclick?has_content>${attributes.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-up-circle"></span>
            </button>
        </div>
    </div>
</#if>

</div>
<div class="col-md-2 text-center align-middle">
<div class="btn-group-vertical transferselect-btn transferselect-btn-middle">
<#if attributes.allowAddToLeft!true><#t/>
    <#assign addToLeftLabel = attributes.addToLeftLabel!"To left"/><#t/>
    <#if attributes.doubleHeaderKey??><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addToLeftLabel}"
            onclick="moveSelectedOptions(document.getElementById('${attributes.doubleId}'), document.getElementById('${attributes.id}'), false, '${attributes.doubleHeaderKey}', '');<#if attributes.addToLeftOnclick?has_content>${attributes.addToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addToLeftLabel}"
            onclick="moveSelectedOptions(document.getElementById('${attributes.doubleId}'), document.getElementById('${attributes.id}'), false, '');<#if attributes.addToLeftOnclick?has_content>${attributes.addToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if attributes.allowAddToRight!true><#t/>
    <#assign addToRightLabel=attributes.addToRightLabel!"To right" /><#t/>
    <#if attributes.headerKey??><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addToRightLabel}"
            onclick="moveSelectedOptions(document.getElementById('${attributes.id}'), document.getElementById('${attributes.doubleId}'), false, '${attributes.headerKey}', '');<#if attributes.addToRightOnclick?has_content>${attributes.addToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addToRightLabel}"
            onclick="moveSelectedOptions(document.getElementById('${attributes.id}'), document.getElementById('${attributes.doubleId}'), false, '');<#if attributes.addToRightOnclick?has_content>${attributes.addToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if attributes.allowAddAllToLeft!true><#t/>
    <#assign addAllToLeftLabel=attributes.addAllToLeftLabel!"All to left" /><#t/>
    <#if attributes.doubleHeaderKey??><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToLeftLabel}"
            onclick="moveAllOptions(document.getElementById('${attributes.doubleId}'), document.getElementById('${attributes.id}'), false, '${attributes.doubleHeaderKey}', '');<#if attributes.addAllToLeftOnclick?has_content>${attributes.addAllToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle-fill"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToLeftLabel}"
            onclick="moveAllOptions(document.getElementById('${attributes.doubleId}'), document.getElementById('${attributes.id}'), false, '');<#if attributes.addAllToLeftOnclick?has_content>${attributes.addAllToLeftOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-circle-fill"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if attributes.allowAddAllToRight!true><#t/>
    <#assign addAllToRightLabel=attributes.addAllToRightLabel!"All to right" /><#t/>
    <#if attributes.headerKey??><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToRightLabel}"
            onclick="moveAllOptions(document.getElementById('${attributes.id}'), document.getElementById('${attributes.doubleId}'), false, '${attributes.headerKey}', '');<#if attributes.addAllToRightOnclick?has_content>${attributes.addAllToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle-fill"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${addAllToRightLabel}"
            onclick="moveAllOptions(document.getElementById('${attributes.id}'), document.getElementById('${attributes.doubleId}'), false, '');<#if attributes.addAllToRightOnclick?has_content>${attributes.addAllToRightOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-right-circle-fill"></span>
    </button>
    </#if><#t/>
</#if><#t/>
<#if attributes.allowSelectAll!true><#t/>
    <#assign selectAllLabel=attributes.selectAllLabel!"Select all" /><#t/>
    <#if attributes.headerKey?? && attributes.doubleHeaderKey??><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptionsExceptSome(document.getElementById('${attributes.id}'), 'key', '${attributes.headerKey}');selectAllOptionsExceptSome(document.getElementById('${attributes.doubleId}'), 'key', '${attributes.doubleHeaderKey}');<#if attributes.selectAllOnclick?has_content>${attributes.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    <#elseif attributes.headerKey??><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptionsExceptSome(document.getElementById('${attributes.id}'), 'key', '${attributes.headerKey}');selectAllOptions(document.getElementById('${attributes.doubleId}'));<#if attributes.selectAllOnclick?has_content>${attributes.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    <#elseif attributes.doubleHeaderKey??><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptions(document.getElementById('${attributes.id}'));selectAllOptionsExceptSome(document.getElementById('${attributes.doubleId}'), 'key', '${attributes.doubleHeaderKey}');<#if attributes.selectAllOnclick?has_content>${attributes.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    <#else><#t/>
    <button type="button"
        <#if attributes.buttonCssClass??><#t/>
            class="btn ${attributes.buttonCssClass}"
        <#else><#t/>
            class="btn btn-outline-secondary"
        </#if><#t/>
        <#if attributes.buttonCssStyle??><#t/>
            style="${attributes.buttonCssStyle}"
        </#if><#t/>
            title="${selectAllLabel}"
            onclick="selectAllOptions(document.getElementById('${attributes.id}'));selectAllOptions(document.getElementById('${attributes.doubleId}'));<#if attributes.selectAllOnclick?has_content>${attributes.selectAllOnclick};</#if>"
            ><#t/>
        <span class="bi bi-arrow-left-right"></span>
    </button>
    </#if><#t/>
</#if><#t/>
</div>
</div>
<div class="col-md-5">
<#if attributes.rightTitle??><#t/>
    <label for="rightTitle">${attributes.rightTitle}</label><br/>
</#if><#t/>
    <select
            name="${attributes.doubleName!""}"
    <#if attributes.get("doubleSize")??><#t/>
            size="${attributes.get("doubleSize")}"
    </#if><#t/>
    <#if attributes.doubleDisabled!false><#t/>
            disabled="disabled"
    </#if><#t/>
    <#if attributes.doubleMultiple!false><#t/>
            multiple="multiple"
    </#if><#t/>
    <#if attributes.doubleTabindex??><#t/>
            tabindex="${attributes.tabindex}"
    </#if><#t/>
    <#if attributes.doubleId??><#t/>
            id="${attributes.doubleId}"
    </#if><#t/>
    <#if attributes.doubleCss??><#t/>
            class="form-control ${attributes.doubleCss}"
    <#else><#t/>
            class="form-control"
    </#if><#t/>
    <#if attributes.doubleStyle??><#t/>
            style="${attributes.doubleStyle}"
    </#if><#t/>
    <#if attributes.doubleOnclick??><#t/>
            onclick="${attributes.doubleOnclick}"
    </#if><#t/>
    <#if attributes.doubleOndblclick??><#t/>
            ondblclick="${attributes.doubleOndblclick}"
    </#if><#t/>
    <#if attributes.doubleOnmousedown??><#t/>
            onmousedown="${attributes.doubleOnmousedown}"
    </#if><#t/>
    <#if attributes.doubleOnmouseup??><#t/>
            onmouseup="${attributes.doubleOnmouseup}"
    </#if><#t/>
    <#if attributes.doubleOnmousemove??><#t/>
            onmousemove="${attributes.doubleOnmousemove}"
    </#if><#t/>
    <#if attributes.doubleOnmouseover??><#t/>
            onmouseover="${attributes.doubleOnmouseover}"
    </#if><#t/>
    <#if attributes.doubleOnmouseout??><#t/>
            onmouseout="${attributes.doubleOnmouseout}"
    </#if><#t/>
    <#if attributes.doubleOnfocus??><#t/>
            onfocus="${attributes.doubleOnfocus}"
    </#if><#t/>
    <#if attributes.doubleOnblur??><#t/>
            onblur="${attributes.doubleOnblur}"
    </#if><#t/>
    <#if attributes.doubleOnkeypress??><#t/>
            onkeypress="${attributes.doubleOnkeypress}"
    </#if><#t/>
    <#if attributes.doubleOnKeydown??><#t/>
            onkeydown="${attributes.doubleOnkeydown}"
    </#if><#t/>
    <#if attributes.doubleOnkeyup??><#t/>
            onkeyup="${attributes.doubleOnkeyup}"
    </#if><#t/>
    <#if attributes.doubleOnselect??><#t/>
            onselect="${attributes.doubleOnselect}"
    </#if><#t/>
    <#if attributes.doubleOnchange??><#t/>
            onchange="${attributes.doubleOnchange}"
    </#if><#t/>
    <#if attributes.doubleAccesskey??><#t/>
            accesskey="${attributes.doubleAccesskey}"
    </#if>
            >
    <#if attributes.doubleHeaderKey?? && attributes.doubleHeaderValue??><#t/>
        <option value="${attributes.doubleHeaderKey}">${attributes.doubleHeaderValue}</option>
    </#if><#t/>
    <#if attributes.doubleEmptyOption!false><#t/>
        <option value=""></option>
    </#if><#t/>
    <@s.iterator value="attributes.doubleList"><#t/>
        <#if attributes.doubleListKey??><#t/>
            <#assign doubleItemKey = stack.findValue(attributes.doubleListKey) /><#t/>
        <#else><#t/>
            <#assign doubleItemKey = stack.findValue('top') /><#t/>
        </#if><#t/>
        <#assign doubleItemKeyStr = doubleItemKey.toString() /><#t/>
        <#if attributes.doubleListValue??><#t/>
            <#assign doubleItemValue = stack.findString(attributes.doubleListValue)!"" /><#t/>
        <#else><#t/>
            <#assign doubleItemValue = stack.findString('top') /><#t/>
        </#if><#t/>
        <option value="${doubleItemKeyStr}"<#rt/>
            <#if tag.contains(attributes.doubleNameValue, doubleItemKey)><#t/>
                selected="selected"<#rt/>
            </#if><#t/>
                >${doubleItemValue}</option><#lt/>
    </@s.iterator><#t/>
    </select>
<#if attributes.doubleMultiple!false>
    <input type="hidden" id="__multiselect_${attributes.doubleId}"
           name="__multiselect_${attributes.doubleName!""}" value=""<#rt/>
        <#if attributes.doubleDisabled!false>
           disabled="disabled"<#rt/>
        </#if>
            />
</#if>

<#if attributes.allowUpDownOnRight!true>
    <div class="text-center">
        <div class="btn-group transferselect-btn transferselect-btn-bottom">
            <button type="button" class="btn btn-outline-secondary"
                <#if attributes.rightDownLabel??>
                    title="${attributes.rightDownLabel}"
                </#if>
                    onclick="moveOptionDown(document.getElementById('${attributes.doubleId}'), 'key', <#if attributes.doubleHeaderKey??>'${attributes.doubleHeaderKey}'<#else>''</#if>);<#if attributes.upDownOnLeftOnclick?has_content>${attributes.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-down-circle"></span>
            </button>
            <button type="button" class="btn btn-outline-secondary"
                <#if attributes.rightUpLabel??>
                    title="${attributes.rightUpLabel}"
                </#if>
                    onclick="moveOptionUp(document.getElementById('${attributes.doubleId}'), 'key', <#if attributes.doubleHeaderKey??>'${attributes.doubleHeaderKey}'<#else>''</#if>);<#if attributes.upDownOnLeftOnclick?has_content>${attributes.upDownOnLeftOnclick};</#if>"<#t/>
                    ><#t/>
                <span class="bi bi-arrow-up-circle"></span>
            </button>
        </div>
    </div>
</#if>
</div>
</div>
<#include "/${attributes.templateDir}/${attributes.expandTheme}/controlfooter.ftl" />

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
<#assign hasFieldErrors = attributes.name?? && fieldErrors?? && fieldErrors.get(attributes.name?j_string)??/>
<#if attributes.cssClass?? && !(hasFieldErrors && attributes.cssErrorClass??)>
 class="${formControlClass} ${attributes.cssClass}"<#rt/>
<#elseif attributes.cssClass?? && (hasFieldErrors && attributes.cssErrorClass??)>
 class="${formControlClass} ${attributes.cssClass} is-invalid ${attributes.cssErrorClass}"<#rt/>
<#elseif !(attributes.cssClass??) && (hasFieldErrors && attributes.cssErrorClass??)>
 class="${formControlClass} is-invalid ${attributes.cssErrorClass}"<#rt/>
<#elseif !(attributes.cssClass??) && hasFieldErrors>
 class="${formControlClass} is-invalid"<#rt/>
<#else>
 class="${formControlClass}"<#rt/>
</#if>
<#if attributes.cssStyle?? && !(hasFieldErrors && (attributes.cssErrorStyle?? || attributes.cssErrorClass??))>
 style="${attributes.cssStyle}"<#rt/>
<#elseif hasFieldErrors && attributes.cssErrorStyle??>
 style="${attributes.cssErrorStyle}"<#rt/>
</#if>

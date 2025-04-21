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
package com.jgeppert.struts2.bootstrap.views.jsp.ui;

import com.jgeppert.struts2.bootstrap.components.Head;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.struts2.components.Component;
import org.apache.struts2.util.ValueStack;
import org.apache.struts2.views.jsp.ui.AbstractUITag;

/**
 * The `HeadTag` class provides the JSP tag for the `Head` component in the
 * Bootstrap plugin. It initializes and returns the `Head` component for
 * rendering the head section of an HTML document with Bootstrap resources.
 *
 * @author <a href="https://www.jgeppert.com">Johannes Geppert</a>
 * @see Head
 * @see org.apache.struts2.util.ValueStack
 * @see jakarta.servlet.http.HttpServletRequest
 * @see jakarta.servlet.http.HttpServletResponse
 */
public class HeadTag extends AbstractUITag {

    protected String compressed;
    protected String includeStyles;
    protected String includeScripts;

    /**
     * Returns the `Head` component for rendering the head section of an HTML document.
     *
     * @param stack the value stack
     * @param req   the HTTP request
     * @param res   the HTTP response
     * @return the `Head` component
     */
    public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        return new Head(stack, req, res);
    }

    /**
     * Populates the parameters for the `Head` component.
     */
    protected void populateParams() {
        super.populateParams();

        Head head = (Head) component;
        head.setCompressed(compressed);
        head.setIncludeStyles(includeStyles);
        head.setIncludeScripts(includeScripts);
    }

    /**
     * Sets whether to use the compressed version of Bootstrap resources.
     *
     * @param compressed the compressed flag
     */
    public void setCompressed(String compressed) {
        this.compressed = compressed;
    }

    /**
     * Sets whether to include Bootstrap responsive styles.
     *
     * @param includeStyles the includeStyles flag
     */
    public void setIncludeStyles(String includeStyles) {
        this.includeStyles = includeStyles;
    }

    /**
     * Sets whether to include Bootstrap scripts.
     *
     * @param includeScripts the includeScripts flag
     */
    public void setIncludeScripts(String includeScripts) {
        this.includeScripts = includeScripts;
    }

}

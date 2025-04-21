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
package com.jgeppert.struts2.bootstrap.views.freemarker.tags;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.struts2.util.ValueStack;

/**
 * The `BootstrapModels` class provides access to the Bootstrap tag models.
 * It initializes and returns the `HeadModel` for rendering the head section
 * of an HTML document with Bootstrap resources.
 *
 * @author <a href="https://www.jgeppert.com">Johannes Geppert</a>
 * @see com.jgeppert.struts2.bootstrap.views.freemarker.tags.HeadModel
 * @see org.apache.struts2.util.ValueStack
 * @see jakarta.servlet.http.HttpServletRequest
 * @see jakarta.servlet.http.HttpServletResponse
 */
public class BootstrapModels {

    protected HeadModel head;

    private final ValueStack stack;
    private final HttpServletRequest req;
    private final HttpServletResponse res;

    /**
     * Constructor for `BootstrapModels`.
     *
     * @param stack the value stack
     * @param req   the HTTP request
     * @param res   the HTTP response
     */
    public BootstrapModels(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
        this.stack = stack;
        this.req = req;
        this.res = res;
    }

    /**
     * Returns the `HeadModel` for rendering the head section of an HTML document.
     *
     * @return the `HeadModel`
     */
    public HeadModel getHead() {
        if (head == null) {
            head = new HeadModel(stack, req, res);
        }

        return head;
    }

}

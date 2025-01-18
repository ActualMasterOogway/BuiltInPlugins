local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices.Context);
local v4 = require(l_Parent_0.UI.ContextServices.Stylizer);
local v5 = {
    defaultProps = true, 
    getDerivedStateFromProps = true, 
    init = true, 
    render = true, 
    setState = true, 
    validateProps = true, 
    didMount = true, 
    didUpdate = true, 
    shouldUpdate = true, 
    willUnmount = true, 
    willUpdate = true, 
    childContextTypes = true, 
    componentDidCatch = true, 
    componentDidMount = true, 
    componentDidUpdate = true, 
    componentWillMount = true, 
    componentWillReceiveProps = true, 
    componentWillUnmount = true, 
    componentWillUpdate = true, 
    contextType = true, 
    contextTypes = true, 
    forceUpdate = true, 
    getChildContext = true, 
    getDerivedStateFromError = true, 
    getSnapshotBeforeUpdate = true, 
    propTypes = true, 
    shouldComponentUpdate = true, 
    __initWithContext = true, 
    __onRenderWithContext = true, 
    __renderWithContext = true
};
local function _(v6) --[[ Line: 62 ]] --[[ Name: DEPRECATED_withContext ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(typeof(v6) == "table", "withContext must be passed a table of context items");
    return function(v7) --[[ Line: 65 ]]
        -- upvalues: v2 (ref), v6 (copy), v3 (ref)
        assert(v7.render ~= v2.Component.render, string.format("The Component %q is missing the `render` method.\n`withContext` must be called after `render` is defined!", (tostring(v7))));
        if not v7.__initWithContext then
            v7.__renderWithContext = v7.render;
            v7.__initWithContext = v7.init;
        end;
        v7.init = function(v8) --[[ Line: 71 ]] --[[ Name: init ]]
            -- upvalues: v6 (ref), v7 (copy)
            if v8.__initWithContext then
                v8:__initWithContext(v8.props);
            end;
            v8.__onRenderWithContext = function(v9) --[[ Line: 75 ]]
                -- upvalues: v8 (copy), v6 (ref), v7 (ref)
                local l_props_0 = v8.props;
                for v11, v12 in pairs(v6) do
                    local v13 = v9[v12.Key];
                    if not v13 then
                        error(("Component %s cannot consume missing context item %s key"):format(v7.__componentName, v11));
                    end;
                    if v13.getConsumerItem then
                        l_props_0[v11] = v13:getConsumerItem(v8);
                    else
                        l_props_0[v11] = v13;
                    end;
                end;
                return v8:__renderWithContext();
            end;
        end;
        v7.render = function(v14) --[[ Line: 96 ]] --[[ Name: render ]]
            -- upvalues: v2 (ref), v3 (ref)
            return v2.createElement(v3.Consumer, {
                render = v14.__onRenderWithContext
            });
        end;
        return v7;
    end;
end;
local function _(v16) --[[ Line: 105 ]] --[[ Name: withContext ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v1 (copy)
    return function(v17) --[[ Line: 106 ]]
        -- upvalues: v2 (ref), v5 (ref), v3 (ref), v16 (copy), v1 (ref)
        local v18 = tostring(v17);
        local v19 = v2.PureComponent:extend((("withContext(%*)"):format(v18)));
        for v20, v21 in v17 do
            if not v19[v20] and not v5[v20] then
                v19[v20] = v21;
            end;
        end;
        v19.render = function(v22) --[[ Line: 120 ]] --[[ Name: render ]]
            -- upvalues: v2 (ref), v3 (ref), v16 (ref), v18 (copy), v1 (ref), v17 (copy)
            return v2.createElement(v3.Consumer, {
                render = function(v23) --[[ Line: 122 ]] --[[ Name: render ]]
                    -- upvalues: v16 (ref), v18 (ref), v1 (ref), v22 (copy), v2 (ref), v17 (ref)
                    local v24 = {};
                    for v25, v26 in v16 do
                        local v27 = v23[v26.Key];
                        if not v27 then
                            error((("Component %* cannot consume missing context item %* key"):format(v18, v25)));
                        end;
                        if v27.getConsumerItem then
                            v24[v25] = v27:getConsumerItem();
                        else
                            v24[v25] = v27;
                        end;
                    end;
                    local v28 = v1.Dictionary.join(v22.props, v24);
                    return v2.createElement(v17, v28);
                end
            });
        end;
        return v19;
    end;
end;
local function _(v30) --[[ Line: 149 ]] --[[ Name: getStylizerKey ]]
    -- upvalues: v4 (copy)
    for v31, v32 in v30 do
        if v32.Key == v4.Key then
            return v31;
        end;
    end;
    return nil;
end;
return function(v34) --[[ Line: 158 ]] --[[ Name: withContextCompat ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v35 = false;
    local v36;
    for v37, v38 in v34 do
        if v38.Key == v4.Key then
            v36 = v37;
            v35 = true;
        end;
        if v35 then
            break;
        end;
    end;
    if not v35 then
        v36 = nil;
    end;
    v35 = false;
    if v36 then
        v34 = v1.Dictionary.join(v34, {
            [v36] = v1.None
        });
        return function(v39) --[[ Line: 166 ]]
            -- upvalues: v36 (copy), v4 (ref), v2 (ref), v3 (ref), v1 (ref), v34 (ref), v5 (ref)
            local v40 = {
                [v36] = v4
            };
            assert(typeof(v40) == "table", "withContext must be passed a table of context items");
            local l_v40_0 = v40 --[[ copy: 2 -> 3 ]];
            v39 = (function(v42) --[[ Line: 65 ]]
                -- upvalues: v2 (ref), l_v40_0 (copy), v3 (ref)
                assert(v42.render ~= v2.Component.render, string.format("The Component %q is missing the `render` method.\n`withContext` must be called after `render` is defined!", (tostring(v42))));
                if not v42.__initWithContext then
                    v42.__renderWithContext = v42.render;
                    v42.__initWithContext = v42.init;
                end;
                v42.init = function(v43) --[[ Line: 71 ]] --[[ Name: init ]]
                    -- upvalues: l_v40_0 (ref), v42 (copy)
                    if v43.__initWithContext then
                        v43:__initWithContext(v43.props);
                    end;
                    v43.__onRenderWithContext = function(v44) --[[ Line: 75 ]]
                        -- upvalues: v43 (copy), l_v40_0 (ref), v42 (ref)
                        local l_props_1 = v43.props;
                        for v46, v47 in pairs(l_v40_0) do
                            local v48 = v44[v47.Key];
                            if not v48 then
                                error(("Component %s cannot consume missing context item %s key"):format(v42.__componentName, v46));
                            end;
                            if v48.getConsumerItem then
                                l_props_1[v46] = v48:getConsumerItem(v43);
                            else
                                l_props_1[v46] = v48;
                            end;
                        end;
                        return v43:__renderWithContext();
                    end;
                end;
                v42.render = function(v49) --[[ Line: 96 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v3 (ref)
                    return v2.createElement(v3.Consumer, {
                        render = v49.__onRenderWithContext
                    });
                end;
                return v42;
            end)(v39);
            if not v1.isEmpty(v34) then
                v40 = v34;
                v39 = (function(v50) --[[ Line: 106 ]]
                    -- upvalues: v2 (ref), v5 (ref), v3 (ref), v40 (copy), v1 (ref)
                    local v51 = tostring(v50);
                    local v52 = v2.PureComponent:extend((("withContext(%*)"):format(v51)));
                    for v53, v54 in v50 do
                        if not v52[v53] and not v5[v53] then
                            v52[v53] = v54;
                        end;
                    end;
                    v52.render = function(v55) --[[ Line: 120 ]] --[[ Name: render ]]
                        -- upvalues: v2 (ref), v3 (ref), v40 (ref), v51 (copy), v1 (ref), v50 (copy)
                        return v2.createElement(v3.Consumer, {
                            render = function(v56) --[[ Line: 122 ]] --[[ Name: render ]]
                                -- upvalues: v40 (ref), v51 (ref), v1 (ref), v55 (copy), v2 (ref), v50 (ref)
                                local v57 = {};
                                for v58, v59 in v40 do
                                    local v60 = v56[v59.Key];
                                    if not v60 then
                                        error((("Component %* cannot consume missing context item %* key"):format(v51, v58)));
                                    end;
                                    if v60.getConsumerItem then
                                        v57[v58] = v60:getConsumerItem();
                                    else
                                        v57[v58] = v60;
                                    end;
                                end;
                                local v61 = v1.Dictionary.join(v55.props, v57);
                                return v2.createElement(v50, v61);
                            end
                        });
                    end;
                    return v52;
                end)(v39);
            end;
            return v39;
        end;
    else
        local l_v34_0 = v34;
        return function(v63) --[[ Line: 106 ]]
            -- upvalues: v2 (ref), v5 (ref), v3 (ref), l_v34_0 (copy), v1 (ref)
            local v64 = tostring(v63);
            local v65 = v2.PureComponent:extend((("withContext(%*)"):format(v64)));
            for v66, v67 in v63 do
                if not v65[v66] and not v5[v66] then
                    v65[v66] = v67;
                end;
            end;
            v65.render = function(v68) --[[ Line: 120 ]] --[[ Name: render ]]
                -- upvalues: v2 (ref), v3 (ref), l_v34_0 (ref), v64 (copy), v1 (ref), v63 (copy)
                return v2.createElement(v3.Consumer, {
                    render = function(v69) --[[ Line: 122 ]] --[[ Name: render ]]
                        -- upvalues: l_v34_0 (ref), v64 (ref), v1 (ref), v68 (copy), v2 (ref), v63 (ref)
                        local v70 = {};
                        for v71, v72 in l_v34_0 do
                            local v73 = v69[v72.Key];
                            if not v73 then
                                error((("Component %* cannot consume missing context item %* key"):format(v64, v71)));
                            end;
                            if v73.getConsumerItem then
                                v70[v71] = v73:getConsumerItem();
                            else
                                v70[v71] = v73;
                            end;
                        end;
                        local v74 = v1.Dictionary.join(v68.props, v70);
                        return v2.createElement(v63, v74);
                    end
                });
            end;
            return v65;
        end;
    end;
end;
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.Style.ComponentSymbols);
local v3 = require(l_Parent_0.Style.StyleKey);
local v4 = require(l_Parent_0.UI.ContextServices.ContextItem);
local v5 = require(l_Parent_0.Util);
local l_deepCopy_0 = v5.deepCopy;
local l_React_0 = v5.React;
local l_Signal_0 = v5.Signal;
local v9 = v4:extend("Stylizer");
local function _(v10, v11, v12) --[[ Line: 83 ]] --[[ Name: assertIfNotNil ]]
    if v10 ~= nil then
        assert(v11, v12);
    end;
end;
v9.getStyleKeysTable = function(_, v15) --[[ Line: 89 ]] --[[ Name: getStyleKeysTable ]]
    -- upvalues: v3 (copy)
    local v16 = {};
    for v17, v18 in pairs(v15) do
        if type(v17) == "table" and getmetatable(v17) == v3 and type(v18) ~= "table" then
            v16[tostring(v17)] = v18;
        end;
    end;
    return v16;
end;
v9.__getClassStyle = function(_, v20, v21, v22) --[[ Line: 103 ]] --[[ Name: __getClassStyle ]]
    -- upvalues: v1 (copy)
    local v23 = v21[v20];
    if not v23 then
        local v24 = "&" .. tostring(v20);
        local v25 = v21 and v21[v22];
        v23 = v25 and v25[v24];
        if v23 and type(v23) == "table" then
            local v26 = v1.Dictionary.join(v25, {
                [v24] = v1.None
            });
            v23 = setmetatable(v1.Dictionary.join(v26, v23), (getmetatable(v25[v24])));
        end;
    end;
    assert(v23, ("Stylizer:__getClassStyle could not find a Style named '%s' for component `%s`"):format(v20, (tostring(v22))));
    return v23;
end;
v9.__recalculateTheme = function(v27, v28) --[[ Line: 132 ]] --[[ Name: __recalculateTheme ]]
    assert(type(v28.themesList) == "table", "Stylizer.__recalculateTheme expects themeProps to contain a table `themesList` when themeChangedConnection is enabled");
    local v29 = v28.getThemeName();
    if v29 == v27.themeName then
        return;
    else
        v27.themeName = v29;
        if v28 and v28.themesList then
            v27:extend(v28.themesList[v29]);
            v27.valuesChanged:Fire(v27);
        end;
        return;
    end;
end;
v9.new = function(v30, v31) --[[ Line: 151 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_deepCopy_0 (copy), l_Signal_0 (copy)
    assert(type(v30) == "table", "Stylizer.new expects initialStyles parameter to be a table");
    assert(type(v31) == "table", "Stylizer.new expects themeProps parameter to be a table");
    assert(type(v31.getThemeName) == "function", "Stylizer.new expects themeProps to contain a function `getThemeName`");
    local v32 = v9:getStyleKeysTable(v30);
    local v33 = l_deepCopy_0(v30);
    local v34 = {
        __calculatedStyle = v9:convertStyleKeys(v33, nil, nil, v32), 
        __rawStyle = v30, 
        valuesChanged = l_Signal_0.new(), 
        themeName = v31.getThemeName()
    };
    setmetatable(v34, v9);
    if v31.themeChangedConnection then
        v34.themeChangedConnection = v31.themeChangedConnection:Connect(function() --[[ Line: 172 ]]
            -- upvalues: v34 (copy), v31 (copy)
            v34:__recalculateTheme(v31);
        end);
    end;
    return v34;
end;
v9.extend = function(v35, ...) --[[ Line: 180 ]] --[[ Name: extend ]]
    -- upvalues: l_deepCopy_0 (copy), v1 (copy), v9 (copy)
    for _, v37 in ipairs({
        ...
    }) do
        local v38 = l_deepCopy_0(v37);
        local v39 = v1.Dictionary.join(v35.__rawStyle, v38);
        local v40 = v35:getStyleKeysTable(v39);
        v35.__rawStyle = l_deepCopy_0(v39);
        v35.__calculatedStyle = v9:convertStyleKeys(v39, nil, nil, v40);
    end;
    return v35;
end;
v9.getSignal = function(v41) --[[ Line: 192 ]] --[[ Name: getSignal ]]
    return v41.valuesChanged;
end;
v9.destroy = function(v42) --[[ Line: 196 ]] --[[ Name: destroy ]]
    if v42.themeChangedConnection then
        v42.themeChangedConnection:Disconnect();
    end;
end;
v9.convertStyleKeys = function(v43, v44, v45, v46, v47) --[[ Line: 202 ]] --[[ Name: convertStyleKeys ]]
    -- upvalues: v9 (copy), v3 (copy)
    assert(v44, "Style:convertStyleKeys expects 't' parameter");
    local v48 = typeof(v46) == "table";
    local v49 = ("Style:convertStyleKeys expects 'parent' parameter to be a table, but got a %s"):format((typeof(table)));
    if v46 ~= nil then
        assert(v48, v49);
    end;
    v48 = typeof(v47) == "table";
    v49 = ("Style:convertStyleKeys expects 'styleKeysTable' parameter to be a table, but got a %s"):format((typeof(v47)));
    if v47 ~= nil then
        assert(v48, v49);
    end;
    v48 = nil;
    v49 = setmetatable(v44, if v46 then {
        __index = v46, 
        __styleName = v45 or "[unnamed style]"
    } else {
        __index = v9, 
        __styleName = v45 or "[Root Style]"
    });
    for v50, v51 in pairs(v44) do
        local v52 = nil;
        if type(v51) == "table" then
            if getmetatable(v51) == v3 then
                v52 = v46 and v46[v51] or v47 and v47[tostring(v51)] or error(("StyleKey %s defines no value @ key %s"):format(v51.name, v50));
            elseif type(v51.render) ~= "function" then
                v52 = v43:convertStyleKeys(v51, v50, v49, v47);
            end;
        elseif type(v51) == "function" then
            local v53 = v51(v49) or {};
            if type(v53) == "table" then
                v52 = v43:convertStyleKeys(v53, v50, v49, v47);
            end;
        end;
        if v52 then
            rawset(v49, v50, v52);
        end;
    end;
    return v49;
end;
v9.getPathString = function(v54) --[[ Line: 260 ]] --[[ Name: getPathString ]]
    local v55 = nil;
    local v56 = getmetatable(v54);
    while v56 and v56.__styleName do
        if v55 then
            v55 = tostring(v56.__styleName) .. "-->" .. tostring(v55);
        else
            v55 = v56.__styleName;
        end;
        v56 = getmetatable(v56.__index);
    end;
    return v55 or "";
end;
if l_React_0 ~= "" then
    v9.use = function(v57, v58, v59, v60) --[[ Line: 276 ]] --[[ Name: use ]]
        -- upvalues: l_React_0 (copy)
        local v61 = l_React_0.useContext(v57.Context);
        local function v62() --[[ Line: 279 ]] --[[ Name: getNewValue ]]
            -- upvalues: v61 (copy), v58 (copy), v59 (copy), v60 (copy)
            return v61:get(v58, v59 or {}, v60);
        end;
        local v63, v64 = l_React_0.useState(v62);
        l_React_0.useEffect(function() --[[ Line: 285 ]]
            -- upvalues: v64 (copy), v62 (copy), v61 (copy)
            v64(v62);
            local v65 = v61.valuesChanged:Connect(function() --[[ Line: 288 ]]
                -- upvalues: v64 (ref), v62 (ref)
                v64(v62);
            end);
            return function() --[[ Line: 292 ]]
                -- upvalues: v65 (copy)
                v65:Disconnect();
            end;
        end, {
            v58, 
            v60, 
            if v59 then v59.Style else nil
        });
        return v63;
    end;
    v9.get = function(v66, v67, v68, v69) --[[ Line: 304 ]] --[[ Name: get ]]
        -- upvalues: v2 (copy), v9 (copy)
        local l_Style_0 = v68.Style;
        local l___calculatedStyle_0 = v66.__calculatedStyle;
        local v72 = v2[v67];
        if not l___calculatedStyle_0 then
            error((("Style:getConsumerItem() is unable to find the Style in context of %*"):format(v67)));
            return v66;
        else
            local v73 = nil;
            if l_Style_0 then
                if typeof(l_Style_0) == "table" then
                    v73 = setmetatable(l_Style_0, {
                        __index = v9
                    });
                elseif typeof(l_Style_0) == "string" then
                    v73 = v66:__getClassStyle(l_Style_0, l___calculatedStyle_0, v72);
                end;
            end;
            v73 = v73 or l___calculatedStyle_0[v72] or l___calculatedStyle_0 or v66;
            local v74 = if v69 then v73[v69] else nil;
            if v69 and v74 then
                setmetatable(v74, {
                    __index = v73
                });
                for v75, v76 in pairs(v74) do
                    if typeof(v76) == "table" and v73[v75] then
                        setmetatable(v76, {
                            __index = v73[v75]
                        });
                    end;
                end;
                v73 = v74;
            end;
            return v73;
        end;
    end;
end;
v9.getConsumerItem = function(v77, v78) --[[ Line: 348 ]] --[[ Name: getConsumerItem ]]
    -- upvalues: v2 (copy), v9 (copy)
    local l_Style_1 = v78.props.Style;
    local l___calculatedStyle_1 = v77.__calculatedStyle;
    local v81 = v2[v78.__componentName];
    if not l___calculatedStyle_1 then
        assert(false, "Style:getConsumerItem() is unable to find the Style in context of " .. v78.__componentName);
        return v77;
    else
        local v82 = nil;
        if l_Style_1 then
            if type(l_Style_1) == "table" then
                v82 = setmetatable(l_Style_1, {
                    __index = v9
                });
            elseif type(l_Style_1) == "string" then
                v82 = v77:__getClassStyle(l_Style_1, l___calculatedStyle_1, v81);
            end;
        end;
        v82 = v82 or l___calculatedStyle_1[v81] or l___calculatedStyle_1 or v77;
        local v83 = getmetatable(v78.state);
        local v84 = v83 and tostring(v83) == "UninitializedState";
        local v85 = v78.props.StyleModifier or if v84 then nil else v78.state.StyleModifier;
        local v86 = v82[v85];
        if v85 and v86 then
            setmetatable(v86, {
                __index = v82
            });
            for v87, v88 in pairs(v86) do
                if type(v88) == "table" and v82[v87] then
                    setmetatable(v88, {
                        __index = v82[v87]
                    });
                end;
            end;
            v82 = v86;
        end;
        return v82;
    end;
end;
v9.mock = function(v89, v90, v91) --[[ Line: 395 ]] --[[ Name: mock ]]
    -- upvalues: v9 (copy)
    local v92 = v9.new(v89, v90);
    if v90.themeChangedConnection then
        v92.themeChangedConnection:Disconnect();
        v92.themeChangedConnection = v90.themeChangedConnection:Connect(function() --[[ Line: 400 ]]
            -- upvalues: v91 (copy), v92 (copy), v90 (copy)
            v91();
            v92:__recalculateTheme(v90);
        end);
    end;
    return v92;
end;
return v9;
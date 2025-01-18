local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.ReactIs);
local _ = require(script.Parent.Parent.Types);
local v8 = require(script.Parent.lib.markup);
local l_printChildren_0 = v8.printChildren;
local l_printElement_0 = v8.printElement;
local l_printElementAsLeaf_0 = v8.printElementAsLeaf;
local l_printProps_0 = v8.printProps;
local function v13(v14, v15) --[[ Line: 32 ]] --[[ Name: getChildren ]]
    -- upvalues: l_Array_0 (copy), v13 (copy)
    local v16 = v15 or {};
    if l_Array_0.isArray(v14) then
        l_Array_0.forEach(v14, function(v17) --[[ Line: 35 ]]
            -- upvalues: v13 (ref), v16 (copy)
            v13(v17, v16);
        end);
        return v16;
    else
        if v14 ~= nil and v14 ~= false then
            table.insert(v16, v14);
        end;
        return v16;
    end;
end;
local function v24(v18) --[[ Line: 44 ]] --[[ Name: getType ]]
    -- upvalues: l_Boolean_0 (copy), v6 (copy)
    local l_type_0 = v18.type;
    if typeof(l_type_0) == "string" then
        return l_type_0;
    elseif typeof(l_type_0) == "function" then
        local v20 = debug.info(l_type_0, "n");
        if l_Boolean_0.toJSBoolean(v20) then
            return v20;
        else
            return "Unknown";
        end;
    else
        if typeof(l_type_0) == "table" then
            local v21 = getmetatable(l_type_0);
            if v21 ~= nil and typeof(v21.__call) == "function" then
                if l_Boolean_0.toJSBoolean(l_type_0.displayName) then
                    return l_type_0.displayName;
                elseif l_Boolean_0.toJSBoolean(l_type_0.name) then
                    return l_type_0.name;
                else
                    return "Unknown";
                end;
            end;
        end;
        if v6.isFragment(v18) then
            return "React.Fragment";
        elseif v6.isSuspense(v18) then
            return "React.Suspense";
        else
            if typeof(l_type_0) == "table" and l_type_0 ~= nil then
                if v6.isContextProvider(v18) then
                    return "Context.Provider";
                elseif v6.isContextConsumer(v18) then
                    return "Context.Consumer";
                elseif v6.isForwardRef(v18) then
                    if l_Boolean_0.toJSBoolean(l_type_0.displayName) then
                        return l_type_0.displayName;
                    else
                        local v22 = if typeof(l_type_0.render) == "function" and l_Boolean_0.toJSBoolean(debug.info(l_type_0.render, "n")) then debug.info(l_type_0.render, "n") else if typeof(l_type_0.render) == "table" then if l_Boolean_0.toJSBoolean(l_type_0.render.displayName) then l_type_0.render.displayName else if l_Boolean_0.toJSBoolean(l_type_0.render.name) then l_type_0.render.name else "" else "";
                        if v22 ~= "" then
                            return "ForwardRef(" .. v22 .. ")";
                        else
                            return "ForwardRef";
                        end;
                    end;
                elseif v6.isMemo(v18) then
                    local v23 = if l_Boolean_0.toJSBoolean(l_type_0.displayName) then l_type_0.displayName else if typeof(l_type_0.type) == "table" and l_Boolean_0.toJSBoolean(l_type_0.type.displayName) then l_type_0.type.displayName else if typeof(l_type_0.type) == "function" and l_Boolean_0.toJSBoolean(debug.info(l_type_0.type, "n")) then debug.info(l_type_0.type, "n") else "";
                    if v23 ~= "" then
                        return "Memo(" .. v23 .. ")";
                    else
                        return "Memo";
                    end;
                end;
            end;
            return "UNDEFINED";
        end;
    end;
end;
local function _(v25) --[[ Line: 116 ]] --[[ Name: getPropKeys ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local l_props_0 = v25.props;
    return l_Array_0.sort(l_Array_0.filter(l_Object_0.keys(l_props_0), function(v27) --[[ Line: 119 ]]
        -- upvalues: l_props_0 (copy)
        local v28 = false;
        if v27 ~= "children" then
            v28 = l_props_0[v27] ~= nil;
        end;
        return v28;
    end));
end;
local function v42(v30, v31, v32, v33, v34, v35) --[[ Line: 126 ]] --[[ Name: serialize ]]
    -- upvalues: l_printElementAsLeaf_0 (copy), v24 (copy), l_printElement_0 (copy), l_printProps_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_printChildren_0 (copy), v13 (copy)
    v33 = v33 + 1;
    if v31.maxDepth < v33 then
        return (l_printElementAsLeaf_0(v24(v30), v31));
    else
        local l_l_printElement_0_0 = l_printElement_0;
        local v37 = v24(v30);
        local l_l_printProps_0_0 = l_printProps_0;
        local l_props_1 = v30.props;
        return (l_l_printElement_0_0(v37, l_l_printProps_0_0(l_Array_0.sort(l_Array_0.filter(l_Object_0.keys(l_props_1), function(v40) --[[ Line: 119 ]]
            -- upvalues: l_props_1 (copy)
            local v41 = false;
            if v40 ~= "children" then
                v41 = l_props_1[v40] ~= nil;
            end;
            return v41;
        end)), v30.props, v31, v32 .. v31.indent, v33, v34, v35), l_printChildren_0(v13(v30.props.children), v31, v32 .. v31.indent, v33, v34, v35), v31, v32));
    end;
end;
v5.serialize = v42;
local function v45(v43) --[[ Line: 156 ]] --[[ Name: test ]]
    -- upvalues: v6 (copy)
    local v44 = false;
    if v43 ~= nil then
        v44 = v6.isElement(v43);
    end;
    return v44;
end;
v5.test = v45;
v5.default = {
    serialize = v42, 
    test = v45
};
return v5;
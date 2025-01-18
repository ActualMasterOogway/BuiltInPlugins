local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Set_0 = v2.Set;
local l_String_0 = v2.String;
local l_inspect_0 = v2.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local v8 = require(l_Parent_0.React);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local v10 = require(script.Parent.SingleEventManager);
local l_Type_0 = require(l_Parent_0.Shared).Type;
local v12 = require(script.Parent.getDefaultInstanceProperty);
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"]);
local l_Tag_0 = require(l_Parent_0.React).Tag;
local v15 = {};
local v16 = {};
local function v17(...) --[[ Line: 57 ]] --[[ Name: identity ]]
    return ...;
end;
local function v24(v18, v19, v20) --[[ Line: 61 ]] --[[ Name: setRobloxInstanceProperty ]]
    -- upvalues: v12 (copy)
    if v20 == nil then
        local l_ClassName_0 = v18.ClassName;
        local _, v23 = v12(l_ClassName_0, v19);
        v20 = v23;
    end;
    v18[v19] = v20;
end;
local function _(v25, v26) --[[ Line: 73 ]] --[[ Name: removeBinding ]]
    -- upvalues: v16 (copy)
    local v27 = v16[v25];
    if v27 ~= nil then
        v27[v26]();
        v27[v26] = nil;
    end;
end;
local function v38(v29, v30, v31) --[[ Line: 82 ]] --[[ Name: attachBinding ]]
    -- upvalues: v24 (copy), v17 (copy), l_console_0 (copy), v16 (copy), v8 (copy)
    local function v37(v32) --[[ Line: 83 ]] --[[ Name: updateBoundProperty ]]
        -- upvalues: v24 (ref), v17 (ref), v29 (copy), v30 (copy), v31 (copy), l_console_0 (ref)
        local v33, v34 = xpcall(v24, v17, v29, v30, v32);
        if not v33 then
            local v35 = v31._source or "<enable DEV mode for stack>";
            local v36 = ("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n"):format(v30, v29.Name, v29.ClassName, tostring(v32), v34, v35);
            l_console_0.error(v36);
            error(v36, 0);
        end;
    end;
    if v16[v29] == nil then
        v16[v29] = {};
    end;
    v16[v29][v30] = v8.__subscribeToBinding(v31, v37);
    v37(v31:getValue());
end;
local function v48(v39, v40, v41) --[[ Line: 109 ]] --[[ Name: applyTags ]]
    -- upvalues: l_console_0 (copy), l_inspect_0 (copy), l_Set_0 (copy), l_String_0 (copy), l_CollectionService_0 (copy)
    if _G.__DEV__ and v41 ~= nil and typeof(v41) ~= "string" then
        l_console_0.error("Type provided for ReactRoblox.Tag is invalid - tags should be " .. "specified as a single string, with individual tags delimited " .. "by spaces. Instead received:\n%s", l_inspect_0(v41));
        return;
    else
        local v42 = l_Set_0.new(l_String_0.split(v40 or "", " "));
        local v43 = l_Set_0.new(l_String_0.split(v41 or "", " "));
        for _, v45 in v42:ipairs() do
            if not v43:has(v45) then
                l_CollectionService_0:RemoveTag(v39, v45);
            end;
        end;
        for _, v47 in v43:ipairs() do
            if not v42:has(v47) then
                l_CollectionService_0:AddTag(v39, v47);
            end;
        end;
        return;
    end;
end;
local function v52(v49) --[[ Line: 139 ]] --[[ Name: removeAllTags ]]
    -- upvalues: l_CollectionService_0 (copy)
    for _, v51 in ipairs(l_CollectionService_0:GetTags(v49)) do
        l_CollectionService_0:RemoveTag(v49, v51);
    end;
end;
local function v67(v53, v54, v55, v56) --[[ Line: 145 ]] --[[ Name: applyProp ]]
    -- upvalues: l_Type_0 (copy), v15 (copy), v10 (copy), l_ReactSymbols_0 (copy), v16 (copy), v38 (copy), l_Tag_0 (copy), v48 (copy), v12 (copy)
    local v57 = l_Type_0.of(v54);
    if v57 == l_Type_0.HostEvent or v57 == l_Type_0.HostChangeEvent then
        local v58 = v15[v53];
        if v58 == nil then
            v58 = v10.new(v53);
            v15[v53] = v58;
        end;
        local l_name_0 = v54.name;
        if v57 == l_Type_0.HostChangeEvent then
            v58:connectPropertyChange(l_name_0, v55);
            return;
        else
            v58:connectEvent(l_name_0, v55);
            return;
        end;
    else
        local v60 = false;
        if typeof(v55) == "table" then
            v60 = v55["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        local v61 = false;
        if v56 ~= nil then
            v61 = false;
            if typeof(v56) == "table" then
                v61 = v56["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
            end;
        end;
        if v61 then
            local v62 = v16[v53];
            if v62 ~= nil then
                v62[v54]();
                v62[v54] = nil;
            end;
        end;
        if v60 then
            v38(v53, v54, v55);
            return;
        else
            if v54 == l_Tag_0 then
                if _G.__DEV__ then
                    v48(v53, v56, v55);
                    return;
                end;
            else
                local l_v55_0 = v55;
                if l_v55_0 == nil then
                    local l_ClassName_1 = v53.ClassName;
                    local _, v66 = v12(l_ClassName_1, v54);
                    l_v55_0 = v66;
                end;
                v53[v54] = l_v55_0;
            end;
            return;
        end;
    end;
end;
local function v72(v68, v69) --[[ Line: 190 ]] --[[ Name: applyProps ]]
    -- upvalues: v67 (copy)
    for v70, v71 in pairs(v69) do
        if v70 ~= "ref" and v70 ~= "children" then
            v67(v68, v70, v71);
        end;
    end;
end;
local function v80(v73, _, v75, _) --[[ Line: 201 ]] --[[ Name: setInitialProperties ]]
    -- upvalues: v72 (copy), v17 (copy), l_console_0 (copy), v15 (copy)
    local v77, v78 = xpcall(v72, v17, v73, v75);
    if not v77 then
        local v79 = ("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n"):format(v73.Name, v73.ClassName, v78);
        l_console_0.error(v79);
        error(v79, 0);
    end;
    if v15[v73] ~= nil then
        v15[v73]:resume();
    end;
end;
local function v87(v81, v82, v83) --[[ Line: 229 ]] --[[ Name: safelyApplyProperties ]]
    -- upvalues: l_Object_0 (copy), v67 (copy)
    for v84 = 1, #v82, 2 do
        local v85 = v82[v84];
        local v86 = v82[v84 + 1];
        if v86 == l_Object_0.None then
            v86 = nil;
        end;
        if v85 ~= "ref" and v85 ~= "children" then
            v67(v81, v85, v86, v83[v85]);
        end;
    end;
end;
return {
    setInitialProperties = v80, 
    updateProperties = function(v88, v89, v90) --[[ Line: 248 ]] --[[ Name: updateProperties ]]
        -- upvalues: v15 (copy), v87 (copy), v17 (copy), l_console_0 (copy)
        if v15[v88] ~= nil then
            v15[v88]:suspend();
        end;
        local v91, v92 = xpcall(v87, v17, v88, v89, v90);
        if not v91 then
            local v93 = ("Error updating props on Roblox Instance '%s' (%s):\n  %s\n"):format(v88.Name, v88.ClassName, v92);
            l_console_0.error(v93);
            error(v93, 0);
        end;
        if v15[v88] ~= nil then
            v15[v88]:resume();
        end;
    end, 
    cleanupHostComponent = function(v94) --[[ Line: 284 ]] --[[ Name: cleanupHostComponent ]]
        -- upvalues: v15 (copy), v16 (copy), v52 (copy)
        if v15[v94] ~= nil then
            v15[v94] = nil;
        end;
        if v16[v94] ~= nil then
            v16[v94] = nil;
        end;
        if typeof(v94) ~= "Instance" then
            return;
        else
            if _G.__DEV__ then
                v52(v94);
            end;
            for _, v96 in ipairs(v94:GetDescendants()) do
                if v15[v96] ~= nil then
                    v15[v96] = nil;
                end;
                if v16[v96] ~= nil then
                    v16[v96] = nil;
                end;
                if _G.__DEV__ then
                    v52(v94);
                end;
            end;
            return;
        end;
    end, 
    _instanceToEventManager = v15, 
    _instanceToBindings = v16
};
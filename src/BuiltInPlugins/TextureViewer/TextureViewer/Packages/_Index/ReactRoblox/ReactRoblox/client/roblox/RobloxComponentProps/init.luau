local l___DEV___0 = _G.__DEV__;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local l_String_0 = v3.String;
local l_inspect_0 = v3.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local v9 = require(l_Parent_0.React);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local v11 = require(script.Parent.SingleEventManager);
local l_Type_0 = require(l_Parent_0.Shared).Type;
local v13 = require(script.Parent.getDefaultInstanceProperty);
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"]);
local l_Tag_0 = require(l_Parent_0.React).Tag;
local v16 = {};
local v17 = {};
local function v18(...) --[[ Line: 72 ]] --[[ Name: identity ]]
    return ...;
end;
local function v25(v19, v20, v21) --[[ Line: 76 ]] --[[ Name: setRobloxInstanceProperty ]]
    -- upvalues: v13 (copy)
    if v21 == nil then
        local l_ClassName_0 = v19.ClassName;
        local _, v24 = v13(l_ClassName_0, v20);
        v21 = v24;
    end;
    v19[v20] = v21;
end;
local function _(v26, v27) --[[ Line: 88 ]] --[[ Name: removeBinding ]]
    -- upvalues: v17 (copy)
    local v28 = v17[v26];
    if v28 ~= nil then
        v28[v27]();
        v28[v27] = nil;
    end;
end;
local function v39(v30, v31, v32) --[[ Line: 97 ]] --[[ Name: attachBinding ]]
    -- upvalues: v25 (copy), v18 (copy), l_console_0 (copy), v17 (copy), v9 (copy)
    local function v38(v33) --[[ Line: 98 ]] --[[ Name: updateBoundProperty ]]
        -- upvalues: v25 (ref), v18 (ref), v30 (copy), v31 (copy), v32 (copy), l_console_0 (ref)
        local v34, v35 = xpcall(v25, v18, v30, v31, v33);
        if not v34 then
            local v36 = v32._source or "<enable DEV mode for stack>";
            local v37 = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", v31, v30.Name, v30.ClassName, tostring(v33), v35, v36);
            l_console_0.error(v37);
            error(v37, 0);
        end;
    end;
    if v17[v30] == nil then
        v17[v30] = {};
    end;
    v17[v30][v31] = v9.__subscribeToBinding(v32, v38);
    v38(v32:getValue());
end;
local function v49(v40, v41, v42) --[[ Line: 124 ]] --[[ Name: applyTags ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_inspect_0 (copy), l_Set_0 (copy), l_String_0 (copy), l_CollectionService_0 (copy)
    if l___DEV___0 and v42 ~= nil and typeof(v42) ~= "string" then
        l_console_0.error("Type provided for ReactRoblox.Tag is invalid - tags should be " .. "specified as a single string, with individual tags delimited " .. "by spaces. Instead received:\n%s", l_inspect_0(v42));
        return;
    else
        local v43 = l_Set_0.new(l_String_0.split(v41 or "", " "));
        local v44 = l_Set_0.new(l_String_0.split(v42 or "", " "));
        for _, v46 in v43 do
            if not v44:has(v46) then
                l_CollectionService_0:RemoveTag(v40, v46);
            end;
        end;
        for _, v48 in v44 do
            if not v43:has(v48) then
                l_CollectionService_0:AddTag(v40, v48);
            end;
        end;
        return;
    end;
end;
local _ = function(v50) --[[ Line: 152 ]] --[[ Name: removeAllTags ]]
    -- upvalues: l_CollectionService_0 (copy)
    for _, v52 in l_CollectionService_0:GetTags(v50) do
        l_CollectionService_0:RemoveTag(v50, v52);
    end;
end;
local function v68(v54, v55, v56, v57) --[[ Line: 158 ]] --[[ Name: applyProp ]]
    -- upvalues: l_Type_0 (copy), v16 (copy), v11 (copy), l_ReactSymbols_0 (copy), v17 (copy), v39 (copy), l_Tag_0 (copy), v49 (copy), v13 (copy)
    local v58 = l_Type_0.of(v55);
    if v58 == l_Type_0.HostEvent or v58 == l_Type_0.HostChangeEvent then
        local v59 = v16[v54];
        if v59 == nil then
            v59 = v11.new(v54);
            v16[v54] = v59;
        end;
        local l_name_0 = v55.name;
        if v58 == l_Type_0.HostChangeEvent then
            v59:connectPropertyChange(l_name_0, v56);
            return;
        else
            v59:connectEvent(l_name_0, v56);
            return;
        end;
    else
        local v61 = false;
        if typeof(v56) == "table" then
            v61 = v56["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        local v62 = false;
        if v57 ~= nil then
            v62 = false;
            if typeof(v57) == "table" then
                v62 = v57["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
            end;
        end;
        if v62 then
            local v63 = v17[v54];
            if v63 ~= nil then
                v63[v55]();
                v63[v55] = nil;
            end;
        end;
        if v61 then
            v39(v54, v55, v56);
            return;
        elseif v55 == l_Tag_0 then
            v49(v54, v57, v56);
            return;
        else
            local l_v56_0 = v56;
            if l_v56_0 == nil then
                local l_ClassName_1 = v54.ClassName;
                local _, v67 = v13(l_ClassName_1, v55);
                l_v56_0 = v67;
            end;
            v54[v55] = l_v56_0;
            return;
        end;
    end;
end;
local function v73(v69, v70) --[[ Line: 200 ]] --[[ Name: applyProps ]]
    -- upvalues: v68 (copy)
    for v71, v72 in v70 do
        if v71 ~= "ref" and v71 ~= "children" then
            v68(v69, v71, v72);
        end;
    end;
end;
local function v81(v74, _, v76, _) --[[ Line: 211 ]] --[[ Name: setInitialProperties ]]
    -- upvalues: v73 (copy), v18 (copy), l_console_0 (copy), v16 (copy)
    local v78, v79 = xpcall(v73, v18, v74, v76);
    if not v78 then
        local v80 = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", v74.Name, v74.ClassName, v79);
        l_console_0.error(v80);
        error(v80, 0);
    end;
    if v16[v74] ~= nil then
        v16[v74]:resume();
    end;
end;
local function v88(v82, v83, v84) --[[ Line: 239 ]] --[[ Name: safelyApplyProperties ]]
    -- upvalues: l_Object_0 (copy), v68 (copy)
    for v85 = 1, #v83, 2 do
        local v86 = v83[v85];
        local v87 = v83[v85 + 1];
        if v87 == l_Object_0.None then
            v87 = nil;
        end;
        if v86 ~= "ref" and v86 ~= "children" then
            v68(v82, v86, v87, v84[v86]);
        end;
    end;
end;
return {
    setInitialProperties = v81, 
    updateProperties = function(v89, v90, v91) --[[ Line: 258 ]] --[[ Name: updateProperties ]]
        -- upvalues: v16 (copy), v88 (copy), v18 (copy), l_console_0 (copy)
        if v16[v89] ~= nil then
            v16[v89]:suspend();
        end;
        local v92, v93 = xpcall(v88, v18, v89, v90, v91);
        if not v92 then
            local v94 = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", v89.Name, v89.ClassName, v93);
            l_console_0.error(v94);
            error(v94, 0);
        end;
        if v16[v89] ~= nil then
            v16[v89]:resume();
        end;
    end, 
    cleanupHostComponent = function(v95) --[[ Line: 294 ]] --[[ Name: cleanupHostComponent ]]
        -- upvalues: v16 (copy), v17 (copy), l_CollectionService_0 (copy)
        if v16[v95] ~= nil then
            v16[v95] = nil;
        end;
        if v17[v95] ~= nil then
            v17[v95] = nil;
        end;
        if typeof(v95) ~= "Instance" then
            return;
        else
            for _, v97 in l_CollectionService_0:GetTags(v95) do
                l_CollectionService_0:RemoveTag(v95, v97);
            end;
            for _, v99 in v95:GetDescendants() do
                if v16[v99] ~= nil then
                    v16[v99] = nil;
                end;
                if v17[v99] ~= nil then
                    v17[v99] = nil;
                end;
                for _, v101 in l_CollectionService_0:GetTags(v95) do
                    l_CollectionService_0:RemoveTag(v95, v101);
                end;
            end;
            return;
        end;
    end, 
    _instanceToEventManager = v16, 
    _instanceToBindings = v17
};
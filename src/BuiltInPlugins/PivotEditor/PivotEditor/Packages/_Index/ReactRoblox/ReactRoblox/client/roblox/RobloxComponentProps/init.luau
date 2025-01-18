local l___DEV___0 = _G.__DEV__;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local _ = v3.Set;
local _ = v3.String;
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
local function _(v26, v27) --[[ Line: 87 ]] --[[ Name: removeBinding ]]
    -- upvalues: v17 (copy)
    local v28 = v17[v26];
    if v28 ~= nil then
        v28[v27]();
        v28[v27] = nil;
    end;
end;
local function v39(v30, v31, v32) --[[ Line: 96 ]] --[[ Name: attachBinding ]]
    -- upvalues: v25 (copy), v18 (copy), l_console_0 (copy), v17 (copy), v9 (copy)
    local function v38(v33) --[[ Line: 97 ]] --[[ Name: updateBoundProperty ]]
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
local function v51(v40, v41, v42) --[[ Line: 129 ]] --[[ Name: applyTags ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_inspect_0 (copy), l_CollectionService_0 (copy)
    if l___DEV___0 and v42 ~= nil and typeof(v42) ~= "string" then
        l_console_0.error("Type provided for ReactRoblox.Tag is invalid - tags should be " .. "specified as a single string, with individual tags delimited " .. "by spaces. Instead received:\n%s", l_inspect_0(v42));
        return;
    else
        local v43 = {};
        for v44 in string.gmatch(v41 or "", "%S+") do
            v43[v44] = true;
        end;
        local v45 = {};
        for v46 in string.gmatch(v42 or "", "%S+") do
            v45[v46] = true;
        end;
        for v47, _ in v43 do
            if not v45[v47] then
                l_CollectionService_0:RemoveTag(v40, v47);
            end;
        end;
        for v49, _ in v45 do
            if not v43[v49] then
                l_CollectionService_0:AddTag(v40, v49);
            end;
        end;
        return;
    end;
end;
local _ = function(v52) --[[ Line: 163 ]] --[[ Name: removeAllTags ]]
    -- upvalues: l_CollectionService_0 (copy)
    for _, v54 in l_CollectionService_0:GetTags(v52) do
        l_CollectionService_0:RemoveTag(v52, v54);
    end;
end;
local function v70(v56, v57, v58, v59) --[[ Line: 169 ]] --[[ Name: applyProp ]]
    -- upvalues: l_Type_0 (copy), v16 (copy), v11 (copy), l_ReactSymbols_0 (copy), v17 (copy), v39 (copy), l_Tag_0 (copy), v51 (copy), v13 (copy)
    local v60 = l_Type_0.of(v57);
    if v60 == l_Type_0.HostEvent or v60 == l_Type_0.HostChangeEvent then
        local v61 = v16[v56];
        if v61 == nil then
            v61 = v11.new(v56);
            v16[v56] = v61;
        end;
        local l_name_0 = v57.name;
        if v60 == l_Type_0.HostChangeEvent then
            v61:connectPropertyChange(l_name_0, v58);
            return;
        else
            v61:connectEvent(l_name_0, v58);
            return;
        end;
    else
        local v63 = false;
        if typeof(v58) == "table" then
            v63 = v58["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        local v64 = false;
        if v59 ~= nil then
            v64 = false;
            if typeof(v59) == "table" then
                v64 = v59["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
            end;
        end;
        if v64 then
            local v65 = v17[v56];
            if v65 ~= nil then
                v65[v57]();
                v65[v57] = nil;
            end;
        end;
        if v63 then
            v39(v56, v57, v58);
            return;
        elseif v57 == l_Tag_0 then
            v51(v56, v59, v58);
            return;
        else
            local l_v58_0 = v58;
            if l_v58_0 == nil then
                local l_ClassName_1 = v56.ClassName;
                local _, v69 = v13(l_ClassName_1, v57);
                l_v58_0 = v69;
            end;
            v56[v57] = l_v58_0;
            return;
        end;
    end;
end;
local function v75(v71, v72) --[[ Line: 214 ]] --[[ Name: applyProps ]]
    -- upvalues: v70 (copy)
    for v73, v74 in v72 do
        if v73 ~= "ref" and v73 ~= "children" then
            v70(v71, v73, v74);
        end;
    end;
end;
local function v83(v76, _, v78, _) --[[ Line: 225 ]] --[[ Name: setInitialProperties ]]
    -- upvalues: v75 (copy), v18 (copy), l_console_0 (copy), v16 (copy)
    local v80, v81 = xpcall(v75, v18, v76, v78);
    if not v80 then
        local v82 = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", v76.Name, v76.ClassName, v81);
        l_console_0.error(v82);
        error(v82, 0);
    end;
    if v16[v76] ~= nil then
        v16[v76]:resume();
    end;
end;
local function v90(v84, v85, v86) --[[ Line: 254 ]] --[[ Name: safelyApplyProperties ]]
    -- upvalues: l_Object_0 (copy), v70 (copy)
    for v87 = 1, #v85, 2 do
        local v88 = v85[v87];
        local v89 = v85[v87 + 1];
        if v89 == l_Object_0.None then
            v89 = nil;
        end;
        if v88 ~= "ref" and v88 ~= "children" then
            v70(v84, v88, v89, v86[v88]);
        end;
    end;
end;
return {
    setInitialProperties = v83, 
    updateProperties = function(v91, v92, v93) --[[ Line: 273 ]] --[[ Name: updateProperties ]]
        -- upvalues: v16 (copy), v90 (copy), v18 (copy), l_console_0 (copy)
        if v16[v91] ~= nil then
            v16[v91]:suspend();
        end;
        local v94, v95 = xpcall(v90, v18, v91, v92, v93);
        if not v94 then
            local v96 = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", v91.Name, v91.ClassName, v95);
            l_console_0.error(v96);
            error(v96, 0);
        end;
        if v16[v91] ~= nil then
            v16[v91]:resume();
        end;
    end, 
    cleanupHostComponent = function(v97) --[[ Line: 309 ]] --[[ Name: cleanupHostComponent ]]
        -- upvalues: v16 (copy), v17 (copy), l_CollectionService_0 (copy)
        if v16[v97] ~= nil then
            v16[v97] = nil;
        end;
        if v17[v97] ~= nil then
            v17[v97] = nil;
        end;
        if typeof(v97) ~= "Instance" then
            return;
        else
            for _, v99 in l_CollectionService_0:GetTags(v97) do
                l_CollectionService_0:RemoveTag(v97, v99);
            end;
            for _, v101 in v97:GetDescendants() do
                if v16[v101] ~= nil then
                    v16[v101] = nil;
                end;
                if v17[v101] ~= nil then
                    v17[v101] = nil;
                end;
                for _, v103 in l_CollectionService_0:GetTags(v97) do
                    l_CollectionService_0:RemoveTag(v97, v103);
                end;
            end;
            return;
        end;
    end, 
    _instanceToEventManager = v16, 
    _instanceToBindings = v17
};
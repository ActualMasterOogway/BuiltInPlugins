local l___DEV___0 = _G.__DEV__;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_inspect_0 = v3.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local v7 = require(l_Parent_0.React);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local v9 = require(script.Parent.SingleEventManager);
local l_Type_0 = require(l_Parent_0.Shared).Type;
local v11 = require(script.Parent.getDefaultInstanceProperty);
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"]);
local l_Tag_0 = require(l_Parent_0.React).Tag;
local v14 = {};
local v15 = {};
local function v16(...) --[[ Line: 70 ]] --[[ Name: identity ]]
    return ...;
end;
local function v25(v17, v18, v19) --[[ Line: 74 ]] --[[ Name: setRobloxInstanceProperty ]]
    -- upvalues: v11 (copy)
    if v19 == nil then
        local l_status_0, _ = pcall(v17.ResetPropertyToDefault, v17, v18);
        if l_status_0 then
            return;
        else
            local l_ClassName_0 = v17.ClassName;
            local _, v24 = v11(l_ClassName_0, v18);
            v19 = v24;
        end;
    end;
    v17[v18] = v19;
end;
local function _(v26, v27) --[[ Line: 90 ]] --[[ Name: removeBinding ]]
    -- upvalues: v15 (copy)
    local v28 = v15[v26];
    if v28 ~= nil then
        v28[v27]();
        v28[v27] = nil;
    end;
end;
local function v39(v30, v31, v32) --[[ Line: 99 ]] --[[ Name: attachBinding ]]
    -- upvalues: v25 (copy), v16 (copy), l_console_0 (copy), v15 (copy), v7 (copy)
    local function v38(v33) --[[ Line: 100 ]] --[[ Name: updateBoundProperty ]]
        -- upvalues: v25 (ref), v16 (ref), v30 (copy), v31 (copy), v32 (copy), l_console_0 (ref)
        local v34, v35 = xpcall(v25, v16, v30, v31, v33);
        if not v34 then
            local v36 = v32._source or "<enable DEV mode for stack>";
            local v37 = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", v31, v30.Name, v30.ClassName, tostring(v33), v35, v36);
            l_console_0.error(v37);
            error(v37, 0);
        end;
    end;
    if v15[v30] == nil then
        v15[v30] = {};
    end;
    v15[v30][v31] = v7.__subscribeToBinding(v32, v38);
    v38(v32:getValue());
end;
local function v51(v40, v41, v42) --[[ Line: 132 ]] --[[ Name: applyTags ]]
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
local _ = function(v52) --[[ Line: 166 ]] --[[ Name: removeAllTags ]]
    -- upvalues: l_CollectionService_0 (copy)
    for _, v54 in l_CollectionService_0:GetTags(v52) do
        l_CollectionService_0:RemoveTag(v52, v54);
    end;
end;
local function v72(v56, v57, v58, v59) --[[ Line: 172 ]] --[[ Name: applyProp ]]
    -- upvalues: l_Type_0 (copy), v14 (copy), v9 (copy), l_ReactSymbols_0 (copy), v15 (copy), v39 (copy), l_Tag_0 (copy), v51 (copy), v11 (copy)
    local v60 = l_Type_0.of(v57);
    if v60 == l_Type_0.HostEvent or v60 == l_Type_0.HostChangeEvent then
        local v61 = v14[v56];
        if v61 == nil then
            v61 = v9.new(v56);
            v14[v56] = v61;
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
            local v65 = v15[v56];
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
                local l_status_1, _ = pcall(v56.ResetPropertyToDefault, v56, v57);
                if l_status_1 then
                    return;
                else
                    local l_ClassName_1 = v56.ClassName;
                    local _, v71 = v11(l_ClassName_1, v57);
                    l_v58_0 = v71;
                end;
            end;
            v56[v57] = l_v58_0;
            return;
        end;
    end;
end;
local function v77(v73, v74) --[[ Line: 217 ]] --[[ Name: applyProps ]]
    -- upvalues: v72 (copy)
    for v75, v76 in v74 do
        if v75 ~= "ref" and v75 ~= "children" then
            v72(v73, v75, v76);
        end;
    end;
end;
local function v85(v78, _, v80, _) --[[ Line: 228 ]] --[[ Name: setInitialProperties ]]
    -- upvalues: v77 (copy), v16 (copy), l_console_0 (copy), v14 (copy)
    local v82, v83 = xpcall(v77, v16, v78, v80);
    if not v82 then
        local v84 = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", v78.Name, v78.ClassName, v83);
        l_console_0.error(v84);
        error(v84, 0);
    end;
    if v14[v78] ~= nil then
        v14[v78]:resume();
    end;
end;
local function v92(v86, v87, v88) --[[ Line: 257 ]] --[[ Name: safelyApplyProperties ]]
    -- upvalues: l_Object_0 (copy), v72 (copy)
    for v89 = 1, #v87, 2 do
        local v90 = v87[v89];
        local v91 = v87[v89 + 1];
        if v91 == l_Object_0.None then
            v91 = nil;
        end;
        if v90 ~= "ref" and v90 ~= "children" then
            v72(v86, v90, v91, v88[v90]);
        end;
    end;
end;
local function v99(v93, v94, v95) --[[ Line: 276 ]] --[[ Name: updateProperties ]]
    -- upvalues: v14 (copy), v92 (copy), v16 (copy), l_console_0 (copy)
    if v14[v93] ~= nil then
        v14[v93]:suspend();
    end;
    local v96, v97 = xpcall(v92, v16, v93, v94, v95);
    if not v96 then
        local v98 = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", v93.Name, v93.ClassName, v97);
        l_console_0.error(v98);
        error(v98, 0);
    end;
    if v14[v93] ~= nil then
        v14[v93]:resume();
    end;
end;
local _, v101 = xpcall(function() --[[ Line: 310 ]]
    return game:DefineFastFlag("ReactFixBindingMemoryLeak", false);
end, function() --[[ Line: 312 ]]
    return true;
end);
local _ = function(v102) --[[ Line: 316 ]] --[[ Name: cleanupBindings ]]
    -- upvalues: v15 (copy)
    local v103 = v15[v102];
    if v103 ~= nil then
        for _, v105 in v103 do
            v105();
        end;
        v15[v102] = nil;
    end;
end;
return {
    setInitialProperties = v85, 
    updateProperties = v99, 
    cleanupHostComponent = function(v107) --[[ Line: 329 ]] --[[ Name: cleanupHostComponent ]]
        -- upvalues: v14 (copy), v101 (copy), v15 (copy), l_CollectionService_0 (copy)
        if v14[v107] ~= nil then
            v14[v107] = nil;
        end;
        if v101 then
            local v108 = v15[v107];
            if v108 ~= nil then
                for _, v110 in v108 do
                    v110();
                end;
                v15[v107] = nil;
            end;
        elseif v15[v107] ~= nil then
            v15[v107] = nil;
        end;
        if typeof(v107) ~= "Instance" then
            return;
        else
            for _, v112 in l_CollectionService_0:GetTags(v107) do
                l_CollectionService_0:RemoveTag(v107, v112);
            end;
            for _, v114 in v107:GetDescendants() do
                if v14[v114] ~= nil then
                    v14[v114] = nil;
                end;
                if v101 then
                    local v115 = v15[v114];
                    if v115 ~= nil then
                        for _, v117 in v115 do
                            v117();
                        end;
                        v15[v114] = nil;
                    end;
                elseif v15[v114] ~= nil then
                    v15[v114] = nil;
                end;
                for _, v119 in l_CollectionService_0:GetTags(v107) do
                    l_CollectionService_0:RemoveTag(v107, v119);
                end;
            end;
            return;
        end;
    end, 
    _instanceToEventManager = v14, 
    _instanceToBindings = v15
};
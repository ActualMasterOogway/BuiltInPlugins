local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = require(l_Parent_0.React);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local v5 = require(script.Parent.SingleEventManager);
local v6 = require(script.Parent.Type);
local v7 = require(script.Parent.getDefaultInstanceProperty);
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"]);
local v9 = {};
local v10 = {};
local function v11(...) --[[ Line: 52 ]] --[[ Name: identity ]]
    return ...;
end;
local function v18(v12, v13, v14) --[[ Line: 56 ]] --[[ Name: setRobloxInstanceProperty ]]
    -- upvalues: v7 (copy)
    if v14 == nil then
        local l_ClassName_0 = v12.ClassName;
        local _, v17 = v7(l_ClassName_0, v13);
        v14 = v17;
    end;
    v12[v13] = v14;
end;
local function _(v19, v20) --[[ Line: 68 ]] --[[ Name: removeBinding ]]
    -- upvalues: v10 (copy)
    local v21 = v10[v19];
    if v21 ~= nil then
        v21[v20]();
        v21[v20] = nil;
    end;
end;
local function v32(v23, v24, v25) --[[ Line: 77 ]] --[[ Name: attachBinding ]]
    -- upvalues: v18 (copy), v11 (copy), l_console_0 (copy), v10 (copy), v3 (copy)
    local function v31(v26) --[[ Line: 78 ]] --[[ Name: updateBoundProperty ]]
        -- upvalues: v18 (ref), v11 (ref), v23 (copy), v24 (copy), v25 (copy), l_console_0 (ref)
        local v27, v28 = xpcall(v18, v11, v23, v24, v26);
        if not v27 then
            local v29 = v25._source or "<enable DEV mode for stack>";
            local v30 = ("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n"):format(v24, v23.Name, v23.ClassName, tostring(v26), v28, v29);
            l_console_0.error(v30);
            error(v30, 0);
        end;
    end;
    if v10[v23] == nil then
        v10[v23] = {};
    end;
    v10[v23][v24] = v3.__subscribeToBinding(v25, v31);
    v31(v25:getValue());
end;
local function v47(v33, v34, v35, v36) --[[ Line: 104 ]] --[[ Name: applyProp ]]
    -- upvalues: v6 (copy), v9 (copy), v5 (copy), l_ReactSymbols_0 (copy), v10 (copy), v32 (copy), v7 (copy)
    local v37 = v6.of(v34);
    if v37 == v6.HostEvent or v37 == v6.HostChangeEvent then
        local v38 = v9[v33];
        if v38 == nil then
            v38 = v5.new(v33);
            v9[v33] = v38;
        end;
        local l_name_0 = v34.name;
        if v37 == v6.HostChangeEvent then
            v38:connectPropertyChange(l_name_0, v35);
            return;
        else
            v38:connectEvent(l_name_0, v35);
            return;
        end;
    else
        local v40 = false;
        if typeof(v35) == "table" then
            v40 = v35["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        local v41 = false;
        if v36 ~= nil then
            v41 = false;
            if typeof(v36) == "table" then
                v41 = v36["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
            end;
        end;
        if v41 then
            local v42 = v10[v33];
            if v42 ~= nil then
                v42[v34]();
                v42[v34] = nil;
            end;
        end;
        if v40 then
            v32(v33, v34, v35);
            return;
        else
            local l_v35_0 = v35;
            if l_v35_0 == nil then
                local l_ClassName_1 = v33.ClassName;
                local _, v46 = v7(l_ClassName_1, v34);
                l_v35_0 = v46;
            end;
            v33[v34] = l_v35_0;
            return;
        end;
    end;
end;
local function v52(v48, v49) --[[ Line: 144 ]] --[[ Name: applyProps ]]
    -- upvalues: v47 (copy)
    for v50, v51 in pairs(v49) do
        if v50 ~= "ref" and v50 ~= "children" then
            v47(v48, v50, v51, nil);
        end;
    end;
end;
local function v60(v53, _, v55, _) --[[ Line: 156 ]] --[[ Name: setInitialProperties ]]
    -- upvalues: v52 (copy), v11 (copy), l_console_0 (copy), v9 (copy)
    local v57, v58 = xpcall(v52, v11, v53, v55);
    if not v57 then
        local v59 = ("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n"):format(v53.Name, v53.ClassName, v58);
        l_console_0.error(v59);
        error(v59, 0);
    end;
    if v9[v53] ~= nil then
        v9[v53]:resume();
    end;
end;
local function v67(v61, v62, v63) --[[ Line: 184 ]] --[[ Name: safelyApplyProperties ]]
    -- upvalues: l_Object_0 (copy), v47 (copy)
    for v64 = 1, #v62, 2 do
        local v65 = v62[v64];
        local v66 = v62[v64 + 1];
        if v66 == l_Object_0.None then
            v66 = nil;
        end;
        if v65 ~= "ref" and v65 ~= "children" then
            v47(v61, v65, v66, v63[v65]);
        end;
    end;
end;
return {
    setInitialProperties = v60, 
    updateProperties = function(v68, v69, v70) --[[ Line: 203 ]] --[[ Name: updateProperties ]]
        -- upvalues: v9 (copy), v67 (copy), v11 (copy), l_console_0 (copy)
        if v9[v68] ~= nil then
            v9[v68]:suspend();
        end;
        local v71, v72 = xpcall(v67, v11, v68, v69, v70);
        if not v71 then
            local v73 = ("Error updating props on Roblox Instance '%s' (%s):\n  %s\n"):format(v68.Name, v68.ClassName, v72);
            l_console_0.error(v73);
            error(v73, 0);
        end;
        if v9[v68] ~= nil then
            v9[v68]:resume();
        end;
    end, 
    cleanupHostComponent = function(v74) --[[ Line: 239 ]] --[[ Name: cleanupHostComponent ]]
        -- upvalues: v9 (copy), v10 (copy)
        if v9[v74] ~= nil then
            v9[v74] = nil;
        end;
        if v10[v74] ~= nil then
            v10[v74] = nil;
        end;
        if typeof(v74) ~= "Instance" then
            return;
        else
            for _, v76 in ipairs(v74:GetDescendants()) do
                if v9[v76] ~= nil then
                    v9[v76] = nil;
                end;
                if v10[v76] ~= nil then
                    v10[v76] = nil;
                end;
            end;
            return;
        end;
    end, 
    _instanceToEventManager = v9, 
    _instanceToBindings = v10
};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_DraggerFramework_0.Utility.Signal);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem:extend("Signals");
v3.new = function(v4) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v5 = {
        signals = v3:__mapSignalIDs(v4)
    };
    setmetatable(v5, v3);
    return v5;
end;
v3.__mapSignalIDs = function(_, v7) --[[ Line: 28 ]] --[[ Name: __mapSignalIDs ]]
    -- upvalues: v2 (copy)
    local v8 = {};
    for _, v10 in pairs(v7) do
        assert(v8[v10] == nil, "Duplicate action, ID: " .. v10);
        v8[v10] = v2.new();
    end;
    return v8;
end;
v3.get = function(v11, v12) --[[ Line: 40 ]] --[[ Name: get ]]
    return v11.signals[v12];
end;
return v3;
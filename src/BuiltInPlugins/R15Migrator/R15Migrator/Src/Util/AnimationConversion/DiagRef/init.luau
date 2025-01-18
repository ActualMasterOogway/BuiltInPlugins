local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_ScriptAnalysis_0 = l_script_FirstAncestor_0.Src.Util.ScriptAnalysis;
local _ = require(l_ScriptAnalysis_0.Constants);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v4 = require(l_AnimationConversion_0.normalizeAssetId);
local v5 = {};
v5.__index = v5;
v5.__eq = function(v6, v7) --[[ Line: 16 ]]
    -- upvalues: v4 (copy)
    local v8 = false;
    if v6.scriptInstance == v7.scriptInstance then
        v8 = false;
        if v4(v6.str) == v4(v7.str) then
            v8 = v6.range == v7.range;
        end;
    end;
    return v8;
end;
v5.id = function(v9) --[[ Line: 22 ]] --[[ Name: id ]]
    -- upvalues: v4 (copy)
    return v4(v9.str);
end;
v5.new = function(v10, v11, v12) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        str = v10, 
        name = v10, 
        range = v11, 
        scriptInstance = v12
    }, v5));
end;
return v5;
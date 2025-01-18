local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.findAllInServices);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    for _, v5 in (v1(function(v3) --[[ Line: 6 ]] --[[ Name: isScript ]]
        return v3:IsA("LuaSourceContainer");
    end)) do
        v2:RemoveScriptBackupChunks(v5);
    end;
end;
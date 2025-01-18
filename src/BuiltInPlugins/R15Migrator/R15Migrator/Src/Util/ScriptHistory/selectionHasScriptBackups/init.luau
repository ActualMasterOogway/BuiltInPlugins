local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    for _, v5 in v2 do
        local v6 = v3:getScriptInstanceFromGUID(v5.scriptId);
        if not v1:HasScriptBackup(v6) then
            return false;
        end;
    end;
    return true;
end;
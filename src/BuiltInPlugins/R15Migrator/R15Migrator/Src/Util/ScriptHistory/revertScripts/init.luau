local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v5 = {};
    local v6 = {};
    for _, v8 in v2 do
        local v9 = v3:getScriptInstanceFromGUID(v8);
        local l_v1_ScriptBackupChunks_0 = v1:GetScriptBackupChunks(v9);
        if l_v1_ScriptBackupChunks_0 and v1:DidSourceChange(v9, l_v1_ScriptBackupChunks_0) then
            v5[v8] = true;
            v6[v8] = l_v1_ScriptBackupChunks_0;
        end;
    end;
    local v11 = next(v6);
    for v12, v13 in v6 do
        local v14 = v3:getScriptInstanceFromGUID(v12);
        v3:setRevertedScriptSource(v12);
        v1:ReplaceWithChunk(v14, v13[1]);
        if #v13 > 1 then
            for v15 = 2, #v13 do
                v1:AppendChunk(v14, v13[v15]);
            end;
        end;
        if v4 then
            v4(v12);
        end;
        if v12 ~= v11 then
            v3:closeScriptIfOpen(v12);
        end;
    end;
    if v11 then
        v3:closeScriptIfOpen(v11);
    end;
    return v5;
end;
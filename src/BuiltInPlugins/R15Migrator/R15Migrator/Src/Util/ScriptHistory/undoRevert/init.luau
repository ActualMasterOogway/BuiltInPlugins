local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
return function(v2, v3, v4) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v5 = v2[1];
    for _, v7 in v2 do
        local v8 = v3:getRevertedScriptSource(v7);
        local v9 = v3:getScriptInstanceFromGUID(v7);
        local v10 = v1:SplitIntoChunks(v8);
        if #v10 ~= 0 then
            v1:ReplaceWithChunk(v9, v10[1]);
            for v11 = 2, #v10 do
                v1:AppendChunk(v9, v10[v11]);
            end;
            if v4 then
                v4(v7);
            end;
            if v7 ~= v5 then
                v3:closeScriptIfOpen(v7);
            end;
        end;
    end;
    if v5 then
        v3:closeScriptIfOpen(v5);
    end;
end;
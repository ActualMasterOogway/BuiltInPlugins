local l_HttpService_0 = game:GetService("HttpService");
local v1 = {
    Npcs = {}
};
v1.AddNpc = function(v2) --[[ Line: 7 ]] --[[ Name: AddNpc ]]
    -- upvalues: l_HttpService_0 (copy), v1 (copy)
    local v3 = l_HttpService_0:GenerateGUID();
    v1.SetNpcWithId(v2, v3);
    return v3;
end;
v1.SetNpcWithId = function(v4, v5) --[[ Line: 13 ]] --[[ Name: SetNpcWithId ]]
    -- upvalues: v1 (copy)
    v1.Npcs[v5] = v4;
end;
v1.GetNpcFromId = function(v6) --[[ Line: 17 ]] --[[ Name: GetNpcFromId ]]
    -- upvalues: v1 (copy)
    return v1.Npcs[v6];
end;
v1.Reset = function() --[[ Line: 21 ]] --[[ Name: Reset ]]
    -- upvalues: v1 (copy)
    v1.Npcs = {};
end;
return v1;
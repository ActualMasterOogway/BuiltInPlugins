local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: DEPRECATED_RemoveHandlerFromNetworkData ]]
    local v4 = table.clone(v2);
    for v5, v6 in v2 do
        for v7, v8 in v6.pages do
            for v9, v10 in v8 do
                if v3(v10) then
                    table.remove(v4[v5].pages[v7], v9);
                    local v11 = v4[v5];
                    v11.targetResults = v11.targetResults - 1;
                    return v4;
                end;
            end;
        end;
    end;
    return v4;
end;
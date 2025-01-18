local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_append_0 = require(l_script_FirstAncestor_0.Packages.Dash).append;
return function(v2, v3) --[[ Line: 10 ]]
    -- upvalues: l_append_0 (copy)
    local v4 = {
        v2
    };
    local v5, v6 = next(v4);
    while true do
        if v5 then
            for _, v8 in v6:GetStatuses() do
                if v8.Level == v3.rawValue() then
                    return v6;
                end;
            end;
            v4 = l_append_0(v4, v6:GetChildren());
            local v9, v10 = next(v4, v5);
            v5 = v9;
            v6 = v10;
        else
            return nil;
        end;
    end;
end;
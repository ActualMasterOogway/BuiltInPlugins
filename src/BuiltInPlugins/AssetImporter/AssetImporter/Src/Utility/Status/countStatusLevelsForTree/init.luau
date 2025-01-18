local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.Status.getStatusLevelCounts);
return function(v2) --[[ Line: 18 ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    local function v4(v5, v6) --[[ Line: 20 ]] --[[ Name: getStatusCountRecurse ]]
        -- upvalues: v4 (copy), v1 (ref)
        local v7 = 0;
        local v8 = 0;
        for _, v10 in v5:GetChildren() do
            v4(v10, v6);
            local v11 = v6[v10];
            v7 = v7 + (v11.errors + v11.descErrors);
            v8 = v8 + (v11.warnings + v11.descWarnings);
        end;
        local l_v5_Statuses_0 = v5:GetStatuses();
        local v13 = v1(l_v5_Statuses_0);
        v6[v5] = {
            errors = v13.errors, 
            warnings = v13.warnings, 
            descErrors = v7, 
            descWarnings = v8
        };
    end;
    v4(v2, v3);
    return v3;
end;
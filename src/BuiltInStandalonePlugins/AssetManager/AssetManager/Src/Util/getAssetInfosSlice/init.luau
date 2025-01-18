local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2, v3, v4) --[[ Line: 9 ]] --[[ Name: getAssetInfosSlice ]]
    local v5 = math.min(v3, v4);
    local v6 = math.max(v3, v4);
    if v5 < 1 or #v2 < v5 then
        return {};
    elseif v6 < 1 or #v2 < v6 then
        return {};
    else
        local v7 = {};
        for v8 = v5, v6 do
            table.insert(v7, v2[v8].AssetId);
        end;
        return v7;
    end;
end;
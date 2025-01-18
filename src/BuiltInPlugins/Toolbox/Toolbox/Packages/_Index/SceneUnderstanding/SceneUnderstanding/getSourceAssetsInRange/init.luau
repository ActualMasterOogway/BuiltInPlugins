local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.findSourceAssetsFromDescendant);
local v2 = require(l_script_FirstAncestor_0.getSourceAssetsFromDescendants);
local v3 = require(l_script_FirstAncestor_0.options.RangeQueryOptions);
return function(v4, v5) --[[ Line: 29 ]] --[[ Name: getSourceAssetsInRange ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v6 = {};
    local v7 = v3.new(v5);
    for _, v9 in workspace:GetPartBoundsInRadius(v4, v7.maxDistance) do
        if v9.SourceAssetId > 0 or #v1(v9) > 0 then
            table.insert(v6, v9);
        end;
    end;
    return v2(v6);
end;
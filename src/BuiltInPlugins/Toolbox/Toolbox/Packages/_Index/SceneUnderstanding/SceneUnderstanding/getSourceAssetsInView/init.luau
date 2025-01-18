local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.queryViewport);
local v2 = require(l_script_FirstAncestor_0.findSourceAssetsFromDescendant);
local v3 = require(l_script_FirstAncestor_0.getSourceAssetsFromDescendants);
local _ = require(l_script_FirstAncestor_0.options.ViewportQueryOptions);
return function(v5, v6) --[[ Line: 61 ]] --[[ Name: getSourceAssetsInView ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v9 = v1(v5, function(v7) --[[ Line: 62 ]]
        -- upvalues: v2 (ref)
        local v8 = true;
        if v7.SourceAssetId <= 0 then
            v8 = #v2(v7) > 0;
        end;
        return v8;
    end, v6);
    return v3(v9);
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactSceneUnderstanding);
local v4 = require(l_script_FirstAncestor_0.Core.Util.findFirstAncestorSourceAsset);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local function v14(v7, v8) --[[ Line: 12 ]] --[[ Name: mapProperty ]]
    local v9 = {};
    for _, v11 in v7 do
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
            -- upvalues: v11 (copy), v8 (copy)
            return v11[v8];
        end);
        if l_status_0 then
            table.insert(v9, l_result_0);
        end;
    end;
    return v9;
end;
return function() --[[ Line: 39 ]] --[[ Name: useContextualAssets ]]
    -- upvalues: v3 (copy), l_useCallback_0 (copy), v1 (copy), v4 (copy), l_useMemo_0 (copy), v14 (copy)
    local v15 = v3.useAssetsInView();
    local v16 = v3.useAssetsInRange();
    local v19 = l_useCallback_0(function(v17) --[[ Line: 50 ]]
        -- upvalues: v1 (ref), v4 (ref)
        return v1.List.filter(v17, function(v18) --[[ Line: 51 ]]
            -- upvalues: v4 (ref)
            return v4(v18) == nil;
        end);
    end, {});
    local v21 = l_useMemo_0(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy), v15 (copy), v14 (ref)
        local v20 = v19(v15);
        return (v14(v20, "SourceAssetId"));
    end, {
        v15
    });
    local v23 = l_useMemo_0(function() --[[ Line: 61 ]]
        -- upvalues: v19 (copy), v16 (copy), v14 (ref)
        local v22 = v19(v16);
        return (v14(v22, "SourceAssetId"));
    end, {
        v16
    });
    return (l_useMemo_0(function() --[[ Line: 66 ]]
        -- upvalues: v21 (copy), v23 (copy)
        return {
            assetsInCameraViewport = v21, 
            assetsInCameraVicinity = v23
        };
    end, {
        v21, 
        v23
    }));
end;
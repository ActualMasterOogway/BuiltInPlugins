local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.SceneUnderstanding);
local v4 = require(l_script_FirstAncestor_0.SceneAnalysisContext);
local v5 = require(l_script_FirstAncestor_0.useTimer);
local v6 = require(l_script_FirstAncestor_0.useCurrentCamera);
local v7 = require(l_script_FirstAncestor_0.useCameraState);
local v8 = require(l_script_FirstAncestor_0.enums);
local l_getSourceAssetsInView_0 = v3.getSourceAssetsInView;
local l_getSourceAssetsInRange_0 = v3.getSourceAssetsInRange;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local v14 = {
    pollingSeconds = 1e999
};
return function(v15) --[[ Line: 86 ]] --[[ Name: SceneAnalysisProvider ]]
    -- upvalues: v1 (copy), v14 (copy), l_useState_0 (copy), v6 (copy), v7 (copy), l_useCallback_0 (copy), l_getSourceAssetsInView_0 (copy), l_getSourceAssetsInRange_0 (copy), v5 (copy), l_useEffect_0 (copy), v8 (copy), v2 (copy), v4 (copy)
    local v16 = v1.Dictionary.join(v14, v15);
    local v17, v18 = l_useState_0({});
    local v19, v20 = l_useState_0({});
    local v21 = v6();
    local v22 = v7(v21);
    local v27 = l_useCallback_0(function(v23, v24) --[[ Line: 93 ]]
        if #v24 == #v23 then
            for _, v26 in v23 do
                if not table.find(v24, v26) then
                    return true;
                end;
            end;
            return false;
        else
            return true;
        end;
    end, {});
    local v32 = l_useCallback_0(function() --[[ Line: 107 ]]
        -- upvalues: l_getSourceAssetsInView_0 (ref), v21 (copy), v16 (copy), v18 (copy), v27 (copy), l_getSourceAssetsInRange_0 (ref), v20 (copy)
        local v28 = l_getSourceAssetsInView_0(v21, v16.viewportQueryOptions);
        v18(function(v29) --[[ Line: 109 ]]
            -- upvalues: v27 (ref), v28 (copy)
            if v27(v29, v28) then
                return v28;
            else
                return v29;
            end;
        end);
        local v30 = l_getSourceAssetsInRange_0(v21.CFrame.Position, v16.rangeQueryOptions);
        v20(function(v31) --[[ Line: 114 ]]
            -- upvalues: v27 (ref), v30 (copy)
            if v27(v31, v30) then
                return v30;
            else
                return v31;
            end;
        end);
    end, {
        v21, 
        v16.viewportQueryOptions, 
        v16.rangeQueryOptions
    });
    v5(v16.pollingSeconds, v32);
    l_useEffect_0(function() --[[ Line: 125 ]]
        -- upvalues: v32 (copy)
        local v34 = workspace.DescendantAdded:Connect(function(v33) --[[ Line: 126 ]]
            -- upvalues: v32 (ref)
            if v33.SourceAssetId > 0 then
                v32();
            end;
        end);
        v32();
        return function() --[[ Line: 134 ]]
            -- upvalues: v34 (copy)
            v34:Disconnect();
        end;
    end, {
        v32
    });
    l_useEffect_0(function() --[[ Line: 139 ]]
        -- upvalues: v22 (copy), v8 (ref), v32 (copy)
        if v22 == v8.CameraState.Idle then
            v32();
        end;
    end, {
        v22
    });
    return v2.createElement(v4.Provider, {
        value = {
            assetsInView = v17, 
            assetsInRange = v19
        }
    }, v16.children);
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.SceneAnalysisContext);
return function() --[[ Line: 20 ]] --[[ Name: useAssetsInRange ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2).assetsInRange;
end;
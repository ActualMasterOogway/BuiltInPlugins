local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v5 = require(l_Hooks_0.useTerrain);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v6.Category;
local l_Tool_0 = v6.Tool;
local l_TransformMode_0 = v6.TransformMode;
local l_TransformSettings_0 = v6.TransformSettings;
local l_CoreGui_0 = game:GetService("CoreGui");
return function(v12, v13, v14, v15) --[[ Line: 18 ]] --[[ Name: useLines ]]
    -- upvalues: l_useState_0 (copy), v5 (copy), l_useEffect_0 (copy), l_Tool_0 (copy), l_Category_0 (copy), l_TransformSettings_0 (copy), l_TransformMode_0 (copy), l_CoreGui_0 (copy)
    local v16, v17 = l_useState_0({});
    local v18 = v5();
    l_useEffect_0(function() --[[ Line: 22 ]]
        -- upvalues: v15 (copy), v12 (copy), l_Tool_0 (ref), v13 (copy), l_Category_0 (ref), l_TransformSettings_0 (ref), l_TransformMode_0 (ref), v17 (copy), l_CoreGui_0 (ref), v18 (copy), v14 (copy)
        if v15 then
            if v12 == l_Tool_0.Transform then
                local v19 = v13[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
                local v20 = nil;
                if v19 == l_TransformMode_0.Paste then
                    v20 = v13[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBuffer];
                elseif v19 == l_TransformMode_0.Duplicate or v19 == l_TransformMode_0.Import then
                    v20 = v13[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegion];
                end;
                if not v20 then
                    v17({});
                    return;
                else
                    v20.Parent = l_CoreGui_0;
                    v17(v20:GetRegionWireframe());
                    return function() --[[ Line: 42 ]]
                        -- upvalues: v20 (ref)
                        v20.Parent = nil;
                    end;
                end;
            else
                v17(v18:GetTerrainWireframe(v14.Transform, v14.Size));
                return;
            end;
        else
            v17({});
            return;
        end;
    end, {
        v12, 
        v14, 
        v15
    });
    return v16;
end;
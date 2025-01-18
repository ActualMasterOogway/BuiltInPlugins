local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v2 = require(l_script_FirstAncestor_0.Core.Util.AssetConfigConstants);
local v3 = require(l_script_FirstAncestor_0.Core.Util.AssetConfigUtil);
local v4 = {};
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v4.removeAllUGCBUndleUnknownMeshParts = function(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: removeAllUGCBUndleUnknownMeshParts ]]
        -- upvalues: v3 (copy), v2 (copy)
        if v6 == nil or v7 == nil then
            return;
        elseif v3.isUGCBundleType(v6) == false then
            return;
        else
            local v8 = v3.getAllowedAssetTypesByBundleType(v7, v6);
            for _, v10 in pairs(v5:GetChildren()) do
                if v8[v2.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v10.Name]] == nil and v10:IsA("MeshPart") then
                    v10:Destroy();
                end;
            end;
            v3.sanitizeForValidation(v5);
            return;
        end;
    end;
end;
return v4;
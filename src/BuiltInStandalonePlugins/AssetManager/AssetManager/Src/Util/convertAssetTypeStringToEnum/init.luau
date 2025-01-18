local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrFetchLeafAssets);
convertAssetTypeStringToEnum = function(v3) --[[ Line: 6 ]] --[[ Name: convertAssetTypeStringToEnum ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3 == "ASSET_TYPE_MODEL" then
        return v1.AssetType.Model;
    elseif v3 == "ASSET_TYPE_DECAL" then
        return v1.AssetType.Decal;
    elseif v3 == "ASSET_TYPE_AUDIO" then
        return v1.AssetType.Audio;
    elseif v3 == "ASSET_TYPE_ANIMATION" then
        return v1.AssetType.Animation;
    elseif v3 == "ASSET_TYPE_PLUGIN" then
        return v1.AssetType.Plugin;
    elseif v3 == "ASSET_TYPE_MESH_PART" then
        return v1.AssetType.MeshPart;
    elseif v3 == "ASSET_TYPE_VIDEO" then
        return v1.AssetType.Video;
    elseif v3 == "ASSET_TYPE_FONT" then
        return v1.AssetType.FontFamily;
    elseif v3 == "ASSET_TYPE_IMAGE" then
        if v2() then
            return v1.AssetType.Image;
        else
            return nil;
        end;
    elseif v3 == "ASSET_TYPE_MESH" then
        if v2() then
            return v1.AssetType.Mesh;
        else
            return nil;
        end;
    elseif v3 == "ASSET_TYPE_PACKAGE" then
        return v1.AssetType.Package;
    else
        return nil;
    end;
end;
return convertAssetTypeStringToEnum;
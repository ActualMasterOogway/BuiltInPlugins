local l_AssetService_0 = game:GetService("AssetService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v5 = game:DefineFastFlag("DebugEmergencyDisableSkinToneAlphaDetection", false);
local function _(v6) --[[ Line: 15 ]] --[[ Name: getTexture ]]
    if v6.TextureID ~= "" then
        return v6.TextureID;
    else
        local l_SurfaceAppearance_0 = v6:FindFirstChildWhichIsA("SurfaceAppearance");
        if l_SurfaceAppearance_0 ~= nil and l_SurfaceAppearance_0.ColorMap ~= "" then
            return l_SurfaceAppearance_0.ColorMap;
        else
            return nil;
        end;
    end;
end;
return function(v9) --[[ Line: 28 ]] --[[ Name: skinToneAvailableAsync ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), l_AssetService_0 (copy)
    assert(v4(), "FFlagAvatarPreviewerSkinToneAlphaDetection not available");
    local v10 = {};
    for _, v12 in v2.LIMBS do
        local l_v9_FirstChild_0 = v9:FindFirstChild(v12);
        local v14 = false;
        if l_v9_FirstChild_0 ~= nil then
            v14 = l_v9_FirstChild_0:IsA("MeshPart");
        end;
        assert(v14, "Couldn't find limb part");
        local v15;
        if l_v9_FirstChild_0.TextureID ~= "" then
            v15 = l_v9_FirstChild_0.TextureID;
        else
            v14 = l_v9_FirstChild_0:FindFirstChildWhichIsA("SurfaceAppearance");
            v15 = if v14 ~= nil and v14.ColorMap ~= "" then v14.ColorMap else nil;
        end;
        if v15 == nil then
            return true;
        else
            assert(v15 ~= nil, v2.LUAU_ANALYZE_ERROR);
            if not v10[v15] then
                v10[v15] = true;
                if v5 then
                    return true;
                elseif l_AssetService_0:CheckTextureAlphaAsync(v15) then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
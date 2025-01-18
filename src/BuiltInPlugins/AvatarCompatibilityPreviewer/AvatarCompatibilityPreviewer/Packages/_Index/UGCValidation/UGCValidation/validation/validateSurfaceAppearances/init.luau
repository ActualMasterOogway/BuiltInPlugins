local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.checkForProxyWrap);
local v4 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v6, v7) --[[ Line: 19 ]] --[[ Name: validateSurfaceAppearances ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v1 (copy)
    local v8 = if v5() then v7.allowEditableInstances else false;
    local l_v6_Descendants_0 = v6:GetDescendants();
    table.insert(l_v6_Descendants_0, v6);
    local v10 = v4.new();
    for _, v12 in pairs(l_v6_Descendants_0) do
        if v12:IsA("MeshPart") and (not v8 or not v3(v12)) then
            local v13 = v12.TextureID ~= "";
            if v8 and not v13 then
                local l_TextureContent_0 = v12.TextureContent;
                v13 = l_TextureContent_0.Uri ~= nil and l_TextureContent_0.Uri ~= "" or l_TextureContent_0.Object ~= nil;
            end;
            local l_SurfaceAppearance_0 = v12:FindFirstChildWhichIsA("SurfaceAppearance");
            if v13 then
                if l_SurfaceAppearance_0 then
                    v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MeshPartHasTexture, nil, v7);
                    v10:updateReasons(false, {
                        (("TextureID and SurfaceAppearance are both defined for MeshPart (%*). Publishing will only use SurfaceApperance."):format((v12:GetFullName())))
                    });
                end;
            elseif not l_SurfaceAppearance_0 then
                v1.reportFailure(v1.ErrorType.validateSurfaceAppearances_MissingSurfaceAppearance, nil, v7);
                v10:updateReasons(false, {
                    (("(%*) has an empty TextureID and no child SurfaceAppearance instance. You need to define at least one of them."):format((v12:GetFullName())))
                });
            end;
        end;
    end;
    return v10:getFinalResults();
end;
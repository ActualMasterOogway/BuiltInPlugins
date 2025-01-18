local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v1 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v5 = require(l_Parent_0.Analytics);
return function(v6, v7, v8, v9, v10) --[[ Line: 17 ]] --[[ Name: validateThumbnailConfiguration ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (copy), l_UGCValidationService_0 (copy)
    local l_ThumbnailConfiguration_0 = v6:FindFirstChild("ThumbnailConfiguration");
    if l_ThumbnailConfiguration_0 then
        local l_ThumbnailCameraTarget_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraTarget");
        if l_ThumbnailCameraTarget_0.Value ~= v7 then
            v5.reportFailure(v5.ErrorType.validateThumbnailConfiguration_InvalidTarget, nil, v10);
            return false, {
                string.format("Invalid target asset for thumbnail generation. Expected it to be '%s'.", v7:GetFullName())
            };
        elseif game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") and v1 then
            local l_CFrame_0 = l_ThumbnailCameraTarget_0.Value.CFrame;
            local v14 = l_CFrame_0 * l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraValue").Value;
            if v4() then
                if l_UGCValidationService_0:CheckEditableMeshInCameraFrustum(v8.editableMesh, v9, l_CFrame_0, v14) == false then
                    v5.reportFailure(v5.ErrorType.validateThumbnailConfiguration_OutsideView, nil, v10);
                    return false, {
                        string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", v8.fullName)
                    };
                end;
            elseif l_UGCValidationService_0:CheckMeshInCameraFrustum(v8.contentId, v9, l_CFrame_0, v14) == false then
                v5.reportFailure(v5.ErrorType.validateThumbnailConfiguration_OutsideView, nil, v10);
                return false, {
                    string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", v8.fullName)
                };
            end;
        end;
    end;
    return true;
end;
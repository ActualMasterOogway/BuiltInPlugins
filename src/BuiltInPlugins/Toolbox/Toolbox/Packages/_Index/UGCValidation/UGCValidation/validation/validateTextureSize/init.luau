local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v7 = require(l_Parent_0.Analytics);
local v8 = require(l_Parent_0.Constants);
return function(v9, v10, v11) --[[ Line: 16 ]] --[[ Name: validateTextureSize ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), v6 (copy), v5 (copy), l_UGCValidationService_0 (copy), v8 (copy)
    local v12 = tick();
    local l_isServer_0 = v11.isServer;
    if v3() then
        if not v9.editableImage then
            if v10 then
                return true;
            else
                v7.reportFailure(v7.ErrorType.validateTextureSize_InvalidTextureId, nil, v11);
                return false, {
                    string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", v9.fullName)
                };
            end;
        end;
    elseif v9.contentId == "" then
        if v10 then
            return true;
        else
            v7.reportFailure(v7.ErrorType.validateTextureSize_InvalidTextureId, nil, v11);
            return false, {
                string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", v9.fullName)
            };
        end;
    end;
    if v2() then
        local v14 = nil;
        local v15 = nil;
        if v3() and v6() then
            local v16, v17 = v5(function() --[[ Line: 68 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v9 (copy)
                return l_UGCValidationService_0:ValidateEditableImageSize(v9.editableImage);
            end, v11);
            v14 = v16;
            v15 = v17;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v9 (copy)
                return l_UGCValidationService_0:ValidateTextureSize(v9.contentId);
            end);
            v14 = l_status_0;
            v15 = l_result_0;
        end;
        if not v14 then
            if l_isServer_0 ~= nil and l_isServer_0 then
                error("Failed to execute validateTextureSize check");
            end;
            v7.reportFailure(v7.ErrorType.validateTextureSize_FailedToExecute, nil, v11);
            return false, {
                "Failed to execute validateTextureSize check"
            };
        elseif not v15 then
            v7.reportFailure(v7.ErrorType.validateTextureSize_TextureTooBig, nil, v11);
            return false, {
                "Your textures exceeds the max texture size limit for UGC upload requirements."
            };
        end;
    else
        local v20 = nil;
        local v21 = nil;
        if v3() and v6() then
            local v22, v23 = v5(function() --[[ Line: 95 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v9 (copy)
                return l_UGCValidationService_0:GetEditableImageSize(v9.editableImage);
            end, v11);
            v20 = v22;
            v21 = v23;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 99 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v9 (copy)
                return l_UGCValidationService_0:GetTextureSize(v9.contentId);
            end);
            v20 = l_status_1;
            v21 = l_result_1;
        end;
        if not v20 then
            if l_isServer_0 ~= nil and l_isServer_0 then
                error(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", v9.fullName));
            end;
            v7.reportFailure(v7.ErrorType.validateTextureSize_FailedToLoadTexture, nil, v11);
            return false, {
                string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", v9.fullName)
            };
        elseif v21.X > v8.MAX_TEXTURE_SIZE or v21.Y > v8.MAX_TEXTURE_SIZE then
            v7.reportFailure(v7.ErrorType.validateTextureSize_TextureTooBig, nil, v11);
            return false, {
                string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px. You need to reduce the texture resolution", v21.X, v21.Y, v9.fullName, v8.MAX_TEXTURE_SIZE, v8.MAX_TEXTURE_SIZE)
            };
        end;
    end;
    v7.recordScriptTime(script.Name, v12, v11);
    return true;
end;
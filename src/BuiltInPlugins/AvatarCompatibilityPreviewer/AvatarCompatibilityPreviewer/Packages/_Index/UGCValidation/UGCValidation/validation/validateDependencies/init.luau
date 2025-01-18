local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsModeration);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationAnalytics);
local v4 = game:DefineFastFlag("ValidateUserAndUniverseNoModeration", false);
local v5 = game:DefineFastFlag("NoStudioOwnershipCheck", false);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v7 = require(l_Parent_0.Analytics);
local v8 = require(l_Parent_0.Constants);
local v9 = require(l_Parent_0.util.ParseContentIds);
local v10 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v11 = require(l_Parent_0.util.getAssetCreationDetailsRCC);
local _ = require(l_Parent_0.util.Types);
local v13 = require(l_Parent_0.validation.validateModeration);
local v14 = require(l_Parent_0.validation.validateCanLoad);
local v15 = require(l_Parent_0.validation.validateAssetCreator);
local function v20(v16, v17) --[[ Line: 32 ]] --[[ Name: validateExistance ]]
    -- upvalues: v14 (copy)
    for _, v19 in pairs(v16) do
        if not v14(v19.instance[v19.fieldName], v17) then
            error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v19.instance.Name));
        end;
    end;
end;
local v21 = {
    MODERATION_STATE_REVIEWING = {
        MODERATION_STATE_REVIEWING = true, 
        Reviewing = true
    }, 
    MODERATION_STATE_APPROVED = {
        MODERATION_STATE_APPROVED = true, 
        Approved = true
    }
};
local function v28(v22, v23, v24, v25, v26, v27) --[[ Line: 53 ]] --[[ Name: validateCreatorId ]]
    -- upvalues: v7 (copy)
    if not v22[tonumber(v23)] then
        v7.reportFailure(v7.ErrorType.validateDependencies_IsRestrictedUserId, nil, v27);
        return false, {
            (("%*.%* ( %* ) is not owned by the current user. You can only validate assets that you or a group you belong to owns."):format(v24:GetFullName(), v25, v26))
        };
    else
        return true;
    end;
end;
local function v34(v29, v30, v31, v32, v33) --[[ Line: 71 ]] --[[ Name: validateModerationState ]]
    -- upvalues: v21 (copy), v7 (copy)
    if v21.MODERATION_STATE_REVIEWING[v29] then
        v7.reportFailure(v7.ErrorType.validateDependencies_IsReviewing, nil, v33);
        error("Failed to load asset {instance:GetFullName()}.{fieldName} ( {id} ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.");
    end;
    if not v21.MODERATION_STATE_APPROVED[v29] then
        v7.reportFailure(v7.ErrorType.validateDependencies_IsNotApproved, nil, v33);
        return false, {
            (("%*.%* ( %* ) is not owned by the current user. You can only validate assets that you or a group you belong to owns."):format(v30:GetFullName(), v31, v32))
        };
    else
        return true;
    end;
end;
local function v49(v35, v36, v37) --[[ Line: 100 ]] --[[ Name: validateModerationRCC ]]
    -- upvalues: v10 (copy), v11 (copy), v3 (copy), v28 (copy), v34 (copy), v21 (copy)
    if not v35 or #v35 == 0 then
        return true;
    else
        local v38 = {};
        for _, v40 in ipairs(v35) do
            v38[tonumber(v40.id)] = true;
        end;
        local v41 = v10.new();
        for v42, v43 in pairs(v36) do
            local v44, v45 = v11(v42);
            if not v44 then
                error("Failed to load asset");
            end;
            local l_creator_0 = v45.creationContext.creator;
            local v47 = if l_creator_0.userId then l_creator_0.userId else l_creator_0.groupId;
            if v3() then
                v41:updateReasons(v28(v38, v47, v43.instance, v43.fieldName, v42, v37));
                v41:updateReasons(v34(v45.moderationResult.moderationState, v43.instance, v43.fieldName, v42, v37));
            else
                local v48 = string.format("%s.%s ( %s ) is not owned by the developer", v43.instance:GetFullName(), v43.fieldName, v42);
                v41:updateReasons(v38[tonumber(v47)], {
                    v48
                });
                if v21.MODERATION_STATE_REVIEWING[v45.moderationResult.moderationState] then
                    error("Asset is under review");
                end;
                v41:updateReasons(v21.MODERATION_STATE_APPROVED[v45.moderationResult.moderationState], {
                    v48
                });
            end;
        end;
        return v41:getFinalResults();
    end;
end;
local function v52(v50, v51) --[[ Line: 166 ]] --[[ Name: validateAssetCreatorsRCC ]]
    -- upvalues: v15 (copy)
    assert(v51.isServer, "isServer must be true for validateAssetCreatorsRCC");
    return v15(v50, v51);
end;
return function(v53, v54) --[[ Line: 171 ]] --[[ Name: validateDependencies ]]
    -- upvalues: v6 (copy), v9 (copy), v8 (copy), v7 (copy), v20 (copy), v10 (copy), v5 (copy), l_RunService_0 (copy), v4 (copy), v52 (copy), v49 (copy), v2 (copy), v13 (copy)
    local v55 = tick();
    local v56 = if v54 then v54.isServer else nil;
    local v57 = if v54 then v54.allowUnreviewedAssets else nil;
    local v58 = if v6() then v54.allowEditableInstances else false;
    local v59 = if v54 then v54.restrictedUserIds else nil;
    local v60 = if v54 then v54.universeId else nil;
    local v61 = {};
    local v62, v63 = v9.parseWithErrorCheck({}, v61, v53, nil, v8.CONTENT_ID_REQUIRED_FIELDS, v54);
    if not v62 then
        v7.reportFailure(v7.ErrorType.validateDependencies_ParseFailure, nil, v54);
        return false, v63;
    else
        if v56 and not v58 then
            v20(v61, v54);
        end;
        local v64 = v10.new();
        if (not v5 or v5 and not l_RunService_0:IsStudio()) and v56 then
            if v4 and v60 then
                v64:updateReasons(v52(v61, v54));
            else
                v64:updateReasons(v49(v59, v61, v54));
            end;
        end;
        if not v2() then
            local v65 = not v56;
            if v57 then
                v65 = false;
            end;
            if v65 then
                v64:updateReasons(v13(v53, v59, v54));
            end;
        end;
        if v54 then
            v7.recordScriptTime(script.Name, v55, v54);
        end;
        return v64:getFinalResults();
    end;
end;
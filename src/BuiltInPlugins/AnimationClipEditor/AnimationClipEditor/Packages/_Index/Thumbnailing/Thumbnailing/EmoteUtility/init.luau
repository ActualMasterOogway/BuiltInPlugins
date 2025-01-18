local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_InsertService_0 = game:GetService("InsertService");
local v2 = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056");
local v3 = game:DefineFastFlag("EmoteUtilityFixMoodApplication2", false);
local v4 = game:DefineFastFlag("EmoteUtilityTweaks3", false);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = {
    FFlagEmoteUtilityFixMoodApplication = v3, 
    FFlagEmoteUtilityTweaks = v4, 
    FallbackKeyframeSequenceAssetId = v2, 
    debugLoadAssetsFromFiles = false, 
    mapAssetIdToFileName = nil, 
    FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. v2
};
local v7 = {};
local function _() --[[ Line: 76 ]] --[[ Name: clearJointBlacklist ]]
    -- upvalues: v7 (ref)
    v7 = {};
end;
local function _(v9) --[[ Line: 80 ]] --[[ Name: blacklistJoint ]]
    -- upvalues: v7 (ref)
    v7[v9] = true;
end;
local function _(v11) --[[ Line: 84 ]] --[[ Name: jointIsBlacklisted ]]
    -- upvalues: v7 (ref)
    if not v7[v11] then
        return false;
    else
        return true;
    end;
end;
local function _(v13, v14) --[[ Line: 91 ]] --[[ Name: getCameraOffset ]]
    local l_X_0 = v14.X;
    local l_Y_0 = v14.Y;
    local l_Z_0 = v14.Z;
    local v18 = math.sqrt(l_X_0 ^ 2 + l_Y_0 ^ 2 + l_Z_0 ^ 2);
    local v19 = 1 / math.tan(math.rad(v13) / 2);
    return v18 / 2 * v19;
end;
local function _() --[[ Line: 101 ]] --[[ Name: isOnRCC ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 107 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    return l_status_0 and l_result_0;
end;
local _ = function(v24, v25) --[[ Line: 117 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local _ = nil;
    local _ = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 107 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v30 = (l_status_1 and l_result_1 and "RCC" or "Client") .. "_" .. v24 .. "_" .. (v25 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v30);
end;
local function v49(v32) --[[ Line: 140 ]] --[[ Name: getAnimationAndIsIdle ]]
    -- upvalues: v6 (copy), l_RbxAnalyticsService_0 (copy)
    local v33 = true;
    if typeof(v32) ~= "number" then
        v33 = typeof(v32) == "string";
    end;
    assert(v33, "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string");
    local v34 = nil;
    v33 = nil;
    local v35 = nil;
    if typeof(v32) == "number" then
        local v36 = nil;
        local v37, v38 = v6.LoadAsset(v32);
        v33 = v37;
        v36 = v38;
        if v33 and v36 then
            v34 = v36:GetChildren()[1];
        end;
        v35 = "EmoteUtility_LoadAsset";
    else
        local v39 = nil;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 159 ]]
            -- upvalues: v32 (copy)
            return game:GetObjects(v32)[1];
        end);
        v33 = l_status_2;
        v39 = l_result_2;
        if v33 and v39 then
            v34 = v39;
        end;
        v35 = "EmoteUtility_GetObjects";
    end;
    local l_v35_0 = v35;
    local l_v33_0 = v33;
    local v44 = nil;
    local v45 = nil;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 107 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v48 = (l_status_3 and l_result_3 and "RCC" or "Client") .. "_" .. l_v35_0 .. "_" .. (l_v33_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v48);
    if not v33 or not v34 then
        l_v35_0 = nil;
        v44, v45 = pcall(function() --[[ Line: 107 ]]
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_v35_0 = v44 and v45 and "RCC" or "Client";
        l_v33_0 = v35 .. "_Failed";
        l_RbxAnalyticsService_0:SendEventDeferred(l_v35_0, "EmoteUtility_getPoseAsset", l_v33_0, {
            animationAssetIdOrUrl = v32
        });
        return nil, nil;
    else
        assert(v34, "animation is non-nil. Silence type checker.");
        l_v35_0 = false;
        if v34.ClassName == "Folder" then
            l_v35_0 = true;
            l_v33_0 = v34:FindFirstChild("Pose", true) or v34:FindFirstChild("pose", true);
            if l_v33_0 == nil then
                l_v33_0 = v34:FindFirstChild("Idle", true) or v34:FindFirstChild("idle", true);
            end;
            v34 = if l_v33_0 then l_v33_0:FindFirstChildWhichIsA("Animation", true) else v34:FindFirstChildWhichIsA("Animation", true);
        end;
        return v34, l_v35_0;
    end;
end;
local function v67(v50) --[[ Line: 212 ]] --[[ Name: getAnimationClipByAssetId ]]
    -- upvalues: v6 (copy), l_AnimationClipProvider_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v51 = nil;
    local v52 = nil;
    if v6.debugLoadAssetsFromFiles then
        local v53 = nil;
        for v54 in string.gmatch(v50, ".*id=([0-9]+)") do
            v53 = v54;
        end;
        assert(v53, "assetId should be non-nil");
        local v55 = tonumber(v53);
        assert(v55, "assetIdAsNumber should be non-nil");
        local v56 = nil;
        local v57, v58 = v6.LoadAsset(v55);
        v51 = v57;
        v56 = v58;
        if v51 and v56 then
            v52 = v56;
        end;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 229 ]]
            -- upvalues: l_AnimationClipProvider_0 (ref), v50 (copy)
            return l_AnimationClipProvider_0:GetAnimationClipAsync(v50);
        end);
        v51 = l_status_4;
        v52 = l_result_4;
    end;
    local l_v51_0 = v51;
    local _ = nil;
    local v63 = nil;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 107 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v66 = (l_status_5 and l_result_5 and "RCC" or "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (l_v51_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v66);
    if not v51 then
        l_v51_0 = nil;
        v63, v66 = pcall(function() --[[ Line: 107 ]]
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_v51_0 = v63 and v66 and "RCC" or "Client";
        l_RbxAnalyticsService_0:SendEventDeferred(l_v51_0, "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", {
            keyframeSequenceId = v50
        });
        return nil;
    else
        return v52;
    end;
end;
local function _(v68, v69, v70) --[[ Line: 256 ]] --[[ Name: trySetProperty ]]
    pcall(function() --[[ Line: 257 ]]
        -- upvalues: v68 (copy), v69 (copy), v70 (copy)
        v68[v69] = v70;
    end);
end;
local function v81(v72, v73, v74) --[[ Line: 265 ]] --[[ Name: applyControlsFolder ]]
    if not v73 then
        return;
    else
        assert(v73, "parentPose is non-nil. Silence type checker.");
        local l_v72_FirstChild_0 = v72:FindFirstChild(v73.Name);
        if not l_v72_FirstChild_0 then
            return;
        else
            local l_l_v72_FirstChild_0_FirstChild_0 = l_v72_FirstChild_0:FindFirstChild(v74.Name);
            if not l_l_v72_FirstChild_0_FirstChild_0 then
                return;
            else
                for _, v78 in v74:GetChildren() do
                    if v78:IsA("NumberPose") then
                        local l_Name_0 = v78.Name;
                        local l_Value_0 = v78.Value;
                        pcall(function() --[[ Line: 257 ]]
                            -- upvalues: l_l_v72_FirstChild_0_FirstChild_0 (copy), l_Name_0 (copy), l_Value_0 (copy)
                            l_l_v72_FirstChild_0_FirstChild_0[l_Name_0] = l_Value_0;
                        end);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v94(v82, v83) --[[ Line: 294 ]] --[[ Name: applyKeyframeInner ]]
    -- upvalues: v6 (copy), v7 (ref), v81 (copy)
    local function v84(v85, v86) --[[ Line: 295 ]] --[[ Name: recurApplyPoses ]]
        -- upvalues: v82 (copy), v6 (ref), v7 (ref), v81 (ref), v84 (copy)
        if v85 and v86:IsA("Pose") then
            local l_v82_FirstChild_0 = v82:FindFirstChild(v85.Name);
            local l_v82_FirstChild_1 = v82:FindFirstChild(v86.Name);
            local v89 = v6.GetMotor6DBetween(l_v82_FirstChild_0, l_v82_FirstChild_1);
            if v89 and not not not v7[v89] then
                assert(v89, "motor6d is non-nil. Silence type checker.");
                v89.Transform = v86.CFrame;
                v7[v89] = true;
            end;
        end;
        if v86:IsA("Folder") then
            v81(v82, v85, v86);
            return;
        else
            for _, v91 in v86:GetChildren() do
                v84(v86, v91);
            end;
            return;
        end;
    end;
    if v83 then
        for _, v93 in pairs(v83:GetPoses()) do
            v84(nil, v93);
        end;
    end;
end;
local function v100(v95, v96) --[[ Line: 330 ]] --[[ Name: getRotatedKeyframe ]]
    if not v96 or v96 == 0 then
        return v95;
    else
        assert(v96, "rotationDegrees is non-nil. Silence type checker.");
        local v97 = v95:Clone();
        local v98 = v97:GetPoses()[1];
        if v98 then
            local v99 = v98:GetSubPoses()[1];
            if v99 then
                v99.CFrame = v99.CFrame * CFrame.Angles(0, math.rad(v96), 0);
            end;
        end;
        return v97;
    end;
end;
local function v103(v101, v102) --[[ Line: 351 ]] --[[ Name: getRotationCFrame ]]
    if v101:IsA("EulerRotationCurve") then
        return v101:GetRotationAtTime(v102);
    elseif v101:IsA("RotationCurve") then
        return v101:GetValueAtTime(v102);
    else
        error("Unsupported rotation type:" .. v101.ClassName);
        return nil;
    end;
end;
local function v104(v105, v106) --[[ Line: 362 ]] --[[ Name: findAttachmentsRecur ]]
    -- upvalues: v104 (copy)
    for _, v108 in pairs(v105:GetChildren()) do
        if v108:IsA("Attachment") then
            v106[v108.Name] = v108;
        elseif not v108:IsA("Tool") and not v108:IsA("Accoutrement") then
            v104(v108, v106);
        end;
    end;
end;
local function _(v109) --[[ Line: 373 ]] --[[ Name: findAttachmentsInTool ]]
    -- upvalues: v104 (copy)
    local v110 = {};
    v104(v109, v110);
    return v110;
end;
local function _(v112) --[[ Line: 379 ]] --[[ Name: findAttachmentsInCharacter ]]
    -- upvalues: v104 (copy)
    local v113 = {};
    v104(v112, v113);
    return v113;
end;
local function _(v115, v116) --[[ Line: 385 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v115.Parent;
    l_Weld_0.Part1 = v116.Parent;
    l_Weld_0.C0 = v115.CFrame;
    l_Weld_0.C1 = v116.CFrame;
    l_Weld_0.Parent = v115.Parent;
    return l_Weld_0;
end;
local function v132(v119, v120, v121) --[[ Line: 395 ]] --[[ Name: attachToolToCharacter ]]
    -- upvalues: v104 (copy)
    local v122 = {};
    v104(v119, v122);
    local l_v122_0 = v122;
    local v124 = {};
    v104(v121, v124);
    v122 = v124;
    v124 = false;
    for _, v126 in pairs(v122) do
        local v127 = l_v122_0[v126.Name];
        if v127 then
            v124 = true;
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Part0 = v127.Parent;
            l_Weld_1.Part1 = v126.Parent;
            l_Weld_1.C0 = v127.CFrame;
            l_Weld_1.C1 = v126.CFrame;
            l_Weld_1.Parent = v127.Parent;
        end;
    end;
    if v124 then
        v121.Parent = v119;
        return;
    else
        v121.Parent = nil;
        local l_Handle_0 = v121:FindFirstChild("Handle");
        local l_Grip_0 = v121.Grip;
        if l_Handle_0 and l_Grip_0 then
            local l_RightGripAttachment_0 = l_v122_0.RightGripAttachment;
            if l_RightGripAttachment_0 then
                l_Handle_0.CFrame = l_RightGripAttachment_0.Parent.CFrame * l_RightGripAttachment_0.CFrame * l_Grip_0:Inverse();
            end;
        end;
        v120:EquipTool(v121);
        return;
    end;
end;
local function v140(v133, v134, v135, v136, v137, v138, v139) --[[ Line: 427 ]] --[[ Name: applyR15KeyframeWithTool ]]
    -- upvalues: v94 (copy), v132 (copy)
    if v139 then
        v94(v133, v139);
        v94(v133, v137);
    else
        v94(v133, v138);
        if v136 ~= nil then
            v94(v133, v137);
        end;
    end;
    v132(v133, v134, v135);
end;
local function v159(v141, v142, v143, v144) --[[ Line: 481 ]] --[[ Name: getMainThumbnailKeyframe ]]
    -- upvalues: v49 (copy), v6 (copy), v4 (copy), v67 (copy)
    local v145 = nil;
    local v146 = false;
    local v147 = nil;
    if v142 then
        v147 = v142;
        local v148, v149 = v49(v142);
        if v148 == nil then
            return nil, v146, v147;
        else
            assert(v148, "animation is non-nil. Silence type checker.");
            if not v149 then
                v146 = true;
            end;
            local v150 = v6.GetNumberValueWithDefault(v148, "ThumbnailKeyframe", nil);
            local v151 = v6.GetNumberValueWithDefault(v148, "ThumbnailTime", nil);
            local v152 = 0;
            if v143 then
                v152 = v6.GetNumberValueWithDefault(v148, "ThumbnailCharacterRotation", 0);
            end;
            local v153 = v6.GetAnimationClip(v148);
            if v153 then
                if v153:IsA("KeyframeSequence") then
                    return v6.GetThumbnailKeyframe(v150, v153, v152), v146, v147;
                elseif v153:IsA("CurveAnimation") then
                    return v6.GetThumbnailKeyframeFromCurve(v151, v153, v152), v146, v147;
                else
                    error("Unsupported Animation type:" .. v153.ClassName);
                    return v145, v146, v147;
                end;
            end;
        end;
    elseif not v4 or v144 then
        local l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = v6.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL;
        local l_Animate_0 = v141:FindFirstChild("Animate");
        if l_Animate_0 then
            local v156 = l_Animate_0:FindFirstChild("Pose") or l_Animate_0:FindFirstChild("pose");
            if v156 then
                local l_Animation_0 = v156:FindFirstChildOfClass("Animation");
                if l_Animation_0 then
                    l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = l_Animation_0.AnimationId;
                end;
            end;
        end;
        v147 = l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0;
        local v158 = v67(l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0);
        if v158 then
            if not v158:IsA("KeyframeSequence") then
                return nil, false, v147;
            else
                v145 = v158:GetKeyframes()[1];
            end;
        end;
    end;
    return v145, v146, v147;
end;
local function v167(v160) --[[ Line: 565 ]] --[[ Name: getMoodThumbnailKeyframe ]]
    -- upvalues: v49 (copy), v6 (copy)
    local v161 = nil;
    if not v160 then
        return nil;
    else
        assert(v160, "moodAssetId is non-nil. Silence type checker.");
        local v162, _ = v49(v160);
        if v162 == nil then
            return nil;
        else
            assert(v162, "animation is non-nil. Silence type checker.");
            local v164 = v6.GetNumberValueWithDefault(v162, "ThumbnailKeyframe", nil);
            local v165 = v6.GetNumberValueWithDefault(v162, "ThumbnailTime", nil);
            local v166 = v6.GetAnimationClip(v162);
            if v166 then
                if v166:IsA("KeyframeSequence") then
                    return (v6.GetThumbnailKeyframe(v164, v166, 0));
                elseif v166:IsA("CurveAnimation") then
                    return (v6.GetThumbnailKeyframeFromCurve(v165, v166, 0));
                else
                    error("Unsupported Animation type:" .. v166.ClassName);
                end;
            end;
            return v161;
        end;
    end;
end;
local function v178(v168, v169) --[[ Line: 613 ]] --[[ Name: getToolKeyframes ]]
    -- upvalues: v6 (copy)
    local v170 = nil;
    local v171 = nil;
    local l_Tool_0 = v168:FindFirstChildOfClass("Tool");
    if not l_Tool_0 then
        return nil, nil;
    else
        assert(l_Tool_0, "tool is non-nil. Silence type checker.");
        local v173 = false;
        if not v169 then
            v170 = l_Tool_0:FindFirstChild("ThumbnailPose");
            if v170 and v170:IsA("Keyframe") then
                v173 = true;
            end;
        end;
        if not v173 then
            v170 = nil;
            local l_Animate_1 = v168:FindFirstChild("Animate");
            if not l_Animate_1 then
                return nil, nil;
            else
                assert(l_Animate_1, "animateScript is non-nil. Silence type checker.");
                local l_toolnone_0 = l_Animate_1:FindFirstChild("toolnone");
                if not l_toolnone_0 then
                    return nil, nil;
                else
                    assert(l_toolnone_0, "toolNoneStringValue is non-nil. Silence type checker.");
                    local l_ToolNoneAnim_0 = l_toolnone_0:FindFirstChild("ToolNoneAnim");
                    if l_ToolNoneAnim_0 then
                        local v177 = v6.GetAnimationClip(l_ToolNoneAnim_0);
                        if not v177 then
                            return nil, nil;
                        else
                            assert(v177, "toolAnimationClip is non-nil. Silence type checker.");
                            assert(v177:IsA("KeyframeSequence"), "ToolNoneAnim must be a KeyframeSequence");
                            v171 = v6.GetThumbnailKeyframe(nil, v177, 0);
                            if not l_Tool_0:IsDescendantOf(v168) then
                                return nil, nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v170, v171;
    end;
end;
local function _(v179, v180, v181) --[[ Line: 687 ]] --[[ Name: DEPRECATED_doYieldingWorkToLoadPoseInfo ]]
    -- upvalues: v159 (copy), v178 (copy)
    local v182 = nil;
    local v183 = nil;
    if not v181 then
        v181 = false;
    end;
    local v184, v185 = v159(v179, v180, not v181);
    v182 = v184;
    v183 = v185;
    if not v182 then
        return nil, nil, nil;
    else
        v184, v185 = v178(v179, v183);
        return v182, v184, v185;
    end;
end;
v6.ForceAnimationToStep = function(v187) --[[ Line: 726 ]]
    local l_Humanoid_0 = v187:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
        if l_Animator_0 then
            l_Animator_0:StepAnimations(0.1);
        end;
    end;
end;
v6.LoadAsset = function(v190) --[[ Line: 740 ]]
    -- upvalues: v6 (copy), l_InsertService_0 (copy)
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 741 ]]
        -- upvalues: v6 (ref), v190 (copy), l_InsertService_0 (ref)
        if v6.debugLoadAssetsFromFiles and v6.mapAssetIdToFileName then
            local v191 = "rbxasset://" .. v6.mapAssetIdToFileName(v190);
            return l_InsertService_0:LoadLocalAsset(v191);
        else
            return l_InsertService_0:LoadAsset(v190);
        end;
    end);
    return l_status_6, l_result_6;
end;
v6.SetDebugLoadAssetsFromFiles = function(v194, v195) --[[ Line: 762 ]]
    -- upvalues: v6 (copy)
    v6.debugLoadAssetsFromFiles = v194;
    v6.mapAssetIdToFileName = v195;
end;
v6.GetMotor6DBetween = function(v196, v197) --[[ Line: 770 ]]
    if not v196 or not v197 then
        return nil;
    else
        assert(v196, "part0 is non-nil. Silence type checker.");
        assert(v197, "part1 is non-nil. Silence type checker.");
        for _, v199 in pairs(v197:GetChildren()) do
            if v199:IsA("Motor6D") and v199.Part0 == v196 then
                return v199;
            end;
        end;
        return nil;
    end;
end;
v6.PoseKeyframeHasFaceAnimation = function(v200) --[[ Line: 789 ]]
    if not v200 then
        return false;
    else
        assert(v200, "poseKeyframe is non-nil. Silence type checker.");
        local function v201(v202) --[[ Line: 795 ]] --[[ Name: recurHasFaceAnimation ]]
            -- upvalues: v201 (copy)
            if v202:IsA("Folder") then
                return true;
            else
                for _, v204 in v202:GetChildren() do
                    if v201(v204) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        for _, v206 in pairs(v200:GetPoses()) do
            if v201(v206) then
                return true;
            end;
        end;
        return false;
    end;
end;
v6.ApplyKeyframe = function(v207, v208) --[[ Line: 820 ]]
    -- upvalues: v7 (ref), v94 (copy), v6 (copy)
    v7 = {};
    v94(v207, v208);
    v7 = {};
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 107 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    if l_status_7 and l_result_7 then
        v6.ForceAnimationToStep(v207);
    end;
end;
v6.GetNumberValueWithDefault = function(v211, v212, v213) --[[ Line: 829 ]]
    local l_v213_0 = v213;
    local l_v211_FirstChild_0 = v211:FindFirstChild(v212);
    if l_v211_FirstChild_0 and l_v211_FirstChild_0:IsA("NumberValue") then
        l_v213_0 = l_v211_FirstChild_0.Value;
    end;
    return l_v213_0;
end;
v6.GetAnimationClip = function(v216) --[[ Line: 842 ]]
    -- upvalues: v67 (copy)
    if v216:IsA("KeyframeSequence") then
        return v216;
    elseif v216:IsA("Animation") then
        return (v67(v216.AnimationId));
    else
        error("Unknown keyframeSequenceOrAnimation type:" .. v216.ClassName);
        return nil;
    end;
end;
v6.GetThumbnailKeyframe = function(v217, v218, v219) --[[ Line: 856 ]]
    -- upvalues: v100 (copy)
    local l_v218_Keyframes_0 = v218:GetKeyframes();
    local v221 = nil;
    v221 = if v217 and v217 > 0 and v217 <= #l_v218_Keyframes_0 then l_v218_Keyframes_0[v217] else l_v218_Keyframes_0[math.ceil(#l_v218_Keyframes_0 / 2)];
    return (v100(v221, v219));
end;
v6.GetCurveAnimationTimeLength = function(v222) --[[ Line: 874 ]]
    local v223 = 0;
    for _, v225 in v222:GetDescendants() do
        if v225:IsA("FloatCurve") then
            v223 = math.max(v223, v225:GetKeyAtIndex(v225.Length).Time);
        end;
    end;
    return v223;
end;
v6.GetThumbnailKeyframeFromCurve = function(v226, v227, v228) --[[ Line: 889 ]]
    -- upvalues: v6 (copy), v103 (copy), v100 (copy)
    local v229 = v6.GetCurveAnimationTimeLength(v227);
    if not v226 or v226 < 0 or v229 < v226 then
        v226 = v229 / 2;
    end;
    assert(v226, "thumbnailTime should be non-nil. Silence type checker");
    local v230 = {
        Position = true, 
        Rotation = true
    };
    local function v231(v232, v233) --[[ Line: 907 ]] --[[ Name: recurGenerateKeyframe ]]
        -- upvalues: v103 (ref), v226 (ref), v230 (copy), v231 (copy)
        local v234 = nil;
        local l_Position_0 = v233:FindFirstChild("Position");
        local l_Rotation_0 = v233:FindFirstChild("Rotation");
        if l_Position_0 and l_Rotation_0 then
            local v237 = v103(l_Rotation_0, v226);
            if v237 then
                v237 = v237 + Vector3.new(table.unpack(l_Position_0:GetValueAtTime(v226)));
                local l_Pose_0 = Instance.new("Pose");
                l_Pose_0.CFrame = v237;
                l_Pose_0.Name = v233.Name;
                l_Pose_0.Parent = v232;
                v234 = l_Pose_0;
            end;
        else
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = v233.Name;
            l_Folder_0.Parent = v232;
            v234 = l_Folder_0;
        end;
        for _, v241 in v233:GetChildren() do
            if v241:IsA("FloatCurve") and not v230[v241] then
                local l_NumberPose_0 = Instance.new("NumberPose");
                l_NumberPose_0.Name = v241.Name;
                local v243 = v241:GetValueAtTime(v226) or 0;
                assert(v243, "valueAtTime should be non-nil. Silence type checker.");
                l_NumberPose_0.Value = v243;
                l_NumberPose_0.Parent = v234;
            elseif v241:IsA("Folder") then
                v231(v234, v241);
            end;
        end;
    end;
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Name = v227.Name;
    l_Keyframe_0.Time = v226;
    for _, v246 in v227:GetChildren() do
        if v246:IsA("Folder") then
            v231(l_Keyframe_0, v246);
        end;
    end;
    return (v100(l_Keyframe_0, v228));
end;
v6.ClearPlayerCharacterFace = function(v247) --[[ Line: 965 ]]
    local l_v247_FirstChildWhichIsA_0 = v247:FindFirstChildWhichIsA("FaceControls", true);
    if l_v247_FirstChildWhichIsA_0 then
        local l_Parent_0 = l_v247_FirstChildWhichIsA_0.Parent;
        local l_l_v247_FirstChildWhichIsA_0_Children_0 = l_v247_FirstChildWhichIsA_0:GetChildren();
        local l_FaceControls_0 = Instance.new("FaceControls");
        l_FaceControls_0.Parent = l_Parent_0;
        for _, v253 in l_l_v247_FirstChildWhichIsA_0_Children_0 do
            v253.Parent = l_FaceControls_0;
        end;
        l_v247_FirstChildWhichIsA_0:Destroy();
    end;
end;
v6.AdjustArmOnR6ForTool = function(v254) --[[ Line: 982 ]]
    local l_Tool_1 = v254:FindFirstChildOfClass("Tool");
    local l_Torso_0 = v254:FindFirstChild("Torso");
    if l_Torso_0 then
        local l_l_Torso_0_FirstChild_0 = l_Torso_0:FindFirstChild("Right Shoulder");
        if l_l_Torso_0_FirstChild_0 then
            if l_Tool_1 then
                l_l_Torso_0_FirstChild_0.CurrentAngle = 1.5707963267948966;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 1.5707963267948966;
                return;
            else
                l_l_Torso_0_FirstChild_0.CurrentAngle = 0;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 0;
            end;
        end;
    end;
end;
v6.DEPRECATED_SetPlayerCharacterPoseEasyOut = function(v258, v259) --[[ Line: 1002 ]]
    if v259 then
        if v259.RigType == Enum.HumanoidRigType.R6 then
            local l_Tool_2 = v258:FindFirstChildOfClass("Tool");
            local l_Torso_1 = v258:FindFirstChild("Torso");
            if l_Torso_1 then
                local l_l_Torso_1_FirstChild_0 = l_Torso_1:FindFirstChild("Right Shoulder");
                if l_l_Torso_1_FirstChild_0 then
                    if l_Tool_2 then
                        l_l_Torso_1_FirstChild_0.CurrentAngle = 1.5707963267948966;
                        l_l_Torso_1_FirstChild_0.DesiredAngle = 1.5707963267948966;
                    else
                        l_l_Torso_1_FirstChild_0.CurrentAngle = 0;
                        l_l_Torso_1_FirstChild_0.DesiredAngle = 0;
                    end;
                end;
            end;
            return true;
        else
            return false;
        end;
    else
        return true;
    end;
end;
v6.SetPlayerCharacterFace = function(v263, v264, v265) --[[ Line: 1032 ]]
    -- upvalues: v4 (copy), v167 (copy), v159 (copy), v6 (copy)
    if not v264 then
        return;
    elseif v264 == "" then
        return;
    elseif v264 == 0 then
        return;
    else
        local v266 = true;
        if typeof(v264) ~= "number" then
            v266 = typeof(v264) == "string";
        end;
        assert(v266, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string");
        if not v263:FindFirstChildOfClass("Humanoid") then
            return;
        else
            v266 = nil;
            v266 = if v4 then v167(v264) else v159(v263, v264, true);
            if not v266 then
                return;
            elseif v265 and not v265(v264) then
                return;
            else
                v6.ClearPlayerCharacterFace(v263);
                v6.ApplyKeyframe(v263, v266);
                return;
            end;
        end;
    end;
end;
v6.SetPlayerCharacterNeutralPose = function(v267) --[[ Line: 1092 ]]
    -- upvalues: v4 (copy), v6 (copy)
    local l_Humanoid_1 = v267:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_1 then
        return;
    else
        assert(l_Humanoid_1, "humanoid should be non-nil. Silence type checker.");
        if v4 then
            l_Humanoid_1:BuildRigFromAttachments();
            if l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R15 then
                return;
            end;
        end;
        if not v4 then
            l_Humanoid_1:BuildRigFromAttachments();
        end;
        v6.ClearPlayerCharacterFace(v267);
        local function v269(v270) --[[ Line: 1113 ]] --[[ Name: recurResetJoint ]]
            -- upvalues: v269 (copy)
            if v270:IsA("Motor6D") then
                v270.Transform = CFrame.new();
            end;
            for _, v272 in (v270:GetChildren()) do
                v269(v272);
            end;
        end;
        v269(v267);
        return;
    end;
end;
v6.DEPRECATED_LoadKeyframesForPose = function(v273, v274, v275, v276) --[[ Line: 1138 ]]
    -- upvalues: v159 (copy), v178 (copy), v3 (copy), v6 (copy)
    local v277 = {
        DEPRECATED_animationAssetId = v274
    };
    assert(v273, "character should be non-nil");
    if v274 ~= nil then
        assert(typeof(v274) == "number", "EmoteUtility.DEPRECATED_LoadKeyframesForPose expects animationAssetId to be a number or nil");
        assert(v274 > 0, "EmoteUtility.DEPRECATED_LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)");
    end;
    if v275 ~= nil then
        assert(typeof(v275) == "number", "EmoteUtility.DEPRECATED_LoadKeyframesForPose expects moodAssetId to be a number or nil");
    end;
    local l_Humanoid_2 = v273:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_2 then
        return nil;
    else
        assert(l_Humanoid_2, "humanoid should be non-nil. Silence type checker.");
        if l_Humanoid_2.RigType ~= Enum.HumanoidRigType.R15 then
            return v277;
        else
            local l_v276_0 = v276;
            local v280 = nil;
            local v281 = nil;
            if not l_v276_0 then
                l_v276_0 = false;
            end;
            local v282, v283 = v159(v273, v274, not l_v276_0);
            v280 = v282;
            v281 = v283;
            local v284, v285, v286;
            if not v280 then
                v284 = nil;
                v286 = nil;
                v285 = nil;
            else
                v282, v283 = v178(v273, v281);
                v284 = v280;
                v286 = v282;
                v285 = v283;
            end;
            l_v276_0 = nil;
            if v3 then
                v280 = false;
                if v275 and v275 ~= 0 then
                    if v274 == nil then
                        v280 = true;
                    elseif not v6.PoseKeyframeHasFaceAnimation(v284) then
                        v280 = true;
                    end;
                end;
                if v280 then
                    l_v276_0 = v159(v273, v275, true);
                end;
            elseif not v6.PoseKeyframeHasFaceAnimation(v284) and v275 and v275 ~= 0 then
                l_v276_0 = v159(v273, v275, true);
            end;
            v277.poseKeyframe = v284;
            v277.moodKeyframe = l_v276_0;
            v277.defaultToolKeyframe = v285;
            v277.suggestedKeyframeFromTool = v286;
            return v277;
        end;
    end;
end;
local function v303(v287, v288, v289, v290, v291) --[[ Line: 1219 ]] --[[ Name: loadKeyframesForPoseR15 ]]
    -- upvalues: v159 (copy), v178 (copy), v6 (copy), v167 (copy)
    local v292 = {
        originalAnimationAssetId = v288
    };
    local v293 = nil;
    v293 = not v291 or false;
    local v294, v295, v296 = v159(v287, v288, not v290, v293);
    local v297 = nil;
    local v298 = nil;
    if not v291 and v294 then
        local v299, v300 = v178(v287, v295);
        v297 = v299;
        v298 = v300;
    end;
    local v301 = nil;
    local v302 = false;
    if v289 and v289 ~= 0 then
        if v288 == nil then
            v302 = true;
        elseif not v6.PoseKeyframeHasFaceAnimation(v294) then
            v302 = true;
        end;
    end;
    if v302 then
        v301 = v167(v289);
    end;
    v292.poseKeyframe = v294;
    v292.moodKeyframe = v301;
    v292.defaultToolKeyframe = v298;
    v292.suggestedKeyframeFromTool = v297;
    v292.finalAnimationAssetIdOrUrl = v296;
    return v292;
end;
v6.LoadKeyframesForPose = function(v304, v305, v306, v307, v308) --[[ Line: 1303 ]]
    -- upvalues: v303 (copy)
    assert(v304, "character should be non-nil");
    if v305 ~= nil then
        assert(typeof(v305) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil");
        assert(v305 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)");
    end;
    if v306 ~= nil then
        assert(typeof(v306) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil");
    end;
    local l_Humanoid_3 = v304:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_3 then
        return nil;
    else
        assert(l_Humanoid_3, "humanoid should be non-nil. Silence type checker.");
        if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
            return (v303(v304, v305, v306, v307, v308));
        else
            return {
                originalAnimationAssetId = v305
            };
        end;
    end;
end;
v6.ApplyKeyframesForPose = function(v310, v311) --[[ Line: 1351 ]]
    -- upvalues: v6 (copy), v7 (ref), v4 (copy), v140 (copy), v94 (copy)
    assert(v310, "character should be non-nil");
    if not v311 then
        return;
    else
        assert(v311, "keyframesForPose should be non-nil. Silence type checker.");
        local l_Humanoid_4 = v310:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_4 then
            return;
        else
            assert(l_Humanoid_4, "humanoid should be non-nil. Silence type checker.");
            v6.SetPlayerCharacterNeutralPose(v310);
            v7 = {};
            local l_Tool_3 = v310:FindFirstChildOfClass("Tool");
            if v4 then
                if l_Humanoid_4.RigType == Enum.HumanoidRigType.R15 then
                    if l_Tool_3 then
                        local l_originalAnimationAssetId_0 = v311.originalAnimationAssetId;
                        v140(v310, l_Humanoid_4, l_Tool_3, l_originalAnimationAssetId_0, v311.poseKeyframe, v311.defaultToolKeyframe, v311.suggestedKeyframeFromTool);
                    else
                        v94(v310, v311.poseKeyframe);
                    end;
                else
                    v6.AdjustArmOnR6ForTool(v310);
                end;
            elseif l_Tool_3 then
                local v315 = nil;
                v315 = if v4 then v311.originalAnimationAssetId else v311.DEPRECATED_animationAssetId;
                v140(v310, l_Humanoid_4, l_Tool_3, v315, v311.poseKeyframe, v311.defaultToolKeyframe, v311.suggestedKeyframeFromTool);
            else
                v94(v310, v311.poseKeyframe);
            end;
            if v4 then
                if l_Humanoid_4.RigType == Enum.HumanoidRigType.R15 then
                    v94(v310, v311.moodKeyframe);
                end;
            else
                v94(v310, v311.moodKeyframe);
            end;
            v7 = {};
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 107 ]]
                return game.GetService(game, "ThumbnailGenerator") ~= nil;
            end);
            if l_status_8 and l_result_8 then
                v6.ForceAnimationToStep(v310);
            end;
            return;
        end;
    end;
end;
v6.SetPlayerCharacterPoseWithMoodFallback = function(v318, v319, v320, v321, v322) --[[ Line: 1443 ]]
    -- upvalues: v4 (copy), v6 (copy)
    local l_Humanoid_5 = v318:FindFirstChildOfClass("Humanoid");
    if v4 then
        if not l_Humanoid_5 then
            return;
        end;
    elseif v6.DEPRECATED_SetPlayerCharacterPoseEasyOut(v318, l_Humanoid_5) then
        return;
    end;
    assert(l_Humanoid_5, "humanoid should be non-nil.  Silence type checker.");
    if not v4 and l_Humanoid_5.RigType ~= Enum.HumanoidRigType.R15 then
        return;
    else
        local v324 = nil;
        v324 = if v4 then v6.LoadKeyframesForPose(v318, v319, v320, v321, v322) else v6.DEPRECATED_LoadKeyframesForPose(v318, v319, v320, v321);
        v6.ApplyKeyframesForPose(v318, v324);
        return;
    end;
end;
v6.ThumbnailZoomExtents = function(v325, v326, v327, v328, v329) --[[ Line: 1486 ]]
    local l_v325_ModelCFrame_0 = v325:GetModelCFrame();
    local l_LookVector_0 = l_v325_ModelCFrame_0.LookVector;
    local l_HumanoidRootPart_0 = v325:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
    end;
    local v333 = CFrame.new(l_v325_ModelCFrame_0.Position + l_LookVector_0 * 5, l_v325_ModelCFrame_0.Position);
    local v334 = l_v325_ModelCFrame_0.Position + Vector3.new(v327, -v328, 0);
    local l_v325_ExtentsSize_0 = v325:GetExtentsSize();
    local l_X_1 = l_v325_ExtentsSize_0.X;
    local l_Y_1 = l_v325_ExtentsSize_0.Y;
    local l_Z_1 = l_v325_ExtentsSize_0.Z;
    local v339 = math.sqrt(l_X_1 ^ 2 + l_Y_1 ^ 2 + l_Z_1 ^ 2);
    local v340 = 1 / math.tan(math.rad(v326) / 2);
    local v341 = v339 / 2 * v340 * (1 / v329);
    return v333 - v333.Position + v334 + l_LookVector_0 * v341;
end;
return v6;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v3 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateTextureBorder);
local v4 = require(l_Parent_0.flags.getEngineFeatureViewportFrameSnapshotEngineFeature);
local v5 = require(l_Parent_0.flags.getFIntDynamicHeadBorderSize);
local v6 = require(l_Parent_0.util.setupDynamicHead);
local v7 = require(l_Parent_0.util.Thumbnailer);
local v8 = {
    "ChinRaiser", 
    "ChinRaiserUpperLip", 
    "Corrugator", 
    "EyesLookDown", 
    "EyesLookLeft", 
    "EyesLookRight", 
    "EyesLookUp", 
    "FlatPucker", 
    "Funneler", 
    "JawDrop", 
    "JawLeft", 
    "JawRight", 
    "LeftBrowLowerer", 
    "LeftCheekPuff", 
    "LeftCheekRaiser", 
    "LeftDimpler", 
    "LeftEyeClosed", 
    "LeftEyeUpperLidRaiser", 
    "LeftInnerBrowRaiser", 
    "LeftLipCornerDown", 
    "LeftLipCornerPuller", 
    "LeftLipStretcher", 
    "LeftLowerLipDepressor", 
    "LeftNoseWrinkler", 
    "LeftOuterBrowRaiser", 
    "LeftUpperLipRaiser", 
    "LipPresser", 
    "LipsTogether", 
    "LowerLipSuck", 
    "MouthLeft", 
    "MouthRight", 
    "Pucker", 
    "RightBrowLowerer", 
    "RightCheekPuff", 
    "RightCheekRaiser", 
    "RightDimpler", 
    "RightEyeClosed", 
    "RightEyeUpperLidRaiser", 
    "RightInnerBrowRaiser", 
    "RightLipCornerDown", 
    "RightLipCornerPuller", 
    "RightLipStretcher", 
    "RightLowerLipDepressor", 
    "RightNoseWrinkler", 
    "RightOuterBrowRaiser", 
    "RightUpperLipRaiser", 
    "TongueDown", 
    "TongueOut", 
    "TongueUp", 
    "UpperLipSuck"
};
local v9 = {
    Vector3.new(0, 0, -1, 0), 
    Vector3.new(0, 1, 0, 0), 
    (Vector3.new(1, 0, 0, 0))
};
assert(true);
local v10 = v5();
local _ = function(v11) --[[ Line: 81 ]] --[[ Name: applyMaxMood ]]
    -- upvalues: v8 (copy)
    local l_Head_0 = v11:FindFirstChild("Head");
    if not l_Head_0 then
        return false;
    else
        local l_FaceControls_0 = l_Head_0:FindFirstChild("FaceControls");
        if not l_FaceControls_0 then
            return false;
        else
            for _, v15 in v8 do
                l_FaceControls_0[v15] = 1;
            end;
            return true;
        end;
    end;
end;
return function(v17, v18) --[[ Line: 100 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v6 (copy), v8 (copy), v7 (copy), v9 (copy), l_UGCValidationService_0 (copy), v10 (copy)
    if not v2() or not v3() or not v18 and not v4() then
        return true;
    else
        local v19 = v17:Clone();
        local v20 = v6(v19);
        if not v20 then
            error("couldn't create character");
        end;
        local l_Head_1 = v20:FindFirstChild("Head");
        local v22;
        if not l_Head_1 then
            v22 = false;
        else
            local l_FaceControls_1 = l_Head_1:FindFirstChild("FaceControls");
            if not l_FaceControls_1 then
                v22 = false;
            else
                for _, v25 in v8 do
                    l_FaceControls_1[v25] = 1;
                end;
                v22 = true;
            end;
        end;
        if not v22 then
            error("could not apply mood");
        end;
        l_Head_1 = v7.new(v18, 70, Vector2.new(100, 100));
        l_Head_1:init(v19);
        for _, v27 in v9 do
            local v28 = Vector3.new(1, 1, 1, 0) - Vector3.new(math.abs(v27.X), math.abs(v27.Y), (math.abs(v27.Z)));
            local v29 = v19.Size * v28;
            l_Head_1:setCamera(0.5, math.max(v29.X, v29.Y, v29.Z), v27);
            local v30, v31 = l_Head_1:takeSnapshot();
            if not v30 then
                l_Head_1:cleanup();
                local v32 = string.format("Unable to capture snapshot of DynamicHead (%s)", v17.MeshId);
                if v18 then
                    error(v32);
                else
                    return false, {
                        v32
                    };
                end;
            end;
            local v33 = nil;
            local v34 = nil;
            if v18 then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 146 ]]
                    -- upvalues: l_UGCValidationService_0 (ref), v31 (copy), v10 (ref)
                    return l_UGCValidationService_0:ValidateTextureAlphaByteString(v31, v10);
                end);
                v33 = l_status_0;
                v34 = l_result_0;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 150 ]]
                    -- upvalues: l_UGCValidationService_0 (ref), v31 (copy), v10 (ref)
                    return l_UGCValidationService_0:ValidateTextureAlpha(v31, v10);
                end);
                v33 = l_status_1;
                v34 = l_result_1;
            end;
            if not v33 then
                l_Head_1:cleanup();
                local v39 = string.format("Failed to read data from snapshot of DynamicHead (%s)", v17.MeshId);
                if v18 then
                    error(v39);
                else
                    return false, {
                        v39
                    };
                end;
            end;
            if not v34 then
                l_Head_1:cleanup();
                return false, {
                    string.format("DynamicHead (%s) when emoting surpasses the expected bounding box", v17.MeshId)
                };
            end;
        end;
        l_Head_1:cleanup();
        return true;
    end;
end;
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v4 = require(l_script_FirstAncestor_0.Src.Components.AutoSetupContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AvatarScalingTypes);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeSpecificationUtils);
local v7 = require(l_script_FirstAncestor_0.Src.Util.BoundingBoxUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.CameraUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Util.CharacterHashUtils);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Packages.Dash);
local v12 = require(l_script_FirstAncestor_0.Packages.Framework);
local v13 = require(l_script_FirstAncestor_0.Src.Util.HumanoidValueUtil);
local v14 = require(l_script_FirstAncestor_0.Packages.React);
local v15 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v17 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v18 = require(l_script_FirstAncestor_0.Src.Util.assetUriToId);
local v19 = require(l_script_FirstAncestor_0.Src.Util.findUnderlyingMeshAssetIds);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAvatarPreviewerSharedCache);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagHumanoidModelScalingFix);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioAvatarAutosetupReportsProgress);
local v24 = require(l_script_FirstAncestor_0.Src.Util.getRotationInXZPlane);
local v25 = {
    Created = 1, 
    Pending = 2, 
    Processing = 3, 
    Finalizing = 4, 
    Completed = 5, 
    Invalid = 101, 
    Failed = 102, 
    Canceled = 103
};
local function v40(v26, v27) --[[ Line: 49 ]] --[[ Name: computeValidScaleAsync ]]
    -- upvalues: v6 (copy), v11 (copy), v10 (copy)
    local v28 = {};
    for _, v30 in v27:GetChildren() do
        if v30:IsA("MeshPart") then
            v28[v30.Name] = v30;
        end;
    end;
    local v31 = v26.calculateScaleToValidateBoundsAsync(v28);
    if v31.ok and v31.Overall.ok then
        return {
            scale = 1 / v31.Overall.scale, 
            proportions = v31.Overall.scaleType, 
            errors = nil
        };
    else
        local v32 = v6.getBodyTypeSizeSpecification("ProportionsNormal", v27);
        local v33 = v6.guessAvatarSizeBounds(v32);
        local _, v35 = v27:GetBoundingBox();
        local v36 = v6.coversMin(v35, v33.minSize);
        local v37 = v6.containsMax(v35, v33.maxSize);
        if v36 and v37 then
            return {
                scale = 1, 
                proportions = "ProportionsNormal", 
                errors = v11.append({
                    v10.ERROR_NO_VALID_SCALE_ERROR
                }, v31.errors)
            };
        else
            local v38 = v6.getScaleFactorToContain(v35, v33.maxSize) + 0.001;
            local v39 = v6.getScaleFactorToCover(v35, v33.minSize) - 0.001;
            if v39 < v38 then
                return {
                    scale = (v39 + v38) / 2, 
                    proportions = "ProportionsNormal", 
                    errors = {
                        "There is no scale in which the model fits within the min and max bounding boxes."
                    } or v31.errors
                };
            else
                return {
                    scale = (v39 + v38) / 2, 
                    proportions = "ProportionsNormal", 
                    errors = v11.append({
                        v10.ERROR_NO_VALID_SCALE_ERROR
                    }, v31.errors)
                };
            end;
        end;
    end;
end;
local function v56(v41, v42) --[[ Line: 117 ]] --[[ Name: applyScale ]]
    -- upvalues: v13 (copy), v10 (copy), l_HttpService_0 (copy)
    local l_scale_0 = v42.scale;
    local l_Humanoid_0 = v41:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 == nil then
        return;
    else
        local l_HumanoidRootPart_0 = v41:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 == nil then
            return;
        else
            local l_v41_Children_0 = v41:GetChildren();
            local l_v41_Descendants_0 = v41:GetDescendants();
            local l_PrimaryPart_0 = v41.PrimaryPart;
            for _, v50 in l_v41_Children_0 do
                v50.Parent = nil;
            end;
            l_Humanoid_0.Parent = v41;
            v41:ScaleTo(l_scale_0);
            l_HumanoidRootPart_0.Size = Vector3.new(2, 2, 1, 0) * l_scale_0;
            v13.setOriginalSize(l_HumanoidRootPart_0, (Vector3.new(2, 2, 1, 0)));
            for _, v52 in l_v41_Descendants_0 do
                if v52:IsA("BasePart") and v52 ~= l_HumanoidRootPart_0 then
                    v13.setOriginalSize(v52, v52.Size / l_scale_0);
                elseif v52:IsA("Attachment") then
                    v13.setOriginalPosition(v52, v52.Position / l_scale_0);
                end;
            end;
            for _, v54 in l_v41_Children_0 do
                v54.Parent = v41;
            end;
            v41.PrimaryPart = l_PrimaryPart_0;
            v41:SetAttribute(v10.ATTRIBUTE_ORIGINAL_SETUP_SCALE, l_scale_0);
            if v42.errors then
                local v55 = l_HttpService_0:JSONEncode(v42.errors);
                v41:SetAttribute(v10.ATTRIBUTE_SCALE_ERROR_LIST, v55);
            end;
            v41:ScaleTo(1);
            return;
        end;
    end;
end;
local function _(v57) --[[ Line: 175 ]] --[[ Name: applyAnimationsScript ]]
    local l_Players_0 = game:GetService("Players");
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    task.spawn(function() --[[ Line: 197 ]]
        -- upvalues: l_Players_0 (copy), l_HumanoidDescription_0 (copy), v57 (copy)
        local v60 = l_Players_0:CreateHumanoidModelFromDescription(l_HumanoidDescription_0, Enum.HumanoidRigType.R15, Enum.AssetTypeVerification.ClientOnly).Animate:Clone();
        v60.walk.WalkAnim.AnimationId = "rbxassetid://16562332340";
        v60.run.RunAnim.AnimationId = "rbxassetid://16562326358";
        v60.idle.Animation1.AnimationId = "rbxassetid://16562317918";
        v60.jump.JumpAnim.AnimationId = "rbxassetid://16562321958";
        v60.climb.ClimbAnim.AnimationId = "rbxassetid://16562307212";
        v60.fall.FallAnim.AnimationId = "rbxassetid://16562311455";
        v60.swim.Swim.AnimationId = "rbxassetid://16562311455";
        v60.Parent = v57;
    end);
end;
local function v65(v62, v63) --[[ Line: 219 ]] --[[ Name: renameModel ]]
    -- upvalues: v10 (copy)
    if v63.model == nil then
        return;
    else
        local v64 = v63.intendedName or v63.model.Name;
        if string.match(string.lower(v64), (("%*$"):format(v10.BODY_MESH_SUFFIX))) then
            v64 = string.sub(v64, 1, #v64 - #v10.BODY_MESH_SUFFIX);
        end;
        v62.Name = ("%*%*"):format(v64, v10.OUTPUT_MODEL_SUFFIX);
        return;
    end;
end;
local function _(v66) --[[ Line: 232 ]] --[[ Name: setPivotOffset ]]
    local l_v66_BoundingBox_0, v68 = v66:GetBoundingBox();
    local v69 = l_v66_BoundingBox_0:ToWorldSpace(CFrame.new(0, -v68.Y / 2, 0));
    v66.PrimaryPart.PivotOffset = v66.PrimaryPart.CFrame:ToObjectSpace(v69);
end;
local function v82(v71) --[[ Line: 242 ]] --[[ Name: getTargetBoundingBox ]]
    -- upvalues: v7 (copy)
    if v71.model == nil then
        return nil, nil;
    elseif not v71.lastFilteredSelection then
        return v71.model:GetBoundingBox();
    else
        if #v71.lastFilteredSelection == 1 then
            local v72 = v71.lastFilteredSelection[1];
            if v72:IsA("BasePart") then
                return v72.CFrame, v72.Size;
            elseif v72:IsA("Model") then
                return v72:GetBoundingBox();
            end;
        end;
        local v73 = {};
        local function v77(v74) --[[ Line: 263 ]] --[[ Name: addParts ]]
            -- upvalues: v73 (copy)
            if v74:IsA("BasePart") then
                table.insert(v73, v74);
            end;
            for _, v76 in v74:GetDescendants() do
                if v76:IsA("BasePart") then
                    table.insert(v73, v76);
                end;
            end;
        end;
        for _, v79 in v71.lastFilteredSelection do
            v77(v79);
        end;
        if #v73 == 1 then
            return v73[1].CFrame, v73[1].Size;
        elseif #v73 > 0 then
            local v80, v81 = v7.getAABoundingBox(v73, CFrame.new());
            return CFrame.new(v80), v81;
        else
            return v71.model:GetBoundingBox();
        end;
    end;
end;
local function v116(v83, v84) --[[ Line: 291 ]] --[[ Name: positionInWorkspace ]]
    -- upvalues: v82 (copy), v24 (copy), v7 (copy), l_Workspace_0 (copy)
    if v84.model == nil then
        return;
    else
        local v85, v86 = v82(v84);
        if v85 == nil or v86 == nil then
            return;
        else
            local v87 = v24(v85);
            local v88 = v7.axisAlignedBoxSize(v85, v86);
            local v89 = v87:VectorToWorldSpace(v88);
            local l_v83_BoundingBox_0, v91 = v83:GetBoundingBox();
            local v92 = v24(l_v83_BoundingBox_0);
            local v93 = v7.axisAlignedBoxSize(l_v83_BoundingBox_0, v91);
            local v94 = v92:VectorToWorldSpace(v93);
            local v95 = v91 * Vector3.new(0.75, 0.75, 0.75, 0);
            local v96 = OverlapParams.new();
            v96.RespectCanCollide = true;
            v96.MaxParts = 1;
            v96.FilterDescendantsInstances = {
                v83, 
                l_Workspace_0.CurrentCamera
            };
            v96.FilterType = Enum.RaycastFilterType.Exclude;
            local v97 = RaycastParams.new();
            v97.FilterDescendantsInstances = {
                v83, 
                l_Workspace_0.CurrentCamera
            };
            v97.FilterType = Enum.RaycastFilterType.Exclude;
            v97.IgnoreWater = false;
            local function v102(v98) --[[ Line: 323 ]] --[[ Name: castForSafePlacement ]]
                -- upvalues: v93 (copy), l_Workspace_0 (ref), v91 (copy), v97 (copy)
                local v99 = math.clamp(v93.Y / 2, 1, 512);
                local v100 = v98 + Vector3.new(0, v99 / 2, 0);
                local v101 = l_Workspace_0:Blockcast(v100, v91, Vector3.new(0, -v99, 0), v97);
                if not v101 then
                    return v98;
                else
                    return CFrame.new(v100.X, v101.Position.Y + v91.Y / 2, v100.Z);
                end;
            end;
            local function _(v103) --[[ Line: 337 ]] --[[ Name: canPlace ]]
                -- upvalues: l_Workspace_0 (ref), v95 (copy), v96 (copy)
                local l_l_Workspace_0_PartBoundsInBox_0 = l_Workspace_0:GetPartBoundsInBox(v103, v95, v96);
                if next(l_l_Workspace_0_PartBoundsInBox_0) then
                    return false;
                else
                    return true;
                end;
            end;
            local function v109(v106) --[[ Line: 348 ]] --[[ Name: getBoundingBoxCFrame ]]
                -- upvalues: v89 (copy), v94 (copy), v87 (copy), v88 (copy), v93 (copy), v102 (copy)
                local v107 = v89.X / 2 + v94.X / 2 + (v94.X + 2) * (v106 - 1);
                local v108 = v87 * CFrame.new(0, -v88.Y / 2, 0) * CFrame.new(0, v93.Y / 2, 0) * CFrame.new(-v107, 0, 0);
                return v102(v108);
            end;
            local v115 = (function() --[[ Line: 360 ]] --[[ Name: findNewBoundingBoxCFrame ]]
                -- upvalues: v109 (copy), l_Workspace_0 (ref), v95 (copy), v96 (copy)
                for v110 = 1, 10 do
                    local v111 = v109(v110);
                    local l_l_Workspace_0_PartBoundsInBox_1 = l_Workspace_0:GetPartBoundsInBox(v111, v95, v96);
                    if not next(l_l_Workspace_0_PartBoundsInBox_1) or false then
                        return v111;
                    else
                        local v113 = v109(-v110);
                        local l_l_Workspace_0_PartBoundsInBox_2 = l_Workspace_0:GetPartBoundsInBox(v113, v95, v96);
                        if not next(l_l_Workspace_0_PartBoundsInBox_2) or false then
                            return v113;
                        end;
                    end;
                end;
                return v109(1);
            end)();
            if v115 == nil then
                return;
            else
                v83:SetPrimaryPartCFrame((v115:ToWorldSpace((l_v83_BoundingBox_0:ToObjectSpace(v83.PrimaryPart.CFrame)))));
                return;
            end;
        end;
    end;
end;
local function v122(v117, v118) --[[ Line: 391 ]] --[[ Name: wearAccessories ]]
    for _, v120 in v118 do
        local v121 = v120:Clone();
        if v121 then
            v121.Parent = v117;
            if v121:IsA("Accessory") then
                v117.Humanoid:AddAccessory(v121);
            end;
        end;
    end;
end;
local function v127(v123) --[[ Line: 404 ]] --[[ Name: ensureSurfaceAppearances ]]
    for _, v125 in v123:GetDescendants() do
        if v125:IsA("MeshPart") and not v125:FindFirstChildWhichIsA("SurfaceAppearance") and v125.TextureID ~= "" then
            local l_SurfaceAppearance_0 = Instance.new("SurfaceAppearance");
            l_SurfaceAppearance_0.ColorMap = v125.TextureID;
            l_SurfaceAppearance_0.Parent = v125;
        end;
    end;
end;
local function v131(v128, v129) --[[ Line: 424 ]] --[[ Name: applyProportions ]]
    -- upvalues: v5 (copy), v22 (copy), v13 (copy)
    local v130 = v5.types[v129];
    if not v130 then
        warn((("Unknown scalingType %*"):format(v129)));
        return;
    else
        v5.setAvatarPartScaleTypeValueObjects(v128, v129);
        if v22() then
            v13.setBodyProportionScale(v128.Humanoid, v130.BodyProportionScale);
            v13.setBodyTypeScale(v128.Humanoid, v130.BodyTypeScale);
            return;
        else
            v13.setBodyProportionScale(v128.Humanoid, v130.BodyProportionScale * v128:GetScale());
            v13.setBodyTypeScale(v128.Humanoid, v130.BodyTypeScale * v128:GetScale());
            return;
        end;
    end;
end;
local function v146(v132, v133, v134, v135, v136) --[[ Line: 448 ]] --[[ Name: insertBodyAsync ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), v10 (copy), v40 (copy), v56 (copy), v131 (copy), v65 (copy), v122 (copy), v127 (copy), l_Workspace_0 (copy), v116 (copy), v8 (copy)
    assert(v135 ~= nil, "Inserting body with no target");
    assert(v135.model ~= nil, "Inserting body with no model");
    assert(v134.PrimaryPart ~= nil, "Auto setup returned model with no primary part");
    local v137 = l_ChangeHistoryService_0:TryBeginRecording("AvatarAutoSetup", "Avatar Auto Setup");
    local v138 = v134:Clone();
    v138:SetAttribute(v10.ATTRIBUTE_CREATED_BY_AUTO_SETUP, true);
    v138:SetAttribute(v10.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET, v136);
    local v139 = v40(v132, v138);
    v56(v138, v139);
    local l_Players_1 = game:GetService("Players");
    local l_HumanoidDescription_1 = Instance.new("HumanoidDescription");
    local l_l_Players_1_0 = l_Players_1 --[[ copy: 8 -> 11 ]];
    local l_l_HumanoidDescription_1_0 = l_HumanoidDescription_1 --[[ copy: 9 -> 12 ]];
    task.spawn(function() --[[ Line: 197 ]]
        -- upvalues: l_l_Players_1_0 (copy), l_l_HumanoidDescription_1_0 (copy), v138 (copy)
        local v144 = l_l_Players_1_0:CreateHumanoidModelFromDescription(l_l_HumanoidDescription_1_0, Enum.HumanoidRigType.R15, Enum.AssetTypeVerification.ClientOnly).Animate:Clone();
        v144.walk.WalkAnim.AnimationId = "rbxassetid://16562332340";
        v144.run.RunAnim.AnimationId = "rbxassetid://16562326358";
        v144.idle.Animation1.AnimationId = "rbxassetid://16562317918";
        v144.jump.JumpAnim.AnimationId = "rbxassetid://16562321958";
        v144.climb.ClimbAnim.AnimationId = "rbxassetid://16562307212";
        v144.fall.FallAnim.AnimationId = "rbxassetid://16562311455";
        v144.swim.Swim.AnimationId = "rbxassetid://16562311455";
        v144.Parent = v138;
    end);
    v131(v138, v139.proportions);
    v65(v138, v135);
    v122(v138, v135.accessories);
    v127(v138);
    v138.Parent = l_Workspace_0;
    l_Players_1, l_HumanoidDescription_1 = v138:GetBoundingBox();
    local v145 = l_Players_1:ToWorldSpace(CFrame.new(0, -l_HumanoidDescription_1.Y / 2, 0));
    v138.PrimaryPart.PivotOffset = v138.PrimaryPart.CFrame:ToObjectSpace(v145);
    v116(v138, v135);
    l_Players_1 = l_Workspace_0.CurrentCamera;
    if l_Players_1 ~= nil and v8.zoomIsRequired(l_Players_1, v138) then
        l_HumanoidDescription_1 = l_Players_1.ViewportSize.X / l_Players_1.ViewportSize.Y;
        v8.zoomToExtents(l_Players_1, v138, l_HumanoidDescription_1);
    end;
    v133:Set({
        v138
    });
    if v137 then
        l_ChangeHistoryService_0:FinishRecording(v137, Enum.FinishRecordingOperation.Commit);
    end;
end;
local function v181() --[[ Line: 491 ]] --[[ Name: useAutoSetupProcessor ]]
    -- upvalues: v12 (copy), v15 (copy), v14 (copy), v4 (copy), v10 (copy), v21 (copy), v17 (copy), v23 (copy), v9 (copy), v146 (copy), v25 (copy), v18 (copy), v19 (copy)
    local v147 = v12.ContextServices.Analytics:use();
    local v148 = v15:use():get();
    local v149 = v14.useContext(v4);
    local v150, v151 = v14.useState(function() --[[ Line: 496 ]]
        return nil;
    end);
    local v152, v153 = v14.useState(function() --[[ Line: 499 ]]
        return nil;
    end);
    local v154, v155 = v14.useState(function() --[[ Line: 502 ]]
        return nil;
    end);
    local v156, v157 = v14.useState(function() --[[ Line: 505 ]]
        return nil;
    end);
    local v158 = v14.useRef({});
    assert(v158.current ~= nil, v10.LUAU_ANALYZE_ERROR);
    if v21() then
        if shared["roblox.plugins.avatarCompatibilityPreviewer"] ~= nil then
            v158.current = shared["roblox.plugins.avatarCompatibilityPreviewer"];
        else
            shared["roblox.plugins.avatarCompatibilityPreviewer"] = v158.current;
        end;
    end;
    v14.useEffect(function() --[[ Line: 522 ]]
        -- upvalues: v152 (copy)
        local l_v152_0 = v152;
        if l_v152_0 == nil then
            return nil;
        else
            return function() --[[ Line: 527 ]]
                -- upvalues: l_v152_0 (copy)
                task.cancel(l_v152_0);
            end;
        end;
    end, {
        v152
    });
    local v160 = v14.useCallback(function() --[[ Line: 532 ]]
        -- upvalues: v155 (copy), v157 (copy)
        v155(nil);
        v157(nil);
    end, {
        v155, 
        v157
    });
    local v162 = v14.useCallback(function(v161) --[[ Line: 537 ]]
        -- upvalues: v155 (copy), v157 (copy), v151 (copy)
        v155("ErrorSourceFail");
        v157(v161);
        v151(nil);
    end, {
        v155, 
        v157, 
        v151
    });
    local v163, v164 = v14.useState(nil);
    local v165 = v14.useRef("");
    local v166 = v14.useRef(0);
    local v167 = v14.useContext(v17.Context);
    local v180 = v14.useCallback(function(v168) --[[ Line: 550 ]]
        -- upvalues: v153 (copy), v160 (copy), v23 (ref), v164 (copy), v9 (ref), v158 (copy), v10 (ref), v146 (ref), v167 (copy), v148 (copy), v149 (copy), v151 (copy), v162 (copy), v147 (copy), v165 (copy), v166 (copy), v25 (ref), v18 (ref), v19 (ref)
        v153(nil);
        v160();
        if v23() then
            v164({
                progressPercentage = 0, 
                progressName = "PreppingMesh", 
                completionStart = 0, 
                completionEnd = 0, 
                jobStatus = "Created", 
                jobId = ""
            });
        end;
        local v169 = os.clock();
        if v168.model == nil then
            error("Must have model");
            return;
        else
            local v170 = v9.computeHashSerializeContext({
                v168.model
            }, {
                ignoreUniformScaleChanges = false, 
                ignoreAccessories = true
            });
            local v171 = v9.hashCharacter(v168.model, v170);
            local v172 = v158.current[v171];
            if v172 ~= nil and v172.PrimaryPart ~= nil then
                local v173 = v172:GetAttribute(v10.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET) or "";
                task.spawn(function() --[[ Line: 581 ]]
                    -- upvalues: v146 (ref), v167 (ref), v148 (ref), v172 (copy), v168 (copy), v173 (copy), v149 (ref)
                    v146(v167, v148, v172, v168, v173);
                    if v149.autoSetupClickedSignal ~= nil then
                        v149.autoSetupClickedSignal:Fire();
                    end;
                end);
                return;
            else
                v151(v168);
                local v174 = nil;
                v174 = task.spawn(function() --[[ Line: 596 ]]
                    -- upvalues: v149 (ref), v168 (copy), v162 (ref), v147 (ref), v169 (copy), v171 (copy), v23 (ref), v165 (ref), v166 (ref), v25 (ref), v164 (ref), v158 (ref), v146 (ref), v167 (ref), v148 (ref), v151 (ref), v18 (ref), v19 (ref)
                    local l_status_0, l_result_0 = pcall(v149.uploadModelAsync, v168.model);
                    if not l_status_0 then
                        warn((("Something went wrong while uploading the model.\n%*"):format(l_result_0)));
                        v162(v168);
                        v147:report("autoSetupFailure", os.clock() - v169, "no model uploaded", v171);
                        return;
                    else
                        local l_status_1, l_result_1 = pcall(v149.startAutoSetupAsync, l_result_0, function(v177) --[[ Line: 609 ]]
                            -- upvalues: v23 (ref), v165 (ref), v166 (ref), v25 (ref), v164 (ref)
                            if v23() then
                                if v177.jobStatus == nil or v177.jobStatus == "" then
                                    return;
                                else
                                    if v177.jobStatus == "Created" then
                                        v165.current = v177.jobId;
                                        v166.current = v25[v177.jobStatus];
                                    elseif v165.current ~= v177.jobId then
                                        return;
                                    end;
                                    assert(v166.current ~= nil, "current progress stage is nil");
                                    if v25[v177.jobStatus] < v166.current then
                                        return;
                                    else
                                        v166.current = v25[v177.jobStatus];
                                        v164(v177);
                                    end;
                                end;
                            end;
                        end);
                        if l_status_1 then
                            v158.current[v171] = l_result_1;
                            task.spawn(function() --[[ Line: 636 ]]
                                -- upvalues: v146 (ref), v167 (ref), v148 (ref), l_result_1 (copy), v168 (ref), l_result_0 (copy), v151 (ref), v147 (ref), v169 (ref), v171 (ref), v18 (ref), v19 (ref)
                                v146(v167, v148, l_result_1, v168, l_result_0);
                                v151(nil);
                                v147:report("autoSetupFinish", os.clock() - v169, l_result_0, v171);
                                v147:report("autoSetupAssetsGenerated", v18(l_result_0), v19(l_result_1));
                            end);
                            return;
                        else
                            warn((("Something went wrong while performing auto setup.\n%*"):format(l_result_1)));
                            v162(v168);
                            v147:report("autoSetupFailure", os.clock() - v169, l_result_0 or "no model uploaded", v171);
                            return;
                        end;
                    end;
                end);
                v153(v174);
                if v149.autoSetupClickedSignal ~= nil then
                    v149.autoSetupClickedSignal:Fire();
                end;
                return;
            end;
        end;
    end, {
        v149.startAutoSetupAsync, 
        v149.uploadModelAsync, 
        v167
    });
    return {
        cancelAutoSetup = v14.useCallback(function() --[[ Line: 671 ]]
            -- upvalues: v153 (copy), v151 (copy)
            v153(nil);
            v151(nil);
        end, {}), 
        startAutoSetup = v180, 
        activeTarget = v150, 
        lastErrorType = v154, 
        lastErrorTarget = v156, 
        clearError = v160, 
        progressState = v163
    };
end;
return function(v182) --[[ Line: 694 ]] --[[ Name: useAutoSetupState ]]
    -- upvalues: v20 (copy), v181 (copy), v14 (copy), v23 (copy)
    assert(v20(), "getFFlagAvatarPreviewerUseAnyModel() is enabled");
    local v183 = v181();
    return {
        state = v14.useMemo(function() --[[ Line: 700 ]]
            -- upvalues: v183 (copy), v23 (ref), v182 (copy)
            if v183.activeTarget then
                return {
                    type = "inAutoSetup", 
                    target = v183.activeTarget, 
                    progressState = if v23() then v183.progressState else nil
                };
            elseif v183.lastErrorType and v183.lastErrorTarget then
                return {
                    type = "error", 
                    target = v182 or v183.lastErrorTarget, 
                    error = v183.lastErrorType
                };
            elseif v182 then
                return {
                    type = "hasSelection", 
                    target = v182
                };
            else
                return {
                    type = "none"
                };
            end;
        end, {
            v183.activeTarget, 
            v183.lastErrorType, 
            v183.lastErrorTarget, 
            v182, 
            v183.progressState
        }), 
        cancelAutoSetup = v183.cancelAutoSetup, 
        clearError = v183.clearError, 
        startAutoSetup = v14.useCallback(function() --[[ Line: 733 ]]
            -- upvalues: v182 (copy), v183 (copy)
            if v182 then
                return v183.startAutoSetup(v182);
            else
                return;
            end;
        end, {
            v182
        })
    };
end;
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Components.TestingInterfaceContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v10 = require(l_script_FirstAncestor_0.Src.Util.isAvatar);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useAsync);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useClothingFromInstances);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v14 = require(l_script_FirstAncestor_0.Src.Hooks.useMoveAccessoriesAlongsideAttachments);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.usePreviewHumanoidDescription);
local function v17(v16) --[[ Line: 21 ]] --[[ Name: GiveDummyInstancesClothing ]]
    -- upvalues: v12 (copy), v14 (copy)
    v12(v16.dummy);
    v14(v16.dummy);
end;
local function _(v18) --[[ Line: 29 ]] --[[ Name: wrapTargetOf ]]
    return v18:FindFirstChildWhichIsA("WrapTarget");
end;
local function v27(v20) --[[ Line: 33 ]] --[[ Name: useBringBackBaseAccessories ]]
    -- upvalues: v4 (copy)
    local v24 = v4.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v20 (copy)
        local v21 = {};
        for _, v23 in v20:GetChildren() do
            if v23:IsA("Accessory") and v23.Archivable then
                table.insert(v21, v23:Clone());
            end;
        end;
        return v21;
    end, {
        v20
    });
    return v4.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: v24 (copy), v20 (copy)
        for _, v26 in v24 do
            v26:Clone().Parent = v20;
        end;
    end, {
        v24
    });
end;
local function v64(v28, v29) --[[ Line: 53 ]] --[[ Name: useBringBackBaseBodyParts ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), v8 (copy), l_UGCValidationService_0 (copy)
    local v33 = v4.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v28 (copy), v2 (ref)
        local v30 = {};
        for _, v32 in v28:GetChildren() do
            if v32:IsA("BasePart") and v32.Archivable then
                assert(v32:IsA("BasePart"), "Luau");
                if v2.BODY_PART_TO_LIMB_NAME[v32.Name] ~= nil then
                    table.insert(v30, v32:Clone());
                end;
            end;
        end;
        return v30;
    end, {
        v28
    });
    local v38 = v4.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v33 (copy), v2 (ref), v29 (copy)
        local v34 = {};
        for _, v36 in v33 do
            local v37 = v2.BODY_PART_TO_LIMB_NAME[v36.Name];
            if v37 ~= nil and v29[v37] == 0 then
                table.insert(v34, v36);
            end;
        end;
        return v34;
    end, {
        v33, 
        v29
    });
    local v39 = v5.useRefToState(v38);
    local function v45(v40) --[[ Line: 94 ]] --[[ Name: replaceParts ]]
        -- upvalues: v28 (copy), v8 (ref), l_UGCValidationService_0 (ref)
        local l_Humanoid_0 = v28:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_0 == nil then
            return;
        else
            assert(l_Humanoid_0:IsA("Humanoid"), "Luau");
            for _, v43 in v40 do
                local v44 = v43:Clone();
                if v8() then
                    l_UGCValidationService_0:ResetCollisionFidelity(v44, Enum.CollisionFidelity.Default);
                end;
                l_Humanoid_0:ReplaceBodyPartR15(Enum.BodyPartR15[v43.Name], v44);
            end;
            return;
        end;
    end;
    return (v4.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: v33 (copy), v39 (copy), v28 (copy), v2 (ref), v45 (copy)
        local v46 = {};
        for _, v48 in v33 do
            if table.find(v39.current, v48) ~= nil then
                local l_v28_FirstChild_0 = v28:FindFirstChild(v48.Name);
                if l_v28_FirstChild_0 ~= nil then
                    local v50 = {};
                    for _, v52 in l_v28_FirstChild_0:GetChildren() do
                        if v52:IsA("Attachment") then
                            v50[v52.Name] = v52.CFrame;
                        end;
                    end;
                    local l_WrapTarget_0 = l_v28_FirstChild_0:FindFirstChildWhichIsA("WrapTarget");
                    local v54 = l_WrapTarget_0 and l_WrapTarget_0:GetVertices(Enum.CageType.Outer);
                    table.insert(v46, function() --[[ Line: 134 ]]
                        -- upvalues: v28 (ref), l_v28_FirstChild_0 (copy), v2 (ref), v50 (copy), v54 (copy)
                        local l_v28_FirstChild_1 = v28:FindFirstChild(l_v28_FirstChild_0.Name);
                        if l_v28_FirstChild_1 == nil then
                            return;
                        else
                            assert(l_v28_FirstChild_1 ~= nil, v2.LUAU_ANALYZE_ERROR);
                            for v56, v57 in v50 do
                                local l_l_v28_FirstChild_1_FirstChild_0 = l_v28_FirstChild_1:FindFirstChild(v56);
                                if l_l_v28_FirstChild_1_FirstChild_0 ~= nil and l_l_v28_FirstChild_1_FirstChild_0:IsA("Attachment") then
                                    local v59 = false;
                                    if l_l_v28_FirstChild_1_FirstChild_0 ~= nil then
                                        v59 = l_l_v28_FirstChild_1_FirstChild_0:IsA("Attachment");
                                    end;
                                    assert(v59, v2.LUAU_ANALYZE_ERROR);
                                    l_l_v28_FirstChild_1_FirstChild_0.CFrame = v57;
                                    local l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0 = l_l_v28_FirstChild_1_FirstChild_0:FindFirstChild(v2.ORIGINAL_POSITION_VALUE);
                                    if l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0 ~= nil and l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0:IsA("Vector3Value") then
                                        l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0.Value = v57.Position;
                                    end;
                                end;
                            end;
                            local l_WrapTarget_1 = l_v28_FirstChild_1:FindFirstChildWhichIsA("WrapTarget");
                            if l_WrapTarget_1 ~= nil and v54 ~= nil then
                                l_WrapTarget_1:ModifyVertices(Enum.CageType.Outer, v54);
                            end;
                            return;
                        end;
                    end);
                end;
            end;
        end;
        v45(v33);
        for _, v63 in v46 do
            v63();
        end;
    end, {
        v33, 
        v28
    }));
end;
return function(v65) --[[ Line: 173 ]] --[[ Name: RepresentEditorStateOnWorldModel ]]
    -- upvalues: v9 (copy), v4 (copy), v3 (copy), v6 (copy), v15 (copy), v27 (copy), v64 (copy), v5 (copy), v10 (copy), v13 (copy), v11 (copy), v17 (copy)
    assert(v9(), "RepresentEditorStateOnWorldModle required FFlagAvatarPreviewerEditingTools");
    local v66 = v4.useContext(v3);
    local v67 = v4.useContext(v6.Context);
    v4.useEffect(function() --[[ Line: 185 ]]
        -- upvalues: v66 (copy)
        return v66.startIgnoringChildren();
    end, {
        v66.startIgnoringChildren
    });
    local v68 = v15({
        WorldModel = v65.worldModel, 
        ProportionalScale = v65.worldModel:GetScale(), 
        WorldModelScale = v65.worldModel:GetScale(), 
        LatestWorldModelHash = ""
    }, {}, {
        includeAccessories = v65.includeAccessories, 
        resetIncludesBodyParts = false
    });
    local v69 = v27(v65.worldModel);
    local v70 = v64(v65.worldModel, v68);
    local v71 = v5.useRefToState(v69);
    local v72 = v5.useRefToState(v70);
    v4.useEffect(function() --[[ Line: 206 ]]
        -- upvalues: v65 (copy), v10 (ref), v71 (copy), v72 (copy), v67 (copy)
        local l_BodyColors_0 = v65.worldModel:FindFirstChildWhichIsA("BodyColors");
        if l_BodyColors_0 ~= nil then
            l_BodyColors_0 = l_BodyColors_0:Clone();
        end;
        return function() --[[ Line: 212 ]]
            -- upvalues: v10 (ref), v65 (ref), v71 (ref), v72 (ref), l_BodyColors_0 (ref), v67 (ref)
            if not v10(v65.worldModel) then
                return;
            else
                if v65.includeAccessories then
                    for _, v75 in v65.worldModel:GetChildren() do
                        if v75:IsA("Accessory") then
                            v75:Destroy();
                        end;
                    end;
                    v71.current();
                end;
                v72.current();
                if l_BodyColors_0 ~= nil then
                    local l_BodyColors_1 = v65.worldModel:FindFirstChildWhichIsA("BodyColors");
                    if l_BodyColors_1 ~= nil then
                        l_BodyColors_1:Destroy();
                    end;
                    l_BodyColors_0.Parent = v65.worldModel;
                end;
                if v67.onRepresentEditorStateOnWorldModelUnmounted ~= nil then
                    task.defer(function() --[[ Line: 241 ]]
                        -- upvalues: v67 (ref)
                        v67.onRepresentEditorStateOnWorldModelUnmounted:Fire();
                    end);
                end;
                return;
            end;
        end;
    end, {
        v65.includeAccessories, 
        v69, 
        v70
    });
    local v77 = v13();
    v11(function() --[[ Line: 250 ]]
        -- upvalues: v65 (copy), v68 (copy), v69 (copy), v67 (copy), v77 (copy)
        v65.worldModel.Humanoid:ApplyDescriptionReset(v68);
        if not v65.includeAccessories then
            v69();
        end;
        if v67.onRepresentEditorStateOnWorldModelDescriptionApplied ~= nil then
            task.defer(function() --[[ Line: 258 ]]
                -- upvalues: v67 (ref)
                v67.onRepresentEditorStateOnWorldModelDescriptionApplied:Fire();
            end);
        end;
        v77.increment();
        return nil;
    end, {
        v68, 
        v69
    });
    if v65.includeAccessories and v77.amount > 0 then
        return v4.createElement(v17, {
            key = ("GiveDummyInstancesClothing%*"):format(v77.amount), 
            dummy = v65.worldModel
        });
    else
        return nil;
    end;
end;
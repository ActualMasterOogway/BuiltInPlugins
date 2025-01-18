local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.OriginalLimbContext);
local v3 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUseSerializedState);
local function v12(v8, v9) --[[ Line: 18 ]] --[[ Name: markLimbsAsOriginal ]]
    for _, v11 in v9:GetDescendants() do
        if v11:IsA("BasePart") then
            v8.markLimbAsOriginal(v11);
        end;
    end;
end;
local function _(v13, v14) --[[ Line: 28 ]] --[[ Name: replicateAnimationScript ]]
    local l_Animate_0 = v14:FindFirstChild("Animate");
    if not l_Animate_0 then
        return;
    else
        local l_Animate_1 = v13:FindFirstChild("Animate");
        if l_Animate_1 then
            l_Animate_1:Remove();
        end;
        l_Animate_0:Clone().Parent = v13;
        return;
    end;
end;
local v18 = {
    "BodyDepthScale", 
    "BodyWidthScale", 
    "BodyHeightScale", 
    "HeadScale", 
    "BodyTypeScale", 
    "BodyProportionScale"
};
local function v28(v19, v20) --[[ Line: 54 ]] --[[ Name: reapplyHumanoidScaleProperties ]]
    -- upvalues: v18 (copy)
    local l_Humanoid_0 = v20:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 == nil then
        return;
    else
        local l_Humanoid_1 = v19:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_1 == nil then
            return;
        else
            local v23 = false;
            for _, v25 in v18 do
                local l_l_Humanoid_0_FirstChild_0 = l_Humanoid_0:FindFirstChild(v25);
                if l_l_Humanoid_0_FirstChild_0 and l_l_Humanoid_0_FirstChild_0:IsA("NumberValue") then
                    local l_l_Humanoid_1_FirstChild_0 = l_Humanoid_1:FindFirstChild(v25);
                    if l_l_Humanoid_1_FirstChild_0 and l_l_Humanoid_1_FirstChild_0:IsA("NumberValue") and l_l_Humanoid_1_FirstChild_0.Value ~= l_l_Humanoid_0_FirstChild_0.Value then
                        l_l_Humanoid_1_FirstChild_0.Value = l_l_Humanoid_0_FirstChild_0.Value;
                        v23 = true;
                    end;
                end;
            end;
            if v23 then
                l_Humanoid_1:BuildRigFromAttachments();
            end;
            return;
        end;
    end;
end;
local function v40(v29, v30) --[[ Line: 89 ]] --[[ Name: DEPRECATED_useDummyFromHumanoidDescription ]]
    -- upvalues: v6 (copy), v1 (copy), v2 (copy), v7 (copy), v12 (copy), v3 (copy), v4 (copy)
    assert(not v6(), "getFFlagAvatarPreviewerUseAnyModel() is enabled");
    local v31, v32 = v1.useState(nil);
    local v33 = v1.useRef(v31);
    local v34 = v1.useContext(v2);
    v1.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v32 (copy)
        v32(nil);
    end, {
        v29
    });
    if v7() then
        v1.useEffect(function() --[[ Line: 105 ]]
            -- upvalues: v29 (copy), v12 (ref), v34 (copy), v3 (ref), v4 (ref), v32 (copy), v30 (copy)
            local v35 = v29:Clone();
            v12(v34, v35);
            v3(v35, v4.ALL_ALLOWED_PART_NAMES);
            v32(v35);
            local v36 = nil;
            v36 = v35.AncestryChanged:Connect(function() --[[ Line: 114 ]]
                -- upvalues: v35 (copy), v36 (ref), v30 (ref)
                if v35:IsDescendantOf(game) then
                    v36:Disconnect();
                    v35.Humanoid:ApplyDescription(v30);
                end;
            end);
            return function() --[[ Line: 121 ]]
                -- upvalues: v36 (ref)
                v36:Disconnect();
            end;
        end, {
            v29
        });
        v1.useEffect(function() --[[ Line: 126 ]]
            -- upvalues: v31 (copy), v30 (copy)
            if v31 == nil or not v31:IsDescendantOf(game) then
                return;
            else
                task.spawn(function() --[[ Line: 131 ]]
                    -- upvalues: v31 (ref), v30 (ref)
                    v31.Humanoid:ApplyDescription(v30);
                end);
                return;
            end;
        end, {
            v31, 
            v30
        });
        return v31;
    else
        v1.useEffect(function() --[[ Line: 136 ]]
            -- upvalues: v31 (copy), v33 (copy)
            if v31 == nil and v33.current ~= nil then
                v33.current.Parent = nil;
                return;
            else
                v33.current = v31;
                return;
            end;
        end, {
            v31
        });
        v1.useEffect(function() --[[ Line: 147 ]]
            -- upvalues: v33 (copy), v29 (copy), v12 (ref), v34 (copy), v3 (ref), v4 (ref), v32 (copy), v30 (copy)
            local l_current_0 = v33.current;
            if l_current_0 == nil or not l_current_0:IsDescendantOf(game) then
                local v38 = v29:Clone();
                v12(v34, v38);
                v3(v38, v4.ALL_ALLOWED_PART_NAMES);
                v32(v38);
                if not v38:IsDescendantOf(game) then
                    local v39 = nil;
                    v39 = v38.AncestryChanged:Connect(function() --[[ Line: 159 ]]
                        -- upvalues: v38 (copy), v39 (ref), v30 (ref)
                        if v38:IsDescendantOf(game) then
                            v39:Disconnect();
                            v38.Humanoid:ApplyDescription(v30);
                        end;
                    end);
                    return function() --[[ Line: 166 ]]
                        -- upvalues: v39 (ref)
                        v39:Disconnect();
                    end;
                else
                    return nil;
                end;
            else
                assert(l_current_0 ~= nil, v4.LUAU_ANALYZE_ERROR);
                task.spawn(function() --[[ Line: 175 ]]
                    -- upvalues: l_current_0 (copy), v30 (ref)
                    l_current_0.Humanoid:ApplyDescription(v30);
                end);
                return nil;
            end;
        end, {
            v29, 
            v30
        });
        return v31;
    end;
end;
return function(v41, v42) --[[ Line: 192 ]] --[[ Name: useDummyFromHumanoidDescription ]]
    -- upvalues: v6 (copy), v40 (copy), v1 (copy), v2 (copy), v12 (copy), v3 (copy), v4 (copy), v28 (copy)
    if not v6() then
        return (v40(v41.WorldModel, v42));
    else
        local v43 = v1.useContext(v2);
        local v44, v45 = v1.useState({});
        v1.useEffect(function() --[[ Line: 200 ]]
            -- upvalues: v45 (copy)
            v45({});
        end, {
            v41.LatestWorldModelHash
        });
        v1.useEffect(function() --[[ Line: 204 ]]
            -- upvalues: v41 (copy), v12 (ref), v43 (copy), v3 (ref), v4 (ref), v45 (copy), v42 (copy), v28 (ref)
            local v46 = v41.WorldModel:Clone();
            v12(v43, v46);
            v3(v46, v4.ALL_ALLOWED_PART_NAMES);
            local l_Animate_2 = v41.WorldModel:FindFirstChild("Animate");
            if l_Animate_2 then
                local l_Animate_3 = v46:FindFirstChild("Animate");
                if l_Animate_3 then
                    l_Animate_3:Remove();
                end;
                l_Animate_2:Clone().Parent = v46;
            end;
            v45({
                dummy = v46, 
                initialProportionScale = v41.ProportionalScale, 
                initialWorldModelScale = v41.WorldModelScale
            });
            local v49 = nil;
            v49 = v46.AncestryChanged:Connect(function() --[[ Line: 217 ]]
                -- upvalues: v46 (copy), v49 (ref), v42 (ref), v41 (ref), v28 (ref)
                if v46:IsDescendantOf(game) then
                    v49:Disconnect();
                    v46.Humanoid:ApplyDescription(v42);
                    local l_v46_0 = v46;
                    local l_Animate_4 = v41.WorldModel:FindFirstChild("Animate");
                    if l_Animate_4 then
                        local l_Animate_5 = l_v46_0:FindFirstChild("Animate");
                        if l_Animate_5 then
                            l_Animate_5:Remove();
                        end;
                        l_Animate_4:Clone().Parent = l_v46_0;
                    end;
                    v28(v46, v41.WorldModel);
                end;
            end);
            return function() --[[ Line: 226 ]]
                -- upvalues: v49 (ref)
                v49:Disconnect();
            end;
        end, {
            v41.WorldModel, 
            v41.LatestWorldModelHash
        });
        v1.useEffect(function() --[[ Line: 231 ]]
            -- upvalues: v44 (copy), v42 (copy), v41 (copy), v28 (ref)
            if v44.dummy == nil or not v44.dummy:IsDescendantOf(game) then
                return;
            else
                local v58 = task.spawn(function() --[[ Line: 236 ]]
                    -- upvalues: v44 (ref), v42 (ref), v41 (ref), v28 (ref)
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 237 ]]
                        -- upvalues: v44 (ref), v42 (ref)
                        v44.dummy.Humanoid:ApplyDescription(v42);
                    end);
                    if not l_status_0 then
                        if not v44.dummy:IsDescendantOf(game) then
                            return;
                        else
                            error("Failed to apply description to dummy", l_result_0);
                        end;
                    end;
                    local l_dummy_0 = v44.dummy;
                    local l_Animate_6 = v41.WorldModel:FindFirstChild("Animate");
                    if l_Animate_6 then
                        local l_Animate_7 = l_dummy_0:FindFirstChild("Animate");
                        if l_Animate_7 then
                            l_Animate_7:Remove();
                        end;
                        l_Animate_6:Clone().Parent = l_dummy_0;
                    end;
                    v28(v44.dummy, v41.WorldModel);
                end);
                return function() --[[ Line: 253 ]]
                    -- upvalues: v58 (copy)
                    task.cancel(v58);
                end;
            end;
        end, {
            v44.dummy, 
            v42, 
            v41.WorldModel
        });
        v1.useEffect(function() --[[ Line: 259 ]]
            -- upvalues: v44 (copy), v41 (copy)
            local l_dummy_1 = v44.dummy;
            local l_initialProportionScale_0 = v44.initialProportionScale;
            local l_initialWorldModelScale_0 = v44.initialWorldModelScale;
            if l_dummy_1 == nil or l_initialProportionScale_0 == nil or l_initialWorldModelScale_0 == nil then
                return;
            else
                local v62 = l_initialWorldModelScale_0 * (v41.ProportionalScale / l_initialProportionScale_0);
                if math.abs(l_dummy_1:GetScale() - v62) >= 0.001 then
                    l_dummy_1:ScaleTo(v62);
                    l_dummy_1.Humanoid:BuildRigFromAttachments();
                end;
                return;
            end;
        end, {
            v44.dummy, 
            v44.initialProportionScale, 
            v44.initialWorldModelScale, 
            v41.ProportionalScale
        });
        return v44.dummy;
    end;
end;
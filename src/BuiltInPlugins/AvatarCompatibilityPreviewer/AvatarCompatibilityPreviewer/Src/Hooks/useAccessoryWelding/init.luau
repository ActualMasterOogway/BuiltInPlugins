local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v7 = game:DefineFastFlag("AvatarPreviewerFixCustomShoesTeamCreate", false);
local l_AccessoryUtil_0 = v1.Util.AccessoryAndBodyToolShared.AccessoryUtil;
local function v19(v9, v10, v11) --[[ Line: 18 ]] --[[ Name: alignLayeredClothing ]]
    -- upvalues: v4 (copy)
    local l_WrapLayer_0 = v11:FindFirstChildWhichIsA("WrapLayer");
    if l_WrapLayer_0 == nil then
        return nil;
    else
        assert(l_WrapLayer_0 ~= nil, v4.LUAU_ANALYZE_ERROR);
        local l_v9_FirstChildWhichIsA_0 = v9:FindFirstChildWhichIsA("WrapTarget", true);
        if l_v9_FirstChildWhichIsA_0 == nil then
            return nil;
        else
            local l_CFrame_0 = v9.CFrame;
            local l_ImportOriginWorld_0 = l_v9_FirstChildWhichIsA_0.ImportOriginWorld;
            local l_CageOrigin_0 = l_WrapLayer_0.CageOrigin;
            local l_ImportOrigin_0 = l_WrapLayer_0.ImportOrigin;
            local v18 = l_ImportOriginWorld_0:Inverse();
            return l_CageOrigin_0 * l_ImportOrigin_0 * v18 * l_CFrame_0 * v10;
        end;
    end;
end;
return function(v20) --[[ Line: 49 ]] --[[ Name: useAccessoryWelding ]]
    -- upvalues: v3 (copy), v4 (copy), l_AccessoryUtil_0 (copy), v19 (copy), v6 (copy), v7 (copy), v2 (copy)
    v3.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v20 (copy), v4 (ref), l_AccessoryUtil_0 (ref), v19 (ref), v6 (ref), v7 (ref), v2 (ref)
        if v20 == nil then
            return nil;
        else
            assert(v20 ~= nil, v4.LUAU_ANALYZE_ERROR);
            local v21 = {};
            local function v26(v22, v23) --[[ Line: 66 ]] --[[ Name: updateWeld ]]
                -- upvalues: l_AccessoryUtil_0 (ref), v20 (ref), v19 (ref), v6 (ref)
                local v24, v25 = l_AccessoryUtil_0:findMatchingAccessoryAndAvatarAttachments(v22, v20);
                if v25 == nil then
                    return nil;
                else
                    v23.Part0 = v22;
                    v23.C0 = v19(v25.Parent, v25.CFrame, v22) or v24.CFrame;
                    v23.C1 = v25.CFrame;
                    v23.Part1 = v25.Parent;
                    if v6() then
                        v23.Name = "AccessoryWeld";
                    end;
                    v23.Parent = v22;
                    return v25.Parent;
                end;
            end;
            local function v31(v27) --[[ Line: 90 ]] --[[ Name: processAccessory ]]
                -- upvalues: v4 (ref), v7 (ref), v26 (copy), v21 (ref)
                local l_Handle_0 = v27:FindFirstChild("Handle");
                if l_Handle_0 == nil or not l_Handle_0:IsA("BasePart") then
                    return;
                else
                    local v29 = false;
                    if l_Handle_0 ~= nil then
                        v29 = l_Handle_0:IsA("BasePart");
                    end;
                    assert(v29, v4.LUAU_ANALYZE_ERROR);
                    local v30 = nil;
                    if v7 then
                        v30 = l_Handle_0:FindFirstChildWhichIsA("Weld") or Instance.new("Weld");
                    elseif l_Handle_0:FindFirstChildWhichIsA("Weld") ~= nil then
                        return;
                    else
                        v30 = Instance.new("Weld");
                    end;
                    v29 = v26(l_Handle_0, v30);
                    table.insert(v21, {
                        accessoryHandle = l_Handle_0, 
                        limb = v29, 
                        weld = v30
                    });
                    return;
                end;
            end;
            local function v34() --[[ Line: 119 ]] --[[ Name: tryReconnectWelds ]]
                -- upvalues: v21 (ref), v26 (copy)
                for _, v33 in v21 do
                    if v33.limb == nil then
                        v33.limb = v26(v33.accessoryHandle, v33.weld);
                    end;
                end;
            end;
            local function v36(v35) --[[ Line: 127 ]] --[[ Name: processChild ]]
                -- upvalues: v31 (copy), v34 (copy)
                if v35:IsA("Accessory") then
                    task.delay(0.1, v31, v35);
                    return;
                else
                    if v35:IsA("BasePart") then
                        v34();
                    end;
                    return;
                end;
            end;
            local function v41(v37) --[[ Line: 137 ]] --[[ Name: childRemoved ]]
                -- upvalues: v21 (ref), v2 (ref)
                if v37:IsA("Accessory") then
                    v21 = v2.filter(v21, function(v38) --[[ Line: 139 ]]
                        -- upvalues: v37 (copy)
                        return v38.accessoryHandle.Parent ~= v37;
                    end);
                    return;
                else
                    if v37:IsA("BasePart") then
                        for _, v40 in v21 do
                            if v40.limb == v37 then
                                v40.weld.Parent = nil;
                                v40.limb = nil;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
            for _, v43 in v20:GetChildren() do
                if v43:IsA("Accessory") then
                    task.delay(0.1, v31, v43);
                elseif v43:IsA("BasePart") then
                    v34();
                end;
            end;
            local v44 = v20.ChildAdded:Connect(v36);
            local v45 = v20.ChildRemoved:Connect(v41);
            return function() --[[ Line: 159 ]]
                -- upvalues: v44 (copy), v45 (copy)
                v44:Disconnect();
                v45:Disconnect();
            end;
        end;
    end, {
        v20
    });
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local function v14(v6, v7, v8) --[[ Line: 12 ]] --[[ Name: findCorrespondingInstance ]]
    -- upvalues: v2 (copy)
    local v9 = {};
    local l_v7_0 = v7;
    repeat
        assert(l_v7_0 ~= nil, "Iterating reference is nil");
        table.insert(v9, l_v7_0.Name);
        l_v7_0 = l_v7_0.Parent;
        if l_v7_0 == nil then
            error((("Reference child wasn't a part of reference. Was looking for %*"):format((v7:GetFullName()))));
        end;
    until l_v7_0 == v6;
    local l_v8_0 = v8;
    for v12 = #v9, 1, -1 do
        local l_l_v8_0_FirstChild_0 = l_v8_0:FindFirstChild(v9[v12]);
        if l_l_v8_0_FirstChild_0 == nil then
            return nil;
        else
            assert(l_l_v8_0_FirstChild_0 ~= nil, v2.LUAU_ANALYZE_ERROR);
            l_v8_0 = l_l_v8_0_FirstChild_0;
        end;
    end;
    if l_v8_0.ClassName ~= v7.ClassName then
        return nil;
    else
        return l_v8_0;
    end;
end;
return function(v15, v16, v17) --[[ Line: 49 ]] --[[ Name: useCopyPropertyChanges ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v14 (copy), v5 (copy)
    v1.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v16 (copy), v2 (ref), v4 (ref), v15 (copy), v14 (ref), v5 (ref), v17 (copy)
        if v16 == nil then
            return nil;
        else
            assert(v16 ~= nil, v2.LUAU_ANALYZE_ERROR);
            if v4() and v15 == nil then
                return nil;
            else
                assert(v15 ~= nil, v2.LUAU_ANALYZE_ERROR);
                local v18 = {};
                local function _(v19, v20) --[[ Line: 70 ]] --[[ Name: copyProperty ]]
                    -- upvalues: v14 (ref), v15 (ref), v16 (ref), v2 (ref)
                    local v21 = v14(v15, v19, v16);
                    if v21 == nil then
                        return;
                    else
                        assert(v21 ~= nil, v2.LUAU_ANALYZE_ERROR);
                        v21[v20] = v19[v20];
                        return;
                    end;
                end;
                local function v37(v23) --[[ Line: 81 ]] --[[ Name: attachChild ]]
                    -- upvalues: v18 (copy), v14 (ref), v15 (ref), v16 (ref), v2 (ref), v5 (ref), v17 (ref), v4 (ref)
                    if v23:IsA("Attachment") then
                        v18[v23] = {};
                        table.insert(v18[v23], v23:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 87 ]]
                            -- upvalues: v23 (copy), v14 (ref), v15 (ref), v16 (ref), v2 (ref), v5 (ref)
                            if not v23:IsDescendantOf(game) then
                                return;
                            else
                                local l_v23_0 = v23;
                                local v25 = v14(v15, l_v23_0, v16);
                                if v25 ~= nil then
                                    assert(v25 ~= nil, v2.LUAU_ANALYZE_ERROR);
                                    v25.CFrame = l_v23_0.CFrame;
                                end;
                                if not v5() then
                                    for _, v27 in v16:GetChildren() do
                                        if v27:IsA("Accessory") then
                                            local l_Handle_0 = v27:FindFirstChild("Handle");
                                            if l_Handle_0 ~= nil then
                                                assert(l_Handle_0 ~= nil, v2.LUAU_ANALYZE_ERROR);
                                                local l_l_Handle_0_FirstChild_0 = l_Handle_0:FindFirstChild(v23.Name);
                                                if l_l_Handle_0_FirstChild_0 ~= nil and l_l_Handle_0_FirstChild_0:IsA("Attachment") then
                                                    local v30 = false;
                                                    if l_l_Handle_0_FirstChild_0 ~= nil then
                                                        v30 = l_l_Handle_0_FirstChild_0:IsA("Attachment");
                                                    end;
                                                    assert(v30, v2.LUAU_ANALYZE_ERROR);
                                                    local l_AccessoryWeld_0 = l_Handle_0:FindFirstChild("AccessoryWeld");
                                                    if l_AccessoryWeld_0 ~= nil and l_AccessoryWeld_0:IsA("Weld") then
                                                        local v32 = false;
                                                        if l_AccessoryWeld_0 ~= nil then
                                                            v32 = l_AccessoryWeld_0:IsA("Weld");
                                                        end;
                                                        assert(v32, v2.LUAU_ANALYZE_ERROR);
                                                        l_AccessoryWeld_0.C0 = l_l_Handle_0_FirstChild_0.CFrame;
                                                        l_AccessoryWeld_0.C1 = v23.CFrame;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                return;
                            end;
                        end));
                        return;
                    elseif v23:IsA("ValueBase") then
                        v18[v23] = {
                            v23:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 132 ]]
                                -- upvalues: v23 (copy), v14 (ref), v15 (ref), v16 (ref), v2 (ref), v17 (ref), v5 (ref)
                                local l_v23_1 = v23;
                                local v34 = v14(v15, l_v23_1, v16);
                                if v34 ~= nil then
                                    assert(v34 ~= nil, v2.LUAU_ANALYZE_ERROR);
                                    v34.Value = l_v23_1.Value;
                                end;
                                if v17 ~= nil and (not v5() or v23.Name ~= v2.ORIGINAL_POSITION_VALUE) then
                                    v17();
                                end;
                            end)
                        };
                        return;
                    else
                        if v4() and v23:IsA("BaseWrap") then
                            v18[v23] = {
                                v23.VerticesModified:Connect(function(v35) --[[ Line: 148 ]]
                                    -- upvalues: v14 (ref), v15 (ref), v23 (copy), v16 (ref)
                                    local v36 = v14(v15, v23, v16);
                                    if v36 == nil then
                                        return;
                                    else
                                        assert(v36:IsA("BaseWrap"), "Corresponding instance does not match class name");
                                        v36:ModifyVertices(Enum.CageType.Outer, v35);
                                        return;
                                    end;
                                end)
                            };
                        end;
                        return;
                    end;
                end;
                for _, v39 in v15:GetDescendants() do
                    v37(v39);
                end;
                local v40 = v15.DescendantAdded:Connect(v37);
                local v45 = v15.DescendantRemoving:Connect(function(v41) --[[ Line: 170 ]]
                    -- upvalues: v18 (copy)
                    local v42 = v18[v41];
                    if v42 == nil then
                        return;
                    else
                        for _, v44 in v42 do
                            v44:Disconnect();
                        end;
                        return;
                    end;
                end);
                return function() --[[ Line: 181 ]]
                    -- upvalues: v40 (copy), v45 (copy), v18 (copy)
                    v40:Disconnect();
                    v45:Disconnect();
                    for _, v47 in v18 do
                        for _, v49 in v47 do
                            v49:Disconnect();
                        end;
                    end;
                end;
            end;
        end;
    end, {
        v15, 
        v16
    });
end;
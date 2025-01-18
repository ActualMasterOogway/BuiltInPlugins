local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_GeometryService_0 = game:GetService("GeometryService");
local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local v6 = require(l_script_FirstAncestor_0.Src.Components.AutoSetupContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.CameraUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v10 = require(l_script_FirstAncestor_0.Src.Util.assetUriToId);
local v11 = require(l_script_FirstAncestor_0.Src.Util.findUnderlyingMeshAssetIds);
local v12 = require(l_script_FirstAncestor_0.Src.Util.guessProportions);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAxisAlignedOutput);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerOutputModelSuffix);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioAvatarAutosetupReportsProgress);
local l_Analytics_0 = v4.ContextServices.Analytics;
local function _(v19) --[[ Line: 31 ]] --[[ Name: stateFromTarget ]]
    if v19 == nil then
        return {
            type = "none"
        };
    else
        return {
            type = "hasSelection", 
            target = v19
        };
    end;
end;
return function(v21) --[[ Line: 42 ]] --[[ Name: useAutoSetupState ]]
    -- upvalues: v16 (copy), l_Analytics_0 (copy), v5 (copy), v6 (copy), v9 (copy), v8 (copy), l_ChangeHistoryService_0 (copy), v15 (copy), l_Workspace_0 (copy), v12 (copy), v10 (copy), v14 (copy), v7 (copy), l_GeometryService_0 (copy), v17 (copy), v11 (copy)
    assert(not v16(), "getFFlagAvatarPreviewerUseAnyModel() is enabled");
    local v22 = l_Analytics_0:use();
    local v23 = v5.useContext(v6);
    local v24 = v9:use():get();
    local v25, v26 = v5.useState(if v21 == nil then {
        type = "none"
    } else {
        type = "hasSelection", 
        target = v21
    });
    v5.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v26 (copy), v21 (copy)
        v26(function(v27) --[[ Line: 58 ]]
            -- upvalues: v21 (ref)
            if v27.type == "none" then
                local l_v21_0 = v21;
                if l_v21_0 == nil then
                    return {
                        type = "none"
                    };
                else
                    return {
                        type = "hasSelection", 
                        target = l_v21_0
                    };
                end;
            elseif v27.type == "hasSelection" then
                if v21 == nil then
                    return v27;
                else
                    return {
                        type = "hasSelection", 
                        target = v21
                    };
                end;
            else
                return v27;
            end;
        end);
    end, {
        v21
    });
    local v29 = v5.useRef({});
    assert(v29.current ~= nil, v8.LUAU_ANALYZE_ERROR);
    local v43 = v5.useCallback(function(v30) --[[ Line: 77 ]]
        -- upvalues: v21 (copy), l_ChangeHistoryService_0 (ref), v8 (ref), v15 (ref), l_Workspace_0 (ref), v12 (ref), v10 (ref), v14 (ref), v7 (ref), v24 (copy), v26 (copy)
        assert(v21 ~= nil, "Inserting body with no target");
        l_ChangeHistoryService_0:SetWaypoint("Avatar Auto Setup");
        local v31 = v21.intendedName or v21.DEPRECATED_bodies[1].Name;
        if v31:lower():match((("%*$"):format(v8.BODY_MESH_SUFFIX))) then
            v31 = v31:sub(1, #v31 - #v8.BODY_MESH_SUFFIX);
        end;
        v30.Name = if v15() then v31 .. v8.OUTPUT_MODEL_SUFFIX else v31;
        assert(v30.PrimaryPart ~= nil, "Auto setup returned model with no primary part");
        v30:ScaleTo((v21.DEPRECATED_bodies[1].Size / v21.DEPRECATED_bodies[1].MeshSize).X);
        v30.Parent = l_Workspace_0;
        v30.PrimaryPart.PivotOffset = v30:GetBoundingBox() * v30.PrimaryPart.CFrame:Inverse();
        v30:PivotTo(v21.DEPRECATED_bodies[1].ExtentsCFrame);
        v12(v30, v21.DEPRECATED_bodies[1]);
        for _, v33 in v21.DEPRECATED_otherChildren do
            v33:Clone().Parent = v30;
        end;
        local l_CFrame_0 = assert(l_Workspace_0.CurrentCamera, "No Workspace Camera").CFrame;
        local v35 = l_CFrame_0.Position + l_CFrame_0.LookVector * 10 + Vector3.new(0, v21.DEPRECATED_bodies[1].Size.Y * 0.5, 0);
        v30:SetAttribute(v8.ATTRIBUTE_CREATED_BY_AUTO_SETUP, true);
        v30:SetAttribute(v8.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET, v10(v21.DEPRECATED_bodies[1].MeshId));
        if v14() then
            v30:PivotTo(CFrame.new(v30:GetBoundingBox().Position));
            local l_v30_BoundingBox_0, v37 = v30:GetBoundingBox();
            local v38 = {
                Vector3.new(-1.2 * v37.X, 0, 0), 
                Vector3.new(1.2 * v37.X, 0, 0), 
                (Vector3.new(0, 0, -1.5 * v37.Z))
            };
            local v39 = false;
            for _, v41 in v38 do
                if #l_Workspace_0:GetPartBoundsInBox(l_v30_BoundingBox_0 + v41 + Vector3.new(0, 0.30000001192092896, 0, 0), v37) == 0 then
                    v30:MoveTo(l_v30_BoundingBox_0.Position + v41);
                    v39 = true;
                    break;
                end;
            end;
            if not v39 then
                v30:MoveTo(v30:GetBoundingBox().Position + Vector3.new(0, v37.Y, 0));
            end;
            v30:PivotTo(CFrame.new(v30:GetBoundingBox().Position));
            local v42 = l_Workspace_0.CurrentCamera.ViewportSize.X / l_Workspace_0.CurrentCamera.ViewportSize.Y;
            v7.zoomToExtents(l_Workspace_0.CurrentCamera, v30, v42);
        else
            v30:PivotTo(CFrame.lookAt(v35, (Vector3.new(l_CFrame_0.Position.X, v35.Y, l_CFrame_0.Position.Z))));
        end;
        v24:Set({
            v30
        });
        v26({
            type = "none"
        });
    end, {
        v21
    });
    local v44 = v5.useRef(nil);
    v5.useEffect(function() --[[ Line: 168 ]]
        -- upvalues: v44 (copy), v8 (ref)
        if v44.current == nil then
            return;
        else
            assert(v44.current ~= nil, v8.LUAU_ANALYZE_ERROR);
            task.cancel(v44.current);
            return;
        end;
    end, {});
    local v52 = v5.useCallback(function() --[[ Line: 177 ]]
        -- upvalues: v25 (ref), v44 (copy), v21 (copy), l_GeometryService_0 (ref), v29 (copy), v43 (copy), v23 (copy), v26 (copy), v17 (ref), v22 (copy), v10 (ref), v11 (ref)
        if v25.type ~= "hasSelection" and v25.type ~= "error" then
            return;
        else
            if v44.current ~= nil then
                task.cancel(v44.current);
                v44.current = nil;
            end;
            assert(v21 ~= nil, "performAutoSetup called with no target");
            local v45 = assert(v21.DEPRECATED_bodies[1], "Auto setup target has no bodies");
            local v46 = l_GeometryService_0:HashMeshAsync(v45.MeshId);
            local v47 = v29.current[v46];
            if v47 ~= nil then
                v43(v47);
                if v23.autoSetupClickedSignal ~= nil then
                    v23.autoSetupClickedSignal:Fire();
                end;
                return;
            else
                v26({
                    type = "inAutoSetup", 
                    target = v21
                });
                v44.current = task.spawn(function() --[[ Line: 208 ]]
                    -- upvalues: v23 (ref), v45 (copy), v17 (ref), v26 (ref), v21 (ref), v29 (ref), v46 (copy), v43 (ref), v22 (ref), v10 (ref), v11 (ref)
                    local v48 = os.clock();
                    local l_status_0, l_result_0 = pcall(v23.DEPRECATED_startAutoSetupAsync, v45, function(v49) --[[ Line: 213 ]]
                        -- upvalues: v17 (ref), v26 (ref), v21 (ref)
                        if v17() then
                            v26({
                                type = "inAutoSetup", 
                                target = v21, 
                                progressState = v49
                            });
                        end;
                    end);
                    if l_status_0 then
                        v29.current[v46] = l_result_0:Clone();
                        v43(l_result_0);
                        v22:report("autoSetupFinish", os.clock() - v48, v45.MeshId);
                        v22:report("autoSetupAssetsGenerated", v10(v45.MeshId), v11(l_result_0));
                        return;
                    else
                        warn("Something went wrong while performing auto setup.\n" .. l_result_0);
                        v26({
                            type = "error", 
                            target = v21, 
                            error = "ErrorSourceFail"
                        });
                        v22:report("autoSetupFailure", os.clock() - v48, v45.MeshId);
                        return;
                    end;
                end);
                if v23.autoSetupClickedSignal ~= nil then
                    v23.autoSetupClickedSignal:Fire();
                end;
                return;
            end;
        end;
    end, {
        v25, 
        v23.startAutoSetupAsync, 
        v21, 
        v43
    });
    local v54 = v5.useCallback(function() --[[ Line: 252 ]]
        -- upvalues: v44 (copy), v26 (copy)
        if v44.current ~= nil then
            task.cancel(v44.current);
        end;
        v26(function(v53) --[[ Line: 257 ]]
            if v53.type == "none" then
                return v53;
            else
                return {
                    type = "hasSelection", 
                    target = v53.target
                };
            end;
        end);
    end, {});
    v5.useEffect(function() --[[ Line: 269 ]]
        -- upvalues: v21 (copy), v25 (ref), v26 (copy)
        if v21 == nil and (v25.type == "hasSelection" or v25.type == "none") then
            v26({
                type = "none"
            });
        end;
        v26(function(v55) --[[ Line: 276 ]]
            -- upvalues: v21 (ref)
            if v21 == nil then
                if v55.type == "hasSelection" or v55.type == "none" then
                    return {
                        type = "none"
                    };
                end;
            elseif v21 ~= nil and v55.type == "none" then
                return {
                    type = "hasSelection", 
                    target = v21
                };
            end;
            return v55;
        end);
    end, {
        v21
    });
    if v21 ~= nil and #v21.DEPRECATED_bodies > 1 then
        v25 = {
            type = "error", 
            target = v21, 
            error = "DEPRECATED_ErrorMultipleBodies"
        };
    end;
    return {
        state = v25, 
        cancelAutoSetup = v54, 
        startAutoSetup = v52, 
        clearError = function() --[[ Line: 307 ]] --[[ Name: clearError ]]

        end
    };
end;
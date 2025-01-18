local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v1.ContextServices;
local l_ContextItem_0 = l_ContextServices_0.ContextItem;
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local l_Signal_0 = v1.Util.Signal;
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getMaterials);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorUpdateShortcuts);
local v9 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v9.BrushMode;
local l_BrushSettings_0 = v9.BrushSettings;
local l_MaterialSettings_0 = v9.MaterialSettings;
local l_PluginAction_0 = v9.PluginAction;
local v14 = l_ContextItem_0:extend("ShortcutController");
v14.new = function(v15, v16) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: l_PluginAction_0 (copy), l_PluginActions_0 (copy), l_Signal_0 (copy), v14 (copy)
    assert(v15, "ShortcutController.new() requires a plugin");
    local function _(v17) --[[ Line: 29 ]] --[[ Name: getStatusTip ]]
        -- upvalues: v16 (copy)
        return v16:getText("PluginActions", v17 .. "StatusTip");
    end;
    local function _(v19) --[[ Line: 33 ]] --[[ Name: getText ]]
        -- upvalues: v16 (copy)
        return v16:getText("PluginActions", v19 .. "Text");
    end;
    local v21 = {
        EditPlane = {
            allowBinding = false, 
            defaultShortcut = "ctrl+shift+space", 
            id = l_PluginAction_0.EditPlane, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.EditPlane .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.EditPlane .. "Text")
        }, 
        CopySelected = {
            allowBinding = false, 
            defaultShortcut = "ctrl+c", 
            id = l_PluginAction_0.CopySelected, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.CopySelected .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.CopySelected .. "Text")
        }, 
        CutSelected = {
            allowBinding = false, 
            defaultShortcut = "ctrl+x", 
            id = l_PluginAction_0.CutSelected, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.CutSelected .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.CutSelected .. "Text")
        }, 
        DeleteSelected = {
            allowBinding = false, 
            defaultShortcut = "delete", 
            id = l_PluginAction_0.DeleteSelected, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.DeleteSelected .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.DeleteSelected .. "Text")
        }, 
        PasteSelected = {
            allowBinding = false, 
            defaultShortcut = "ctrl+v", 
            id = l_PluginAction_0.PasteSelected, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.PasteSelected .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.PasteSelected .. "Text")
        }, 
        DuplicateSelected = {
            allowBinding = false, 
            defaultShortcut = "ctrl+d", 
            id = l_PluginAction_0.DuplicateSelected, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.DuplicateSelected .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.DuplicateSelected .. "Text")
        }, 
        Apply = {
            allowBinding = false, 
            defaultShortcut = "return", 
            id = l_PluginAction_0.Apply, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.Apply .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.Apply .. "Text")
        }, 
        Cancel = {
            allowBinding = false, 
            defaultShortcut = "escape", 
            id = l_PluginAction_0.Quit, 
            statusTip = v16:getText("PluginActions", l_PluginAction_0.Quit .. "StatusTip"), 
            text = v16:getText("PluginActions", l_PluginAction_0.Quit .. "Text")
        }
    };
    local v22 = setmetatable({
        _mouse = v15:GetMouse(), 
        _pluginActions = l_PluginActions_0.new(v15, v21), 
        _cachedValues = {}, 
        _originalValues = {}, 
        _userInputService = game:GetService("UserInputService"), 
        _workspace = game:GetService("Workspace"), 
        _reservedMouseMove = {}, 
        _reservedMouseDown = {}, 
        _brushMouse = {}, 
        _brushScrollWheel = {}, 
        MouseDownAction = l_Signal_0.new(), 
        MouseMoveAction = l_Signal_0.new()
    }, v14);
    v22._mouse.Button1Down:Connect(function() --[[ Line: 116 ]]
        -- upvalues: v22 (copy)
        if not v22._mouseDown then
            v22._mouseDown = true;
            if not v22:isMouseDownReserved() then
                v22.MouseDownAction:Fire();
            end;
        end;
    end);
    v22._mouse.Button1Up:Connect(function() --[[ Line: 126 ]]
        -- upvalues: v22 (copy)
        if v22._mouseDown then
            v22._mouseDown = false;
        end;
    end);
    v22._mouse.Move:Connect(function() --[[ Line: 132 ]]
        -- upvalues: v22 (copy)
        if not v22:isMouseMoveReserved() then
            v22.MouseMoveAction:Fire();
        end;
    end);
    return v22;
end;
v14.isMouseMoveReserved = function(v23) --[[ Line: 141 ]] --[[ Name: isMouseMoveReserved ]]
    return #v23._reservedMouseMove ~= 0;
end;
v14.isMouseDownReserved = function(v24) --[[ Line: 145 ]] --[[ Name: isMouseDownReserved ]]
    return #v24._reservedMouseDown ~= 0;
end;
v14.isAltDown = function(v25) --[[ Line: 149 ]] --[[ Name: isAltDown ]]
    return v25._userInputService:IsKeyDown(Enum.KeyCode.LeftAlt) or v25._userInputService:IsKeyDown(Enum.KeyCode.RightAlt);
end;
v14.isShiftDown = function(v26) --[[ Line: 154 ]] --[[ Name: isShiftDown ]]
    return v26._userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or v26._userInputService:IsKeyDown(Enum.KeyCode.RightShift);
end;
v14.isControlDown = function(v27) --[[ Line: 159 ]] --[[ Name: isControlDown ]]
    return v27._userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v27._userInputService:IsKeyDown(Enum.KeyCode.RightControl);
end;
v14.isBDown = function(v28) --[[ Line: 164 ]] --[[ Name: isBDown ]]
    return v28._userInputService:IsKeyDown(Enum.KeyCode.B);
end;
v14.onBrushChanged = function(v29, v30, v31, v32, v33) --[[ Line: 168 ]] --[[ Name: onBrushChanged ]]
    -- upvalues: l_BrushSettings_0 (copy)
    local function _() --[[ Line: 169 ]] --[[ Name: updateStrengthValue ]]
        -- upvalues: v32 (copy), v29 (copy), v30 (copy)
        return v32((math.clamp(math.floor((v29._originalValues[v30] + v29._cachedValues[v30]) * 100) / 100, 0, 1)));
    end;
    local function v36() --[[ Line: 175 ]] --[[ Name: updateSizeValue ]]
        -- upvalues: v31 (copy), v29 (copy), v30 (copy), v32 (copy)
        local v35 = table.clone(v31);
        v35.Size = math.clamp(math.floor(v29._originalValues[v30].Size + v29._cachedValues[v30].Size), 1, 64);
        v35.Height = math.clamp(math.floor(v29._originalValues[v30].Height + v29._cachedValues[v30].Height), 1, 64);
        return v32(v35);
    end;
    local function v44(v37, v38) --[[ Line: 186 ]] --[[ Name: updateValues ]]
        -- upvalues: v29 (copy), v30 (copy), l_BrushSettings_0 (ref), v32 (copy), v31 (copy), v36 (copy)
        local function _() --[[ Line: 187 ]] --[[ Name: tryZoom ]]
            -- upvalues: v38 (copy), v29 (ref), v37 (copy)
            if v38 then
                v29._workspace.CurrentCamera:Zoom(-v37);
            end;
        end;
        if v29:isShiftDown() and v30 == l_BrushSettings_0.Strength then
            local l__cachedValues_0 = v29._cachedValues;
            local l_v30_0 = v30;
            l__cachedValues_0[l_v30_0] = l__cachedValues_0[l_v30_0] + v37 / 100;
            if v38 then
                v29._workspace.CurrentCamera:Zoom(-v37);
            end;
            l__cachedValues_0 = v32((math.clamp(math.floor((v29._originalValues[v30] + v29._cachedValues[v30]) * 100) / 100, 0, 1)));
            return;
        elseif v29:isControlDown() and v30 == l_BrushSettings_0.BrushSize then
            local v42 = v29._cachedValues[v30];
            v42.Height = v42.Height + v37;
            if v31.Locked then
                v29._cachedValues[v30].Size = v29._cachedValues[v30].Height;
            end;
            v36();
            return;
        else
            if not v29:isShiftDown() and not v29:isControlDown() and v30 == l_BrushSettings_0.BrushSize then
                local v43 = v29._cachedValues[v30];
                v43.Size = v43.Size + v37;
                if v31.Locked then
                    v29._cachedValues[v30].Height = v29._cachedValues[v30].Size;
                end;
                if v38 then
                    v29._workspace.CurrentCamera:Zoom(-v37);
                end;
                v36();
            end;
            return;
        end;
    end;
    local function v47(v45) --[[ Line: 216 ]] --[[ Name: onWheel ]]
        -- upvalues: v29 (copy), v30 (copy), v44 (copy)
        if not v29:isBDown() then
            return;
        else
            local v46 = table.find(v29._reservedMouseMove, v30);
            if v46 then
                table.remove(v29._reservedMouseDown, v46);
            end;
            v29._brushScrollWheel[v30] = true;
            v44(v45, true);
            return;
        end;
    end;
    local function v50() --[[ Line: 230 ]] --[[ Name: onMove ]]
        -- upvalues: v29 (copy), v30 (copy), v44 (copy)
        if not v29:isBDown() or v29._brushScrollWheel[v30] then
            return;
        else
            local v48 = Vector2.new(v29._mouse.X, v29._mouse.Y);
            local v49 = v48 - v29._brushMouse[v30];
            v29._brushMouse[v30] = v48;
            v44(v49.X / 10, false);
            return;
        end;
    end;
    local function v52(v51) --[[ Line: 242 ]] --[[ Name: onMouseChanged ]]
        -- upvalues: v50 (copy), v47 (copy)
        if v51.UserInputType == Enum.UserInputType.MouseMovement then
            v50();
            return;
        else
            if v51.UserInputType == Enum.UserInputType.MouseWheel then
                v47(v51.Position.Z);
            end;
            return;
        end;
    end;
    local function v54(v53) --[[ Line: 250 ]] --[[ Name: onBDown ]]
        -- upvalues: v29 (copy), v30 (copy), l_BrushSettings_0 (ref), v31 (copy)
        if v53.KeyCode == Enum.KeyCode.B then
            if not v29._cachedValues[v30] then
                if v30 == l_BrushSettings_0.BrushSize then
                    v29._originalValues[v30] = {
                        Height = v31.Height, 
                        Size = v31.Size
                    };
                    v29._cachedValues[v30] = {
                        Height = 0, 
                        Size = 0
                    };
                else
                    v29._originalValues[v30] = v31;
                    v29._cachedValues[v30] = 0;
                end;
            end;
            v29._brushScrollWheel[v30] = false;
            v29._brushMouse[v30] = Vector2.new(v29._mouse.X, v29._mouse.Y);
            v29._cameraPosition = v29._workspace.CurrentCamera.CFrame;
            if v29._mouseDown then
                v29._brushScrollWheel[v30] = true;
                return;
            elseif not table.find(v29._reservedMouseMove, v30) then
                table.insert(v29._reservedMouseMove, v30);
            end;
        end;
    end;
    return {
        v29._userInputService.InputChanged:Connect(v52), 
        v29._userInputService.InputBegan:Connect(v54), 
        v29._userInputService.InputEnded:Connect(function(v55) --[[ Line: 284 ]] --[[ Name: onBUp ]]
            -- upvalues: v29 (copy), v30 (copy), v33 (copy)
            if v55.KeyCode == Enum.KeyCode.B then
                local v56 = table.find(v29._reservedMouseMove, v30);
                if v56 then
                    table.remove(v29._reservedMouseMove, v56);
                end;
                v29._cachedValues[v30] = nil;
                v33();
            end;
        end)
    };
end;
if v8() then
    v14.onMaterialPicked = function(v57, v58, v59) --[[ Line: 302 ]] --[[ Name: onMaterialPicked ]]
        -- upvalues: v6 (copy), v7 (copy), l_MaterialSettings_0 (copy)
        local function _(v60) --[[ Line: 303 ]] --[[ Name: isCtrl ]]
            local v61 = true;
            if v60.KeyCode ~= Enum.KeyCode.LeftControl then
                v61 = v60.KeyCode == Enum.KeyCode.RightControl;
            end;
            return v61;
        end;
        local function v65(v63) --[[ Line: 307 ]] --[[ Name: ctrlStart ]]
            -- upvalues: v57 (copy), v58 (copy)
            local v64 = true;
            if v63.KeyCode ~= Enum.KeyCode.LeftControl then
                v64 = v63.KeyCode == Enum.KeyCode.RightControl;
            end;
            if v64 then
                table.insert(v57._reservedMouseDown, v58);
            end;
        end;
        local function v68(v66) --[[ Line: 313 ]] --[[ Name: ctrlEnd ]]
            -- upvalues: v57 (copy), v58 (copy)
            local v67 = true;
            if v66.KeyCode ~= Enum.KeyCode.LeftControl then
                v67 = v66.KeyCode == Enum.KeyCode.RightControl;
            end;
            if v67 then
                v67 = table.find(v57._reservedMouseDown, v58);
                if v67 then
                    table.remove(v57._reservedMouseDown, v67);
                end;
            end;
        end;
        local function v73() --[[ Line: 323 ]] --[[ Name: mouseDown ]]
            -- upvalues: v57 (copy), v6 (ref), v7 (ref), v58 (copy), l_MaterialSettings_0 (ref), v59 (copy)
            if v57:isControlDown() then
                local l_Position_0 = v57._mouse.Origin.Position;
                local l_Direction_0 = v57._mouse.UnitRay.Direction;
                local v71 = RaycastParams.new();
                v71.CollisionGroup = "StudioSelectable";
                local v72 = v57._workspace:Raycast(l_Position_0, l_Direction_0 * v6.RayLength, v71);
                if v72 and v72.Material then
                    if not table.find(v7(), v72.Material) then
                        return;
                    elseif v57:isShiftDown() and v58 == l_MaterialSettings_0.TargetMaterial or not v57:isShiftDown() and v58 == l_MaterialSettings_0.SourceMaterial then
                        v59(v72.Material);
                    end;
                end;
            end;
        end;
        return {
            v57._mouse.Button1Down:Connect(v73), 
            v57._userInputService.InputBegan:Connect(v65), 
            v57._userInputService.InputEnded:Connect(v68)
        };
    end;
    v14.onBrushMode = function(v74, v75, v76) --[[ Line: 356 ]] --[[ Name: onBrushMode ]]
        -- upvalues: l_BrushMode_0 (copy)
        local function v78(v77) --[[ Line: 357 ]] --[[ Name: input ]]
            -- upvalues: v74 (copy), v75 (copy), v76 (copy), l_BrushMode_0 (ref)
            if v77.KeyCode == Enum.KeyCode.LeftAlt or v77.KeyCode == Enum.KeyCode.RightAlt then
                if v74:isAltDown() and not v74._altWasDown then
                    v75(if v76 == l_BrushMode_0.Add then l_BrushMode_0.Subtract else l_BrushMode_0.Add);
                    v74._altWasDown = true;
                    return;
                elseif not v74:isAltDown() and v74._altWasDown then
                    v75(v76);
                    v74._altWasDown = false;
                end;
            end;
        end;
        return {
            v74._userInputService.InputBegan:Connect(v78), 
            v74._userInputService.InputEnded:Connect(v78)
        };
    end;
else
    v14.onMaterialPicked = function(v79, v80, v81) --[[ Line: 377 ]] --[[ Name: onMaterialPicked ]]
        -- upvalues: v6 (copy), v7 (copy), l_MaterialSettings_0 (copy)
        local function _(v82) --[[ Line: 378 ]] --[[ Name: isAlt ]]
            local v83 = true;
            if v82.KeyCode ~= Enum.KeyCode.LeftAlt then
                v83 = v82.KeyCode == Enum.KeyCode.RightAlt;
            end;
            return v83;
        end;
        local function v87(v85) --[[ Line: 382 ]] --[[ Name: altStart ]]
            -- upvalues: v79 (copy), v80 (copy)
            local v86 = true;
            if v85.KeyCode ~= Enum.KeyCode.LeftAlt then
                v86 = v85.KeyCode == Enum.KeyCode.RightAlt;
            end;
            if v86 then
                table.insert(v79._reservedMouseDown, v80);
            end;
        end;
        local function v90(v88) --[[ Line: 388 ]] --[[ Name: altEnd ]]
            -- upvalues: v79 (copy), v80 (copy)
            local v89 = true;
            if v88.KeyCode ~= Enum.KeyCode.LeftAlt then
                v89 = v88.KeyCode == Enum.KeyCode.RightAlt;
            end;
            if v89 then
                v89 = table.find(v79._reservedMouseDown, v80);
                if v89 then
                    table.remove(v79._reservedMouseDown, v89);
                end;
            end;
        end;
        local function v95() --[[ Line: 398 ]] --[[ Name: mouseDown ]]
            -- upvalues: v79 (copy), v6 (ref), v7 (ref), v80 (copy), l_MaterialSettings_0 (ref), v81 (copy)
            if v79:isAltDown() then
                local l_Position_1 = v79._mouse.Origin.Position;
                local l_Direction_1 = v79._mouse.UnitRay.Direction;
                local v93 = RaycastParams.new();
                v93.BruteForceAllSlow = true;
                local v94 = v79._workspace:Raycast(l_Position_1, l_Direction_1 * v6.RayLength, v93);
                if v94 and v94.Material then
                    if not table.find(v7(), v94.Material) then
                        return;
                    elseif v79:isShiftDown() and v80 == l_MaterialSettings_0.TargetMaterial then
                        v81(v94.Material);
                        return;
                    elseif v80 == l_MaterialSettings_0.SourceMaterial then
                        v81(v94.Material);
                    end;
                end;
            end;
        end;
        return {
            v79._mouse.Button1Down:Connect(v95), 
            v79._userInputService.InputBegan:Connect(v87), 
            v79._userInputService.InputEnded:Connect(v90)
        };
    end;
    v14.onBrushMode = function(v96, v97, v98) --[[ Line: 430 ]] --[[ Name: onBrushMode ]]
        -- upvalues: l_BrushMode_0 (copy)
        local function v100(v99) --[[ Line: 431 ]] --[[ Name: input ]]
            -- upvalues: v96 (copy), v97 (copy), v98 (copy), l_BrushMode_0 (ref)
            if v99.KeyCode == Enum.KeyCode.LeftControl or v99.KeyCode == Enum.KeyCode.RightControl then
                if v96:isControlDown() and not v96._controlWasDown then
                    v97(if v98 == l_BrushMode_0.Add then l_BrushMode_0.Subtract else l_BrushMode_0.Add);
                    v96._controlWasDown = true;
                    return;
                elseif not v96:isControlDown() and v96._controlWasDown then
                    v97(v98);
                    v96._controlWasDown = false;
                end;
            end;
        end;
        return {
            v96._userInputService.InputBegan:Connect(v100), 
            v96._userInputService.InputEnded:Connect(v100)
        };
    end;
end;
v14.onTemporarySmooth = function(v101, v102) --[[ Line: 452 ]] --[[ Name: onTemporarySmooth ]]
    local function v104(v103) --[[ Line: 453 ]] --[[ Name: input ]]
        -- upvalues: v102 (copy), v101 (copy)
        if v103.KeyCode == Enum.KeyCode.LeftShift or v103.KeyCode == Enum.KeyCode.RightShift then
            v102(v101:isShiftDown());
        end;
    end;
    return {
        v101._userInputService.InputBegan:Connect(v104), 
        v101._userInputService.InputEnded:Connect(v104)
    };
end;
v14.onToggleEdit = function(v105, v106, v107) --[[ Line: 465 ]] --[[ Name: onToggleEdit ]]
    -- upvalues: l_PluginAction_0 (copy)
    if not v105._toggleEditEnabled then
        v105:Enable(l_PluginAction_0.EditPlane);
        v105._toggleEditEnabled = true;
    end;
    v105._manualPlaneLock = v106;
    return {
        v105._pluginActions:get(l_PluginAction_0.EditPlane).Triggered:Connect(function() --[[ Line: 474 ]]
            -- upvalues: v105 (copy), v107 (copy)
            v105._manualPlaneLock = not v105._manualPlaneLock;
            v107(v105._manualPlaneLock);
        end), 
        {
            Disconnect = function() --[[ Line: 483 ]] --[[ Name: Disconnect ]]
                -- upvalues: v105 (copy), l_PluginAction_0 (ref)
                v105:Disable(l_PluginAction_0.EditPlane);
                v105._toggleEditEnabled = false;
            end
        }
    };
end;
v14.registerShortcut = function(v108, v109, v110, v111, v112) --[[ Line: 491 ]] --[[ Name: registerShortcut ]]
    -- upvalues: l_BrushSettings_0 (copy), l_MaterialSettings_0 (copy)
    if not v108:supportsShortcut(v109) then
        error((("Cannot register unsupported shortcut for property %*."):format(v109)));
    end;
    if v109 == l_BrushSettings_0.BrushSize or v109 == l_BrushSettings_0.Strength then
        return v108:onBrushChanged(v109, v110, v111, v112);
    elseif v109 == l_MaterialSettings_0.SourceMaterial or v109 == l_MaterialSettings_0.TargetMaterial then
        return v108:onMaterialPicked(v109, v111);
    elseif v109 == l_BrushSettings_0.BrushMode then
        return v108:onBrushMode(v111, v110);
    elseif v109 == l_BrushSettings_0.TemporarySmooth then
        return v108:onTemporarySmooth(v111);
    elseif v109 == l_BrushSettings_0.ManualPlaneLock then
        return v108:onToggleEdit(v110, v111);
    else
        return;
    end;
end;
v14.supportsShortcut = function(_, v114) --[[ Line: 511 ]] --[[ Name: supportsShortcut ]]
    -- upvalues: l_BrushSettings_0 (copy), l_MaterialSettings_0 (copy)
    return ({
        [l_BrushSettings_0.BrushSize] = true, 
        [l_BrushSettings_0.BrushMode] = true, 
        [l_BrushSettings_0.ManualPlaneLock] = true, 
        [l_BrushSettings_0.Strength] = true, 
        [l_BrushSettings_0.TemporarySmooth] = true, 
        [l_MaterialSettings_0.SourceMaterial] = true, 
        [l_MaterialSettings_0.TargetMaterial] = true
    })[v114];
end;
v14.getMouse = function(v115) --[[ Line: 525 ]] --[[ Name: getMouse ]]
    return v115._mouse;
end;
v14.IsMouseDown = function(v116) --[[ Line: 529 ]] --[[ Name: IsMouseDown ]]
    return v116._mouseDown;
end;
v14.Enable = function(v117, v118) --[[ Line: 533 ]] --[[ Name: Enable ]]
    v117:SetEnabled(v118, true);
end;
v14.Disable = function(v119, v120) --[[ Line: 537 ]] --[[ Name: Disable ]]
    v119:SetEnabled(v120, false);
end;
v14.SetEnabled = function(v121, v122, v123) --[[ Line: 541 ]] --[[ Name: SetEnabled ]]
    v121._pluginActions:get(v122).Enabled = v123;
end;
v14.Connect = function(v124, v125, v126) --[[ Line: 545 ]] --[[ Name: Connect ]]
    return v124._pluginActions:get(v125).Triggered:Connect(v126);
end;
return v14;
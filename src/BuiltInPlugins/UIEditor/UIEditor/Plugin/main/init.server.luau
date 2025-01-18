local l_plugin_0 = plugin;
local _ = settings;
local v2 = require(script.Parent.ActionMediator);
local _ = require(script.Parent.CoreGuiManager);
local v4 = require(script.Parent.DoubleClickDetector);
local _ = require(script.Parent.FFlag);
local _ = require(script.Parent.RotationBox);
local v7 = require(script.Parent.Rubberband);
local v8 = require(script.Parent.SizeBox);
local v9 = require(script.Parent.DistanceLinesManager);
local v10 = require(script.Parent.TextEditor);
local _ = require(script.Parent.Utility);
local v12 = require(script.Parent.GlobalValues);
local v13 = require(script.Parent.InstanceInfo);
local v14 = require(script.Parent.Select);
local v15 = require(script.Parent.Resize);
local _ = require(script.Parent.Rotate);
local v17 = require(script.Parent.Move);
local v18 = require(script.Parent.MouseIconManager);
local v19 = require(script.Parent.SelectionManager);
local v20 = require(script.Parent.SnappingPointManager);
local v21 = require(script.Parent.Analytics);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Selection_0 = game:GetService("Selection");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
game:DefineFastFlag("StopUIEditorFocusOnPluginActivation", false);
game:DefineFastFlag("UIEditorAvoidEditingPath2D", false);
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = false;
local v39 = {};
local l_CurrentCamera_0 = workspace.CurrentCamera;
if game:GetEngineFeature("UIDragDetectorEnableUseWithMorePlugins") then
    l_plugin_0.DisableUIDragDetectorDrags = true;
end;
local function v41() --[[ Line: 78 ]] --[[ Name: configureActionMediator ]]
    -- upvalues: v17 (copy), v2 (copy), v15 (copy), v7 (copy), v10 (copy), v9 (copy), v8 (copy), v19 (copy)
    v17:setActionMediator(v2);
    v15:setActionMediator(v2);
    v7:setActionMediator(v2);
    v10:setActionMediator(v2);
    v2:setMove(v17);
    v2:setResize(v15);
    v2:setRubberband(v7);
    v2:setTextEditor(v10);
    v2:setDistanceLinesManager(v9);
    v2:setSizeBox(v8);
    v2:setSelectionManager(v19);
end;
local function v45(v42) --[[ Line: 97 ]] --[[ Name: onDoubleClick ]]
    -- upvalues: v14 (copy), v10 (copy), v15 (copy)
    local v43 = Vector2.new(v42.Position.x, v42.Position.y);
    local v44 = v14:getGuiObjectsAtPoint(v43);
    if #v44 > 0 and (v44[1]:IsA("TextLabel") or v44[1]:IsA("TextButton") or v44[1]:IsA("TextBox")) then
        v10:startEditingInstance(v44[1]);
        v15:hide();
        return true;
    else
        return false;
    end;
end;
local function v48(_, v47) --[[ Line: 118 ]] --[[ Name: onInstanceChanged ]]
    -- upvalues: v19 (copy), v15 (copy), v9 (copy), v8 (copy)
    if v47 == "Parent" then
        v19:onParentChanged();
        return;
    else
        v15:updatePosition();
        v15:updateSize();
        v9:update();
        v9:setVisible(true);
        v8:update();
        return;
    end;
end;
local function v50(v49) --[[ Line: 133 ]] --[[ Name: onDescendantAddedToStarterGui ]]
    -- upvalues: v19 (copy)
    v19:onDescendantAddedToStarterGui(v49);
end;
local function v52() --[[ Line: 140 ]] --[[ Name: onSelectionChanged ]]
    -- upvalues: v19 (copy), v20 (copy), l_Selection_0 (copy), v15 (copy), v8 (copy), v9 (copy)
    v19:onSelectionChanged();
    v20:generateSnappingLines();
    local v51 = l_Selection_0:Get();
    if v51[1] and (v51[1]:FindFirstAncestorOfClass("BillboardGui") or v51[1]:FindFirstAncestorOfClass("SurfaceGui")) then
        v15:hide();
        v8:setVisible(false);
        v9:setVisible(false);
    end;
end;
local function v60(v53) --[[ Line: 159 ]] --[[ Name: onInputBegan ]]
    -- upvalues: v10 (copy), l_UserInputService_0 (copy), v39 (ref), v19 (copy), v37 (ref), v38 (ref), v15 (copy), v14 (copy), v52 (copy), v17 (copy), l_CurrentCamera_0 (copy), l_Selection_0 (copy), v13 (copy), v12 (copy)
    if v10:isCurrentlyEditing() then
        return;
    elseif v53.UserInputType == Enum.UserInputType.MouseButton1 then
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            v39 = v19:getRawSelection();
        end;
        v37 = v19:disconnectSelectionInstancesChanged(v37);
        v38 = true;
        local v54 = Vector2.new(v53.Position.X, v53.Position.Y);
        if v15:isOverAHandle() then
            v15:startDrag(v54);
            return;
        else
            local v55 = v14:selectTopLevelItemAtPoint(v54);
            v52();
            v17:startDrag(v54);
            if not v55 then
                local v56 = l_CurrentCamera_0:ScreenPointToRay(v53.Position.X, v53.Position.Y);
                local v57 = RaycastParams.new();
                v57.BruteForceAllSlow = true;
                local v58 = workspace:Raycast(v56.Origin, v56.Direction * 5000, v57);
                if v58 and not v58.Instance.Locked then
                    local v59 = {
                        v58.Instance
                    };
                    l_Selection_0:Set(v59);
                    Off();
                    return;
                else
                    Off();
                    return;
                end;
            else
                v13:isVisible(v55, true);
                return;
            end;
        end;
    else
        if v53.UserInputType == Enum.UserInputType.Keyboard then
            if v53.KeyCode == Enum.KeyCode.U and (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) then
                v12:toggleGridType();
                return;
            elseif v53.KeyCode == Enum.KeyCode.A and l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) then
                v19:setSelection(v14:getGuiObjects());
            end;
        end;
        return;
    end;
end;
local function v63(v61) --[[ Line: 229 ]] --[[ Name: onInputEnded ]]
    -- upvalues: v38 (ref), v15 (copy), v7 (copy), l_UserInputService_0 (copy), v14 (copy), v39 (ref), v19 (copy), v21 (copy), v17 (copy), v4 (copy), v45 (copy), v37 (ref), v48 (copy), v18 (copy)
    if v61.UserInputType == Enum.UserInputType.MouseButton1 then
        v38 = false;
        local v62 = Vector2.new(v61.Position.X, v61.Position.Y);
        if v15:isDragInProgress() then
            v15:finishDrag();
        end;
        if v7:isDragInProgress() then
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                v14:toggleSelectionOfAllObjectsInBounds(v39, v7:getBounds());
            else
                v14:selectAllObjectsInBounds(v7:getBounds());
            end;
            if #v19:getRawSelection() > 0 then
                v21:reportEvent("DragSelect");
            end;
            v7:finishRubberbandDrag();
            v39 = {};
        end;
        if v17:isDragInProgress() then
            v17:finishDrag(v62);
        end;
        if v4:isDoubleClick() and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt) and v45(v61) then
            return;
        else
            if not v37 then
                v37 = v19:connectSelectionInstancesChanged(v48);
            end;
            if v15:isOverAHandle() then
                v15:updateMouseIcon();
            else
                v18:setToDefaultIcon();
            end;
            v15:updateHandleHighlight();
        end;
    end;
end;
local function v66(v64) --[[ Line: 289 ]] --[[ Name: onInputChanged ]]
    -- upvalues: v10 (copy), v15 (copy), v7 (copy), l_UserInputService_0 (copy), v14 (copy), v39 (ref), v17 (copy), v18 (copy)
    if v10:isCurrentlyEditing() then
        return;
    else
        if v64.UserInputType == Enum.UserInputType.MouseMovement then
            local v65 = Vector2.new(v64.Position.x, v64.Position.y);
            if v15:isDragInProgress() then
                v15:updateDrag(v65);
                return;
            elseif v7:isDragInProgress() then
                v7:updateRubberband(v65);
                if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                    v14:toggleSelectionOfAllObjectsInBounds(v39, v7:getBounds());
                    return;
                else
                    v14:selectAllObjectsInBounds(v7:getBounds());
                    return;
                end;
            elseif v17:isDragInProgress() then
                v17:updateDrag(v65);
                return;
            else
                if v15:isOverAHandle() then
                    v15:updateMouseIcon();
                else
                    v18:setToDefaultIcon();
                end;
                v15:updateHandleHighlight(false);
            end;
        end;
        return;
    end;
end;
local function v69(v67) --[[ Line: 334 ]] --[[ Name: onDragEnter ]]
    -- upvalues: v38 (ref), l_plugin_0 (copy), l_Selection_0 (copy), v19 (copy), v17 (copy)
    if #v67 == 0 then
        return;
    elseif not v67[1]:IsA("GuiBase2d") then
        return;
    else
        v38 = true;
        local v68 = Vector2.new(l_plugin_0:GetMouse().X, l_plugin_0:GetMouse().Y);
        l_Selection_0:Set(v67);
        v19:onSelectionChanged();
        v17:startDrag(v68);
        return;
    end;
end;
local function v71(_) --[[ Line: 348 ]] --[[ Name: onPluginOffInputBegan ]]
    -- upvalues: l_StarterGui_0 (copy), l_RunService_0 (copy)
    if not l_StarterGui_0.ShowDevelopmentGui or l_RunService_0:IsRunning() then
        return;
    else
        return;
    end;
end;
local function _(v72) --[[ Line: 354 ]] --[[ Name: isUIEditorWaypoint ]]
    if v72 == "Translate Objects (better tt needed)" or v72 == "Resize" or v72 == "Text Changed" or v72 == "Rotate object" then
        return true;
    else
        return false;
    end;
end;
local function v75(v74) --[[ Line: 367 ]] --[[ Name: onUndo ]]
    -- upvalues: v15 (copy)
    if v74 == "Translate Objects (better tt needed)" or not (v74 ~= "Resize") or not (v74 ~= "Text Changed") or v74 == "Rotate object" then
        v15:updatePosition();
    end;
end;
local function v77(v76) --[[ Line: 373 ]] --[[ Name: onRedo ]]
    -- upvalues: v15 (copy)
    if v76 == "Translate Objects (better tt needed)" or not (v76 ~= "Resize") or not (v76 ~= "Text Changed") or v76 == "Rotate object" then
        v15:updatePosition();
    end;
end;
local v78 = false;
local v79 = false;
local v80 = nil;
local v81 = nil;
v80 = l_plugin_0 and l_plugin_0:CreateToolbar("RobloxUIEditor");
v81 = v80 and v80:CreateButton("RobloxUIEditor", "RobloxUIEditor", "");
Off = function() --[[ Line: 392 ]] --[[ Name: Off ]]
    -- upvalues: v79 (ref), v21 (copy), v28 (ref), v27 (ref), v36 (ref), l_UserInputService_0 (copy), v71 (copy), v14 (copy), v29 (ref), v30 (ref), v31 (ref), v32 (ref), v33 (ref), v37 (ref), v19 (copy), v9 (copy), v15 (copy), v8 (copy), v17 (copy), v18 (copy), v81 (ref), l_plugin_0 (copy)
    if not v79 then
        return;
    else
        v79 = false;
        v21:reportEvent("Disabled");
        v28:disconnect();
        v27:disconnect();
        v36 = l_UserInputService_0.InputBegan:connect(v71);
        v14:refreshPaintOrder();
        v29:disconnect();
        v30:disconnect();
        v31:disconnect();
        v32:disconnect();
        v33:disconnect();
        v37 = v19:disconnectSelectionInstancesChanged(v37);
        v19:disconnectFilteredSelectionChanged(v9);
        v19:disconnectFilteredSelectionChanged(v15);
        v19:disconnectFilteredSelectionChanged(v8);
        v19:disconnectFilteredSelectionChanged(v17);
        v8:Off();
        v9:Off();
        v18:Off();
        v15:Off();
        v81:SetActive(false);
        l_plugin_0:Deactivate();
        return;
    end;
end;
On = function() --[[ Line: 429 ]] --[[ Name: On ]]
    -- upvalues: v79 (ref), v21 (copy), l_plugin_0 (copy), v81 (ref), v20 (copy), v8 (copy), v9 (copy), v18 (copy), v15 (copy), v27 (ref), l_StarterGui_0 (copy), v50 (copy), v36 (ref), v28 (ref), l_UserInputService_0 (copy), v60 (copy), v29 (ref), v66 (copy), v30 (ref), v63 (copy), v31 (ref), l_Selection_0 (copy), v52 (copy), v33 (ref), v69 (copy), v32 (ref), v37 (ref), v19 (copy), v48 (copy), v34 (ref), l_ChangeHistoryService_0 (copy), v75 (copy), v35 (ref), v77 (copy), v17 (copy), v41 (copy)
    if v79 then
        return;
    else
        v21:reportEvent("Enabled");
        if game:GetFastFlag("StopUIEditorFocusOnPluginActivation") then
            l_plugin_0:Activate(false);
        else
            l_plugin_0:Activate(true);
        end;
        v81:SetActive(true);
        v20:setThreshold(5);
        v8:On();
        v9:On();
        v18:On(l_plugin_0:GetMouse());
        v15:On();
        v27 = l_StarterGui_0.DescendantAdded:connect(v50);
        v36:disconnect();
        v28 = l_UserInputService_0.InputBegan:connect(v60);
        v29 = l_UserInputService_0.InputChanged:connect(v66);
        v30 = l_UserInputService_0.InputEnded:connect(v63);
        v31 = l_Selection_0.SelectionChanged:connect(v52);
        v33 = l_plugin_0:GetMouse().DragEnter:connect(v69);
        v32 = l_plugin_0.Deactivation:connect(Off);
        v37 = v19:connectSelectionInstancesChanged(v48);
        v34 = l_ChangeHistoryService_0.OnUndo:connect(v75);
        v35 = l_ChangeHistoryService_0.OnRedo:connect(v77);
        v19:connectFilteredSelectionChanged(v9);
        v19:connectFilteredSelectionChanged(v15);
        v19:connectFilteredSelectionChanged(v8);
        v19:connectFilteredSelectionChanged(v17);
        v52();
        v41();
        v79 = true;
        return;
    end;
end;
if v81 then
    l_StarterGui_0.ProcessUserInput = true;
    v81.Click:connect(function() --[[ Line: 484 ]]
        -- upvalues: v79 (ref)
        if v79 then
            Off();
            return;
        else
            On();
            return;
        end;
    end);
    local function v84(v82) --[[ Line: 492 ]] --[[ Name: testRestrictedInstance ]]
        local _ = v82.Name;
    end;
    local function v88() --[[ Line: 496 ]] --[[ Name: selectionChangedGlobal ]]
        -- upvalues: l_Selection_0 (copy), v84 (copy), v19 (copy)
        local v85 = l_Selection_0:Get();
        for v86 = 1, #v85 do
            local v87 = v85[v86];
            if pcall(v84, v87) and v19:passesGuiFilter(v87) then
                On();
                return;
            end;
        end;
        Off();
    end;
    l_Selection_0.SelectionChanged:connect(function() --[[ Line: 507 ]]
        -- upvalues: v88 (copy)
        spawn(v88);
    end);
end;
v36 = l_UserInputService_0.InputBegan:connect(v71);
v14:refreshPaintOrder();
v78 = true;
local l_MouseService_0 = game:GetService("MouseService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v7 = require(l_Parent_1.Packages.Roact);
local v8 = require(l_Parent_0.Implementation.DraggerToolModel);
local v9 = require(l_Parent_0.Utility.ViewChangeDetector);
local v10 = require(l_Parent_0.Utility.shouldDragAsFace);
local v11 = require(l_Parent_0.Flags.getFFlagDraggerImprovements);
local v12 = require(l_Parent_0.Flags.getFFlagDraggerFixUserInputMouse);
local v13 = v7.PureComponent:extend("DraggerToolComponent");
v13.init = function(v14) --[[ Line: 31 ]] --[[ Name: init ]]
    v14:setup(v14.props);
end;
v13.didMount = function(_) --[[ Line: 35 ]] --[[ Name: didMount ]]

end;
v13.willUnmount = function(v16) --[[ Line: 37 ]] --[[ Name: willUnmount ]]
    v16:teardown();
end;
v13.willUpdate = function(v17, v18, _) --[[ Line: 41 ]] --[[ Name: willUpdate ]]
    if v18.DraggerContext ~= v17.props.DraggerContext or v18.DraggerSchema ~= v17.props.DraggerSchema or v18.DraggerSettings ~= v17.props.DraggerSettings then
        v17:teardown();
        v17:setup(v18);
    end;
end;
v13.render = function(v20) --[[ Line: 52 ]] --[[ Name: render ]]
    return v20._draggerToolModel:render();
end;
v13.setup = function(v21, v22) --[[ Line: 56 ]] --[[ Name: setup ]]
    -- upvalues: l_HttpService_0 (copy), v8 (copy), v11 (copy), v12 (copy), l_UserInputService_0 (copy), v10 (copy), l_MouseService_0 (copy), v9 (copy), l_RunService_0 (copy)
    assert(v22.DraggerContext);
    assert(v22.DraggerSchema);
    assert(v22.DraggerSettings);
    v21._selectionBoundsAreDirty = false;
    v21._viewBoundsAreDirty = false;
    v21._bindName = "DraggerToolViewUpdate";
    local v23 = l_HttpService_0:GenerateGUID(false);
    v21._bindName = v21._bindName .. v23;
    v21._gameEatingEvents = false;
    v21._mouseCaptured = false;
    v21._draggerToolModel = v8.new(v22.DraggerContext, v22.DraggerSchema, v22.DraggerSettings, function() --[[ Line: 77 ]] --[[ Name: requestRender ]]
        -- upvalues: v21 (copy)
        if v21._isMounted then
            if v21.forceUpdate then
                v21:forceUpdate();
                return;
            else
                xpcall(function() --[[ Line: 82 ]]
                    -- upvalues: v21 (ref)
                    v21:setState({});
                end, function() --[[ Line: 85 ]]

                end);
            end;
        end;
    end, function() --[[ Line: 95 ]]
        -- upvalues: v21 (copy)
        v21._viewBoundsAreDirty = true;
    end, function() --[[ Line: 98 ]]
        -- upvalues: v21 (copy)
        v21._selectionBoundsAreDirty = true;
    end);
    v21._draggerToolModel:_processSelected();
    local _ = function(_) --[[ Line: 108 ]] --[[ Name: bailedAndWarnedHack ]]
        -- upvalues: v11 (ref), v12 (ref), v21 (copy)
        if v11() or v12() then
            return false;
        elseif v21._isMounted then
            return false;
        else
            return true;
        end;
    end;
    local l_Mouse_0 = v22.Mouse;
    if not v11() and not v12() then
        v21._mouseDownConnection = l_Mouse_0.Button1Down:Connect(function() --[[ Line: 123 ]]
            -- upvalues: v11 (ref), v12 (ref), v21 (copy)
            if not v11() and not v12() and (not v21._isMounted or false) then
                return;
            elseif v21._gameEatingEvents then
                return;
            else
                v21._mouseCaptured = true;
                v21._draggerToolModel:_processMouseDown();
                return;
            end;
        end);
        v21._mouseUpConnection = l_Mouse_0.Button1Up:Connect(function() --[[ Line: 134 ]]
            -- upvalues: v11 (ref), v12 (ref), v21 (copy)
            if not v11() and not v12() and (not v21._isMounted or false) then
                return;
            else
                v21._mouseCaptured = false;
                v21._draggerToolModel:_processMouseUp();
                return;
            end;
        end);
    end;
    v21._inputBeganConnection = l_UserInputService_0.InputBegan:Connect(function(v27, v28) --[[ Line: 142 ]]
        -- upvalues: v11 (ref), v12 (ref), v21 (copy)
        if v11() or v12() then
            if v28 or v21._gameEatingEvents then
                return;
            else
                local l_UserInputType_0 = v27.UserInputType;
                if l_UserInputType_0 == Enum.UserInputType.Keyboard then
                    v21._draggerToolModel:_processKeyDown(v27.KeyCode);
                    return;
                elseif l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch then
                    v21._mouseCaptured = true;
                    v21._draggerToolModel:_processMouseDown();
                    return;
                end;
            end;
        elseif not v11() and not v12() and (not v21._isMounted or false) then
            return;
        elseif v27.UserInputType == Enum.UserInputType.Keyboard then
            v21._draggerToolModel:_processKeyDown(v27.KeyCode);
        end;
    end);
    v21._inputEndedConnection = l_UserInputService_0.InputEnded:Connect(function(v30, v31) --[[ Line: 163 ]]
        -- upvalues: v11 (ref), v12 (ref), v21 (copy)
        if v11() or v12() then
            if v31 and not v21._mouseCaptured then
                return;
            else
                local l_UserInputType_1 = v30.UserInputType;
                if l_UserInputType_1 == Enum.UserInputType.Keyboard then
                    v21._draggerToolModel:_processKeyUp(v30.KeyCode);
                    return;
                elseif l_UserInputType_1 == Enum.UserInputType.MouseButton1 or l_UserInputType_1 == Enum.UserInputType.Touch then
                    v21._mouseCaptured = false;
                    v21._draggerToolModel:_processMouseUp();
                    return;
                end;
            end;
        elseif not v11() and not v12() and (not v21._isMounted or false) then
            return;
        elseif v30.UserInputType == Enum.UserInputType.Keyboard then
            v21._draggerToolModel:_processKeyUp(v30.KeyCode);
        end;
    end);
    v21._inputChangedConnection = l_UserInputService_0.InputChanged:Connect(function(v33, v34) --[[ Line: 185 ]]
        -- upvalues: v21 (copy)
        if v33.UserInputType == Enum.UserInputType.MouseMovement then
            if v34 then
                if not v21._gameEatingEvents and not v21._mouseCaptured then
                    v21._gameEatingEvents = true;
                    v21._draggerToolModel:_processMouseLeave();
                    return;
                end;
            elseif v21._gameEatingEvents then
                v21._gameEatingEvents = false;
                v21._draggerToolModel:_processMouseEnter();
            end;
        end;
    end);
    v21._dragEnterConnection = l_Mouse_0.DragEnter:Connect(function(v35) --[[ Line: 201 ]]
        -- upvalues: v11 (ref), v12 (ref), v21 (copy), v10 (ref)
        if not v11() and not v12() and (not v21._isMounted or false) then
            return;
        else
            if v21._gameEatingEvents then
                v21._gameEatingEvents = false;
                v21._draggerToolModel:_processMouseEnter();
            end;
            v21._mouseCaptured = true;
            if #v35 > 0 then
                if #v35 == 1 and v10(v35[1]) then
                    v21._draggerToolModel:_processToolboxInitiatedFaceDrag(v35);
                    return;
                else
                    v21._draggerToolModel:_processToolboxInitiatedFreeformSelectionDrag();
                end;
            end;
            return;
        end;
    end);
    v21._mouseEnterConnection = l_MouseService_0.MouseEnterStudioViewport:Connect(function() --[[ Line: 225 ]]
        -- upvalues: v21 (copy)
        v21._draggerToolModel:_processMouseEnter();
    end);
    v21._mouseLeaveConnection = l_MouseService_0.MouseLeaveStudioViewport:Connect(function() --[[ Line: 228 ]]
        -- upvalues: v21 (copy)
        v21._draggerToolModel:_processMouseLeave();
    end);
    local v36 = v9.new(l_Mouse_0);
    local v37 = v22.DraggerContext:shouldUseLocalSpace();
    l_RunService_0:BindToRenderStep(v21._bindName, Enum.RenderPriority.First.Value, function() --[[ Line: 234 ]]
        -- upvalues: v21 (copy), v36 (copy), v22 (copy), v37 (ref)
        if not v21._isMounted then
            return;
        else
            v21._draggerToolModel:update();
            local v38 = false;
            local v39 = false;
            if v36:poll() then
                v38 = true;
            end;
            if v21._selectionBoundsAreDirty then
                v21._selectionBoundsAreDirty = false;
                v39 = true;
            end;
            if v21._viewBoundsAreDirty then
                v21._viewBoundsAreDirty = false;
                v38 = true;
            end;
            local v40 = v22.DraggerContext:shouldUseLocalSpace();
            if v40 ~= v37 then
                v39 = true;
            end;
            if v39 then
                v21._draggerToolModel:_processSelectionChanged();
            end;
            if v38 and not v21._gameEatingEvents then
                v21._draggerToolModel:_processViewChanged();
            end;
            v37 = v40;
            return;
        end;
    end);
    v21._isMounted = true;
end;
v13.teardown = function(v41) --[[ Line: 278 ]] --[[ Name: teardown ]]
    -- upvalues: v11 (copy), v12 (copy), l_RunService_0 (copy)
    v41._isMounted = false;
    if not v11() and not v12() then
        v41._mouseDownConnection:Disconnect();
        v41._mouseDownConnection = nil;
        v41._mouseUpConnection:Disconnect();
        v41._mouseUpConnection = nil;
    end;
    v41._inputChangedConnection:Disconnect();
    v41._inputChangedConnection = nil;
    v41._inputBeganConnection:Disconnect();
    v41._inputBeganConnection = nil;
    v41._inputEndedConnection:Disconnect();
    v41._inputEndedConnection = nil;
    v41._dragEnterConnection:Disconnect();
    v41._dragEnterConnection = nil;
    v41._mouseEnterConnection:Disconnect();
    v41._mouseEnterConnection = nil;
    v41._mouseLeaveConnection:Disconnect();
    v41._mouseLeaveConnection = nil;
    l_RunService_0:UnbindFromRenderStep(v41._bindName);
    v41._draggerToolModel:_processDeselected();
end;
return v13;
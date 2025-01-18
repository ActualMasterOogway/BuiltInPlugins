local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConstraintTool");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Selection_0 = game:GetService("Selection");
local l_StudioService_0 = game:GetService("StudioService");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v7 = require(l_script_FirstAncestor_0.Packages.Roact);
local v8 = require(l_script_FirstAncestor_0.Src.ConstraintToolModel);
local v9 = require(l_DraggerFramework_0.Utility.ViewChangeDetector);
local v10 = v7.PureComponent:extend("ConstraintToolComponent");
v10.init = function(v11) --[[ Line: 30 ]] --[[ Name: init ]]
    v11:setup(v11.props);
end;
v10.didMount = function(_) --[[ Line: 34 ]] --[[ Name: didMount ]]

end;
v10.willUnmount = function(v13) --[[ Line: 36 ]] --[[ Name: willUnmount ]]
    v13:teardown();
end;
v10.willUpdate = function(v14, v15) --[[ Line: 40 ]] --[[ Name: willUpdate ]]
    if v15.DraggerContext ~= v14.props.DraggerContext or v15.DraggerSchema ~= v14.props.DraggerSchema or v15.DraggerSettings ~= v14.props.DraggerSettings then
        v14:teardown();
        v14:setup(v15);
    end;
end;
v10.render = function(v16) --[[ Line: 51 ]] --[[ Name: render ]]
    return v16._constraintToolModel:render();
end;
v10.setup = function(v17, v18) --[[ Line: 55 ]] --[[ Name: setup ]]
    -- upvalues: l_StudioService_0 (copy), l_HttpService_0 (copy), v8 (copy), l_Selection_0 (copy), l_UserInputService_0 (copy), v9 (copy), l_RunService_0 (copy)
    assert(v18.DraggerContext);
    assert(v18.DraggerSchema);
    assert(v18.DraggerSettings);
    assert(v18.ClosePluginCallback);
    assert(v18.constraintType);
    v17._selectionBoundsAreDirty = false;
    v17._viewBoundsAreDirty = false;
    v17._prevConstraintDetails = l_StudioService_0.ShowConstraintDetails;
    v17._prevWeldDetails = l_StudioService_0.ShowWeldDetails;
    v17._bindName = "ConstraintToolViewUpdate";
    local v19 = l_HttpService_0:GenerateGUID(false);
    v17._bindName = v17._bindName .. v19;
    v17._constraintToolModel = v8.new(v18.DraggerContext, v18.DraggerSchema, v18.DraggerSettings, v18.ClosePluginCallback, v18.undoAttachmentStack, v18.redoAttachmentStack, v18.recordingName, v18.plugin, v18.SetConstraintToolModelReference, function() --[[ Line: 71 ]] --[[ Name: requestRender ]]
        -- upvalues: v17 (copy)
        if v17._isMounted then
            if v17.forceUpdate then
                v17:forceUpdate();
                return;
            else
                v17:setState({});
            end;
        end;
    end, function() --[[ Line: 92 ]]
        -- upvalues: v17 (copy)
        v17._viewBoundsAreDirty = true;
    end);
    v17._constraintToolModel:_processSelected();
    v17._constraintToolModel:_setConstraintType(v18.constraintType);
    v17._constraintToolModel:_initSelectionHighlight();
    v17._constraintToolModel:_initAttachmentAdornment();
    l_Selection_0:Set({});
    local l_Mouse_0 = v18.Mouse;
    v17._inputBeganConnection = l_UserInputService_0.InputBegan:Connect(function(v21, v22) --[[ Line: 106 ]]
        -- upvalues: v17 (copy)
        if v22 then
            return;
        else
            local l_UserInputType_0 = v21.UserInputType;
            if l_UserInputType_0 == Enum.UserInputType.Keyboard then
                v17._constraintToolModel:_processKeyDown(v21.KeyCode);
                return;
            else
                if l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch then
                    v17._constraintToolModel:_processMouseDown();
                end;
                return;
            end;
        end;
    end);
    v17._inputEndedConnection = l_UserInputService_0.InputEnded:Connect(function(v24, _) --[[ Line: 117 ]]
        -- upvalues: v17 (copy)
        local l_UserInputType_1 = v24.UserInputType;
        if l_UserInputType_1 == Enum.UserInputType.Keyboard then
            v17._constraintToolModel:_processKeyUp(v24.KeyCode);
            return;
        else
            if l_UserInputType_1 == Enum.UserInputType.MouseButton1 or l_UserInputType_1 == Enum.UserInputType.Touch then
                v17._constraintToolModel:_processMouseUp();
            end;
            return;
        end;
    end);
    local v27 = v9.new(l_Mouse_0);
    l_RunService_0:BindToRenderStep(v17._bindName, Enum.RenderPriority.First.Value, function() --[[ Line: 127 ]]
        -- upvalues: v17 (copy), v27 (copy), l_StudioService_0 (ref)
        if not v17._isMounted then
            return;
        else
            v17._constraintToolModel:update();
            local v28 = false;
            if v27:poll() then
                v28 = true;
            end;
            if v17._viewBoundsAreDirty then
                v17._viewBoundsAreDirty = false;
                v28 = true;
            end;
            if v17._prevConstraintDetails ~= l_StudioService_0.ShowConstraintDetails or v17._prevWeldDetails ~= l_StudioService_0.ShowWeldDetails then
                v28 = true;
            end;
            if v28 then
                v17._constraintToolModel:_processViewChanged();
            end;
            v17._prevConstraintDetails = l_StudioService_0.ShowConstraintDetails;
            v17._prevWeldDetails = l_StudioService_0.ShowWeldDetails;
            return;
        end;
    end);
    v17._isMounted = true;
end;
v10.teardown = function(v29) --[[ Line: 163 ]] --[[ Name: teardown ]]
    -- upvalues: l_RunService_0 (copy)
    v29._isMounted = false;
    v29._inputBeganConnection:Disconnect();
    v29._inputBeganConnection = nil;
    v29._inputEndedConnection:Disconnect();
    v29._inputEndedConnection = nil;
    l_RunService_0:UnbindFromRenderStep(v29._bindName);
    v29._constraintToolModel:_processDeselected();
end;
return v10;
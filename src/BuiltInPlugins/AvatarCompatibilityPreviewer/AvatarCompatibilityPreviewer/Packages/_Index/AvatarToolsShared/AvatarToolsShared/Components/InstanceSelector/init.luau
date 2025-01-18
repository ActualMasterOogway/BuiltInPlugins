local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Selection_0 = game:GetService("Selection");
local v8 = v1.PureComponent:extend("InstanceSelector");
v2.Util.Typecheck.wrap(v8, script);
v8.setSelectedInstance = function(v9) --[[ Line: 35 ]] --[[ Name: setSelectedInstance ]]
    -- upvalues: l_Selection_0 (copy)
    if #l_Selection_0:Get() > 0 then
        local v10 = l_Selection_0:Get()[1];
        if v9.selectedItem ~= v10 then
            v9.selectedItem = v10;
        end;
    end;
end;
v8.getSelectedInstance = function(v11) --[[ Line: 44 ]] --[[ Name: getSelectedInstance ]]
    local l_selectedItem_0 = v11.selectedItem;
    v11:setSelectedInstance();
    local l_selectedItem_1 = v11.selectedItem;
    if l_selectedItem_1 == l_selectedItem_0 then
        return nil;
    else
        return l_selectedItem_1;
    end;
end;
v8.getMouseTarget = function(v14) --[[ Line: 54 ]] --[[ Name: getMouseTarget ]]
    local l_Target_0 = v14.props.Mouse:get().Target;
    if not l_Target_0 or v14.props.IsSelectedInstanceValid(l_Target_0) or not l_Target_0.Parent:FindFirstChild("HumanoidRootPart") then
        return l_Target_0;
    else
        return l_Target_0.Parent;
    end;
end;
v8.selectValidInstance = function(v16, v17, v18) --[[ Line: 66 ]] --[[ Name: selectValidInstance ]]
    local v19 = v16:getMouseTarget();
    local l_IsSelectedInstanceValid_0 = v16.props.IsSelectedInstanceValid;
    if v19 ~= nil then
        if l_IsSelectedInstanceValid_0(v19) then
            v17(v19);
            return;
        else
            v18(v19);
        end;
    end;
end;
v8.init = function(v21) --[[ Line: 78 ]] --[[ Name: init ]]
    -- upvalues: l_Selection_0 (copy), v1 (copy)
    v21.state = {
        hoverPart = nil
    };
    v21.selectedItem = nil;
    v21.selectInstance = function(v22) --[[ Line: 85 ]]
        -- upvalues: l_Selection_0 (ref)
        l_Selection_0:Set({
            v22
        });
    end;
    v21.deselect = function() --[[ Line: 89 ]]
        -- upvalues: l_Selection_0 (ref)
        l_Selection_0:Set({});
    end;
    v21.highlightInstance = function(v23) --[[ Line: 93 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            hoverPart = v23
        });
    end;
    v21.removeHighlight = function() --[[ Line: 99 ]]
        -- upvalues: v21 (copy), v1 (ref)
        v21:setState({
            hoverPart = v1.None
        });
    end;
end;
v8.didMount = function(v24) --[[ Line: 106 ]] --[[ Name: didMount ]]
    -- upvalues: l_Selection_0 (copy), l_RunService_0 (copy)
    local l_props_0 = v24.props;
    local l_IsSelectedInstanceValid_1 = l_props_0.IsSelectedInstanceValid;
    local l_OnValidSelection_0 = l_props_0.OnValidSelection;
    local l_OnInvalidSelection_0 = l_props_0.OnInvalidSelection;
    v24.SelectionChangedHandle = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 112 ]]
        -- upvalues: v24 (copy), l_IsSelectedInstanceValid_1 (copy), l_OnValidSelection_0 (copy), l_OnInvalidSelection_0 (copy)
        local v29 = v24:getSelectedInstance();
        if not v29 then
            return;
        elseif l_IsSelectedInstanceValid_1(v29) then
            l_OnValidSelection_0(v29);
            return;
        else
            l_OnInvalidSelection_0(v29);
            return;
        end;
    end);
    local v30 = v24.props.Mouse:get();
    if v30 and v30.Button1Down then
        v24.MouseButtonDown = v30.Button1Down:Connect(function() --[[ Line: 126 ]]
            -- upvalues: v24 (copy)
            v24:selectValidInstance(v24.selectInstance, v24.deselect);
        end);
    end;
    v24.Heartbeat = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 131 ]]
        -- upvalues: v24 (copy)
        v24:selectValidInstance(v24.highlightInstance, v24.removeHighlight);
    end);
end;
v8.render = function(v32) --[[ Line: 136 ]] --[[ Name: render ]]
    -- upvalues: l_CoreGui_0 (copy), v1 (copy)
    local l_state_0 = v32.state;
    local l_props_1 = v32.props;
    local l_hoverPart_0 = l_state_0.hoverPart;
    local v36 = l_props_1.Container or l_CoreGui_0;
    local l_Stylizer_0 = l_props_1.Stylizer;
    return v1.createElement(v1.Portal, {
        target = v36
    }, {
        HoverBox = l_hoverPart_0 and v1.createElement("SelectionBox", {
            Archivable = false, 
            Adornee = l_hoverPart_0, 
            LineThickness = l_Stylizer_0.HoverLineThickness, 
            StudioSelectionBox = true
        })
    });
end;
v8.willUnmount = function(v38) --[[ Line: 156 ]] --[[ Name: willUnmount ]]
    if v38.Heartbeat then
        v38.Heartbeat:Disconnect();
    end;
    if v38.SelectionChangedHandle then
        v38.SelectionChangedHandle:Disconnect();
    end;
    if v38.MouseButtonDown then
        v38.MouseButtonDown:Disconnect();
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin
})(v8));
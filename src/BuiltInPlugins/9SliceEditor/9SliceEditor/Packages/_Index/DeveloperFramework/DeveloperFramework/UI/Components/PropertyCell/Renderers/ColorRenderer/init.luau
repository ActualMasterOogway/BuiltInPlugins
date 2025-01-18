local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v3 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v3.withContext;
local l_Components_0 = l_Parent_0.UI.Components;
local v6 = require(l_Components_0.CaptureFocus);
local v7 = require(l_Components_0.ColorPicker);
local v8 = require(l_Components_0.IconButton);
local v9 = require(l_Components_0.Pane);
local v10 = require(l_Components_0.TextInput);
local v11 = v1.PureComponent:extend("ColorRenderer");
v11.init = function(v12) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v12.cellRef = v1.createRef();
    v12.state = {
        isPickerOpen = false, 
        ColorValue = v12.props.Value
    };
    v12.onClick = function() --[[ Line: 42 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            ColorValue = v12.props.Value, 
            isPickerOpen = true
        });
    end;
    v12.onClose = function() --[[ Line: 49 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            isPickerOpen = false
        });
    end;
    v12.onSave = function() --[[ Line: 55 ]]
        -- upvalues: v12 (copy)
        v12.props.OnChanged(v12.state.ColorValue);
        v12.onClose();
    end;
    v12.updateColor = function(v13) --[[ Line: 60 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            ColorValue = v13
        });
    end;
    v12.onTextEdited = function(v14) --[[ Line: 66 ]]
        -- upvalues: v12 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 67 ]]
            -- upvalues: v14 (copy)
            return Color3.fromHex(v14);
        end);
        if l_status_0 then
            v12.props.OnChanged(l_result_0);
        end;
    end;
    v12.calculatePosition = function(v17) --[[ Line: 75 ]]
        -- upvalues: v12 (copy)
        if not v12.cellRef or not v12.cellRef.current then
            return nil;
        else
            local l_AbsolutePosition_0 = v12.cellRef.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v12.cellRef.current.AbsoluteSize;
            local l_AbsoluteSize_1 = v17.AbsoluteSize;
            local v21 = l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
            local v22 = l_AbsoluteSize_1.Y - (l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y + 280);
            local v23 = l_AbsolutePosition_0.Y - 280;
            if v22 < 0 and v23 > 0 then
                v21 = l_AbsolutePosition_0.Y - 280;
            elseif v22 < 0 and v23 < 0 then
                v21 = l_AbsolutePosition_0.Y + v22 + l_AbsoluteSize_0.Y;
            end;
            local l_X_0 = l_AbsolutePosition_0.X;
            local v25 = l_AbsoluteSize_1.X - (l_X_0 + 250);
            if v25 < 0 then
                l_X_0 = l_X_0 + v25;
            end;
            return UDim2.fromOffset(l_X_0, v21);
        end;
    end;
end;
v11.renderColorPicker = function(v26) --[[ Line: 104 ]] --[[ Name: renderColorPicker ]]
    -- upvalues: v1 (copy), v9 (copy), v2 (copy), v7 (copy), v8 (copy)
    local l_props_0 = v26.props;
    local l_state_0 = v26.state;
    local v29 = l_props_0.Focus:get();
    local v30 = v26.calculatePosition(v29);
    return v1.createElement(v9, {
        [v2.Tag] = "Paper X-Center X-Column X-Fit X-Stroke", 
        Position = v30
    }, {
        ColorPicker = v1.createElement(v7, {
            Color = l_state_0.ColorValue, 
            LayoutOrder = 1, 
            OnColorChanged = v26.updateColor, 
            Size = UDim2.new(1, 0, 0, 225)
        }), 
        ButtonContainer = v1.createElement(v9, {
            LayoutOrder = 2, 
            [v2.Tag] = "X-Center X-FitY X-Pad X-RowM"
        }, {
            Close = v1.createElement(v8, {
                LayoutOrder = 1, 
                Text = "Close", 
                OnClick = v26.onClose
            }), 
            Save = v1.createElement(v8, {
                LayoutOrder = 2, 
                Text = "Save", 
                OnClick = v26.onSave
            })
        })
    });
end;
v11.render = function(v31) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v9 (copy), v10 (copy), v8 (copy), v6 (copy)
    local l_props_1 = v31.props;
    local l_state_1 = v31.state;
    local v34 = if l_props_1.Value then l_props_1.Value:ToHex() else "#";
    return v1.createElement(v9, {
        [v1.Ref] = v31.cellRef
    }, {
        Input = v1.createElement(v10, {
            Disabled = l_props_1.Disabled, 
            LeadingComponent = v8, 
            LeadingComponentProps = {
                BackgroundColor = l_props_1.Value, 
                Size = UDim2.fromOffset(16, 16), 
                OnClick = v31.onClick
            }, 
            OnFocusLost = v31.onTextEdited, 
            Size = if l_props_1.AutomaticSize then UDim2.new(1, 0, 0, l_props_1.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
            Text = v34
        }), 
        PortalToRoot = l_state_1.isPickerOpen and v1.createElement(v6, {
            OnFocusLost = v31.onClose
        }, {
            Menu = l_state_1.isPickerOpen and v31:renderColorPicker()
        })
    });
end;
return (l_withContext_0({
    Focus = v3.Focus
})(v11));
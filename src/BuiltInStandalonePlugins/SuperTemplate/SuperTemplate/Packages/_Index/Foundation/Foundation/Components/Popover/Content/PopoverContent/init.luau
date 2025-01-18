local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.View);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local v4 = require(script.Parent.Parent.PopoverContext);
local v5 = require(l_script_FirstAncestor_0.Providers.Overlay.OverlayContext);
local v6 = require(script.Parent.Parent.useFloating);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v10 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v11 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v12 = require(l_Parent_0.React);
local v13 = require(l_Parent_0.ReactRoblox);
local v14 = {
    side = v10.Bottom, 
    align = v11.Center, 
    hasArrow = true
};
return v12.forwardRef(function(v15, v16) --[[ Line: 47 ]] --[[ Name: PopoverContent ]]
    -- upvalues: v8 (copy), v14 (copy), v12 (copy), v4 (copy), v5 (copy), v7 (copy), v6 (copy), v2 (copy), v9 (copy), v3 (copy), v13 (copy)
    local v17 = v8(v15, v14);
    local v18 = v12.useContext(v4);
    local v19 = v12.useContext(v5);
    local v20 = v7();
    local l_Size_200_0 = v20.Size.Size_200;
    local v22 = l_Size_200_0 * 1.4142135623730951 / 2;
    local v23 = v12.useRef(nil);
    v12.useImperativeHandle(v16, function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy)
        return v23.current;
    end, {});
    local v24, v25, v26, v27, v28 = v6(v18.isOpen, v18.anchor, v23.current, v19.overlay, v17.side, v17.align, if v17.hasArrow then v22 else 0);
    local v29 = v12.useRef(nil);
    local v31 = v12.useCallback(function(v30) --[[ Line: 76 ]]
        -- upvalues: v29 (copy), v17 (copy)
        if v29.current then
            v29.current:Disconnect();
        end;
        if v30 ~= nil and v17.onPressedOutside then
            v29.current = v30:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 82 ]]
                -- upvalues: v30 (copy), v17 (ref)
                if v30.GuiState == Enum.GuiState.Press then
                    v17.onPressedOutside();
                end;
            end);
        end;
    end, {
        v17.onPressedOutside
    });
    local v36 = v12.createElement(v12.Fragment, nil, {
        Backdrop = if v17.onPressedOutside and v18.isOpen then v12.createElement(v2, {
            ZIndex = 1, 
            stateLayer = {
                affordance = v9.None
            }, 
            Size = UDim2.fromScale(1, 1), 
            ref = v31
        }) else nil, 
        Shadow = v12.createElement(v3, {
            Image = "component_assets/dropshadow_17_8", 
            Size = v26:map(function(v32) --[[ Line: 103 ]]
                return v32 + UDim2.fromOffset(16, 16);
            end), 
            Position = v24:map(function(v33) --[[ Line: 106 ]]
                return UDim2.fromOffset(v33.X - 8, v33.Y - 8 + 2);
            end), 
            ZIndex = 2, 
            Visible = v25, 
            slice = {
                center = Rect.new(16, 16, 17, 17)
            }, 
            imageStyle = v20.Color.Shift.Shift_100
        }), 
        Arrow = if v17.hasArrow then v12.createElement(v2, {
            Size = UDim2.fromOffset(l_Size_200_0, l_Size_200_0), 
            Position = v27:map(function(v34) --[[ Line: 119 ]]
                return UDim2.fromOffset(v34.X, v34.Y);
            end), 
            Rotation = 45, 
            ZIndex = 3, 
            Visible = v25, 
            tag = "bg-surface-300 anchor-center-center"
        }) else nil, 
        Content = v12.createElement(v2, {
            Position = v24:map(function(v35) --[[ Line: 129 ]]
                return UDim2.fromOffset(v35.X, v35.Y);
            end), 
            Visible = v25, 
            sizeConstraint = {
                MaxSize = v28
            }, 
            stateLayer = {
                affordance = v9.None
            }, 
            ZIndex = 4, 
            onActivated = v17.onPressedOutside and function() --[[ Line: 141 ]]

            end or nil, 
            tag = "auto-xy bg-surface-300 radius-medium", 
            ref = v23
        }, v17.children)
    });
    if not v19.overlay then
        return v36;
    else
        return v13.createPortal(v36, v19.overlay);
    end;
end);
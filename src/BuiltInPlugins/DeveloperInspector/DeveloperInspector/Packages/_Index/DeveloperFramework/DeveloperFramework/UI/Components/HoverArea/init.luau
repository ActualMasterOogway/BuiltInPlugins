local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v5 = v1.PureComponent:extend("HoverArea");
l_Typecheck_0.wrap(v5, script);
v5.init = function(v6, v7) --[[ Line: 33 ]] --[[ Name: init ]]
    local l_Priority_0 = v7.Priority;
    local l_Cursor_0 = v7.Cursor;
    v6.mouseEnter = function() --[[ Line: 37 ]]
        -- upvalues: v6 (copy), l_Cursor_0 (copy), l_Priority_0 (copy)
        local l_props_0 = v6.props;
        l_props_0.Mouse:__pushCursor(l_Cursor_0, l_Priority_0);
        if l_props_0.MouseEnter then
            l_props_0.MouseEnter();
        end;
    end;
    v6.mouseLeave = function() --[[ Line: 45 ]]
        -- upvalues: v6 (copy), l_Priority_0 (copy)
        local l_props_1 = v6.props;
        l_props_1.Mouse:__popCursor(l_Priority_0);
        if l_props_1.MouseLeave then
            l_props_1.MouseLeave();
        end;
    end;
end;
v5.willUnmount = function(v12) --[[ Line: 54 ]] --[[ Name: willUnmount ]]
    v12.props.Mouse:__resetCursor();
end;
v5.render = function(v13) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_2 = v13.props;
    local l_AutomaticSize_0 = l_props_2.AutomaticSize;
    local v16 = l_props_2.Size or UDim2.fromScale(1, 1);
    if not l_props_2.Size then
        if l_AutomaticSize_0 == Enum.AutomaticSize.X then
            v16 = UDim2.fromScale(0, 1);
        elseif l_AutomaticSize_0 == Enum.AutomaticSize.Y then
            v16 = UDim2.fromScale(1, 0);
        elseif l_AutomaticSize_0 == Enum.AutomaticSize.XY then
            v16 = UDim2.fromScale(0, 0);
        end;
    end;
    local l_Position_0 = l_props_2.Position;
    local v18 = l_props_2[v1.Children];
    return v1.createElement("Frame", {
        AnchorPoint = l_props_2.AnchorPoint, 
        AutomaticSize = l_AutomaticSize_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_2.LayoutOrder, 
        Position = l_Position_0, 
        Size = v16, 
        [v1.Event.MouseEnter] = v13.mouseEnter, 
        [v1.Event.MouseLeave] = v13.mouseLeave
    }, v18);
end;
return (l_withContext_0({
    Mouse = v2.Mouse
})(v5));
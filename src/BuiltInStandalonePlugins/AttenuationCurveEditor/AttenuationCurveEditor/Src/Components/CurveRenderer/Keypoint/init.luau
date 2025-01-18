local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v6.Styling.joinTags;
local l_DragListener_0 = v6.UI.DragListener;
local l_HoverArea_0 = v6.UI.HoverArea;
local l_isInputMainPress_0 = v6.Util.isInputMainPress;
local l_Attribute_0 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles):GetAttribute("CursorOpenedHand");
local v12 = require(l_Parent_0.PlotRectUtil);
return function(v13) --[[ Line: 37 ]] --[[ Name: Keypoint ]]
    -- upvalues: l_useState_0 (copy), l_useMemo_0 (copy), v12 (copy), l_useCallback_0 (copy), l_isInputMainPress_0 (copy), v2 (copy), l_joinTags_0 (copy), l_HoverArea_0 (copy), l_Attribute_0 (copy), l_DragListener_0 (copy)
    local v14, v15 = l_useState_0(false);
    local v16 = l_useMemo_0(function() --[[ Line: 40 ]]
        -- upvalues: v12 (ref), v13 (copy)
        return v12.plotToViewPosition(v13.Position, v13.PlotRect);
    end, {
        v13.Position, 
        v13.PlotRect
    });
    local v17 = l_useMemo_0(function() --[[ Line: 44 ]]
        -- upvalues: v12 (ref), v16 (copy)
        return v12.rectContains(v16, Rect.new(0, 0, 1, 1), 0.001);
    end, {
        v16
    });
    local v18 = l_useCallback_0(function() --[[ Line: 48 ]]
        -- upvalues: v15 (copy), v13 (copy)
        v15(true);
        if v13.OnHoverStart then
            v13.OnHoverStart();
        end;
    end, {
        v13.OnHoverStart, 
        v15
    });
    local v19 = l_useCallback_0(function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy), v13 (copy)
        v15(false);
        if v13.OnHoverEnd then
            v13.OnHoverEnd();
        end;
    end, {
        v13.OnHoverEnd, 
        v15
    });
    local v22 = l_useCallback_0(function(v20) --[[ Line: 64 ]]
        -- upvalues: v13 (copy)
        if v13.OnMoved then
            local v21 = Vector2.new(v20.Position.X, v20.Position.Y);
            v13.OnMoved(v21);
        end;
    end, {
        v13.OnMoved
    });
    local v23 = l_useCallback_0(function() --[[ Line: 71 ]]
        -- upvalues: v13 (copy)
        if v13.OnDragEnd then
            v13.OnDragEnd();
        end;
    end, {
        v13.OnDragEnd
    });
    local v26 = l_useCallback_0(function(_, v25) --[[ Line: 77 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v13 (copy)
        if l_isInputMainPress_0(v25) then
            if v13.OnDragStart then
                v13.OnDragStart();
                return;
            end;
        elseif v25.UserInputType == Enum.UserInputType.MouseButton2 and v13.OnRightClick then
            v13.OnRightClick();
        end;
    end, {
        v13.OnDragStart, 
        v13.OnRightClick
    });
    local v27 = "";
    if v13.IsDragging then
        v27 = "Pressed";
    elseif v13.Selected and v14 then
        v27 = "Hovered";
    elseif v13.Selected then
        v27 = "Selected";
    end;
    return (not not v17 or v13.IsDragging) and v2.createElement("ImageButton", {
        Position = UDim2.fromScale(v16.X, v16.Y), 
        [v2.Tag] = l_joinTags_0("CurvePointOuter", v27), 
        [v2.Event.InputBegan] = v26
    }, {
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = v18, 
            MouseLeave = v19
        }), 
        DragListener = v13.IsDragging and v2.createElement(l_DragListener_0, {
            OnDragMoved = v22, 
            OnDragEnded = v23
        }), 
        Inner = v2.createElement("ImageButton", {
            [v2.Tag] = l_joinTags_0("CurvePoint", v27), 
            [v2.Event.InputBegan] = v26
        })
    });
end;
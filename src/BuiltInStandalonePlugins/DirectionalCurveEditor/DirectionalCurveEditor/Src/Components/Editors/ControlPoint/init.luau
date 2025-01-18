local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useMemo_0 = v1.useMemo;
local l_useState_0 = v1.useState;
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v5.Styling.joinTags;
local l_DragListener_0 = v5.UI.DragListener;
local l_HoverArea_0 = v5.UI.HoverArea;
local l_isInputMainPress_0 = v5.Util.isInputMainPress;
local l_Attribute_0 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles):GetAttribute("CursorOpenedHand");
local v11 = require(l_script_FirstAncestor_0.Src.Components.CurveRenderer.PlotRectUtil);
return function(v12) --[[ Line: 35 ]] --[[ Name: ControlPoint ]]
    -- upvalues: l_useState_0 (copy), l_useMemo_0 (copy), v11 (copy), l_useCallback_0 (copy), l_isInputMainPress_0 (copy), v1 (copy), l_joinTags_0 (copy), l_HoverArea_0 (copy), l_Attribute_0 (copy), l_DragListener_0 (copy)
    local v13, v14 = l_useState_0(false);
    local l_PlotRect_0 = v12.PlotRect;
    local l_PlotRef_0 = v12.PlotRef;
    local v17 = l_useMemo_0(function() --[[ Line: 40 ]]
        -- upvalues: v11 (ref), v12 (copy)
        return v11.plotToViewPosition(v12.Position, v12.PlotRect);
    end, {
        v12.Position, 
        v12.PlotRect
    });
    local v18 = l_useMemo_0(function() --[[ Line: 44 ]]
        -- upvalues: v11 (ref), v17 (copy)
        return v11.rectContains(v17, Rect.new(0, 0, 1, 1), 0.001);
    end, {
        v17
    });
    local v19 = l_useCallback_0(function() --[[ Line: 48 ]]
        -- upvalues: v14 (copy), v12 (copy)
        v14(true);
        if v12.OnHoverStart then
            v12.OnHoverStart();
        end;
    end, {
        v12.OnHoverStart
    });
    local v20 = l_useCallback_0(function() --[[ Line: 56 ]]
        -- upvalues: v14 (copy)
        v14(false);
    end, {});
    local v24 = l_useCallback_0(function(v21) --[[ Line: 60 ]]
        -- upvalues: l_PlotRef_0 (copy), v12 (copy), v11 (ref), l_PlotRect_0 (copy)
        if not l_PlotRef_0.current or not v12.OnMoved then
            return;
        else
            local v22 = Vector2.new(v21.Position.X, v21.Position.Y);
            local v23 = v11.mouseCoordsToPlotPosition(v22, l_PlotRect_0, l_PlotRef_0.current);
            v23 = Vector2.new(math.clamp(v23.X, l_PlotRect_0.Min.X, l_PlotRect_0.Max.X), (math.clamp(v23.Y, l_PlotRect_0.Min.Y, l_PlotRect_0.Max.Y)));
            if v23 and v12.OnMoved then
                v12.OnMoved(v23);
            end;
            return;
        end;
    end, {
        v12.OnMoved
    });
    local v25 = l_useCallback_0(function() --[[ Line: 76 ]]
        -- upvalues: v12 (copy)
        if v12.OnDragEnd then
            v12.OnDragEnd();
        end;
    end, {
        v12.OnDragEnd
    });
    local v28 = l_useCallback_0(function(_, v27) --[[ Line: 82 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v12 (copy)
        if l_isInputMainPress_0(v27) then
            if v12.OnDragStart then
                v12.OnDragStart();
                return;
            end;
        elseif v27.UserInputType == Enum.UserInputType.MouseButton2 and v12.OnRightClick then
            v12.OnRightClick();
        end;
    end, {
        v12.OnDragStart, 
        v12.OnRightClick
    });
    local v29 = "";
    if v12.IsDragging then
        v29 = "Pressed";
    elseif v12.IsSelected and v13 then
        v29 = "Hovered";
    elseif v12.IsSelected then
        v29 = "Selected";
    end;
    return (not not v18 or v12.IsDragging) and v1.createElement("ImageButton", {
        Position = UDim2.fromScale(v17.X, v17.Y), 
        [v1.Tag] = l_joinTags_0("CurvePointOuter", v29), 
        [v1.Event.InputBegan] = v28
    }, {
        HoverArea = v1.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = v19, 
            MouseLeave = v20
        }), 
        DragListener = v12.IsDragging and v1.createElement(l_DragListener_0, {
            OnDragMoved = v24, 
            OnDragEnded = v25
        }), 
        Inner = v1.createElement("ImageButton", {
            [v1.Tag] = l_joinTags_0("CurvePoint", v29), 
            [v1.Event.InputBegan] = v28
        })
    });
end;
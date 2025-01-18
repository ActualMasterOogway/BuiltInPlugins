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
return function(v12) --[[ Line: 36 ]] --[[ Name: PolarControlPoint ]]
    -- upvalues: l_useState_0 (copy), l_useMemo_0 (copy), v11 (copy), l_useCallback_0 (copy), l_isInputMainPress_0 (copy), v1 (copy), l_joinTags_0 (copy), l_HoverArea_0 (copy), l_Attribute_0 (copy), l_DragListener_0 (copy)
    local v13, v14 = l_useState_0(false);
    local l_PlotRef_0 = v12.PlotRef;
    local v16 = l_useMemo_0(function() --[[ Line: 40 ]]
        -- upvalues: v11 (ref), v12 (copy)
        return v11.plotToAbsolutePolar(v12.Position, v12.IsRight, v12.PlotAbsoluteSize);
    end, {
        v12.Position, 
        v12.IsRight, 
        v12.PlotAbsoluteSize
    });
    local v17 = l_useCallback_0(function() --[[ Line: 44 ]]
        -- upvalues: v14 (copy), v12 (copy)
        v14(true);
        if v12.OnHoverStart then
            v12.OnHoverStart();
        end;
    end, {
        v12.OnHoverStart
    });
    local v18 = l_useCallback_0(function() --[[ Line: 52 ]]
        -- upvalues: v14 (copy)
        v14(false);
    end, {});
    local v22 = l_useCallback_0(function(v19) --[[ Line: 56 ]]
        -- upvalues: l_PlotRef_0 (copy), v12 (copy), v11 (ref)
        if not l_PlotRef_0.current or not v12.OnMoved then
            return;
        else
            local v20 = Vector2.new(v19.Position.X, v19.Position.Y);
            local v21 = v11.mouseToPlotPolar(v20, l_PlotRef_0.current);
            v21 = Vector2.new(math.clamp(v21.X, 0, 180), (math.clamp(v21.Y, 0, 1)));
            v12.OnMoved(v21);
            return;
        end;
    end, {
        v12.OnMoved
    });
    local v23 = l_useCallback_0(function() --[[ Line: 68 ]]
        -- upvalues: v12 (copy)
        if v12.OnDragEnd then
            v12.OnDragEnd();
        end;
    end, {
        v12.OnDragEnd
    });
    local v26 = l_useCallback_0(function(_, v25) --[[ Line: 74 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v12 (copy)
        if l_isInputMainPress_0(v25) then
            if v12.OnDragStart then
                v12.OnDragStart();
                return;
            end;
        elseif v25.UserInputType == Enum.UserInputType.MouseButton2 and v12.OnRightClick then
            v12.OnRightClick();
        end;
    end, {
        v12.OnDragStart, 
        v12.OnRightClick
    });
    local v27 = "";
    if v12.IsDragging then
        v27 = "Pressed";
    elseif v12.IsSelected and v13 then
        v27 = "Hovered";
    elseif v12.IsSelected then
        v27 = "Selected";
    end;
    return v1.createElement("ImageButton", {
        Position = UDim2.fromOffset(v16.X, v16.Y), 
        [v1.Tag] = l_joinTags_0("CurvePointOuter", v27), 
        [v1.Event.InputBegan] = v26
    }, {
        HoverArea = v1.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = v17, 
            MouseLeave = v18
        }), 
        DragListener = v12.IsDragging and v1.createElement(l_DragListener_0, {
            OnDragMoved = v22, 
            OnDragEnded = v23
        }), 
        Inner = v1.createElement("ImageButton", {
            [v1.Tag] = l_joinTags_0("CurvePoint", v27), 
            [v1.Event.InputBegan] = v26
        })
    });
end;
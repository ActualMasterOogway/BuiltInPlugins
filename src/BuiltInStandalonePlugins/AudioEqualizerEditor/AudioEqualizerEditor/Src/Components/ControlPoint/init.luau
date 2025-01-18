local _ = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useContext_0 = v2.useContext;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v7 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_joinTags_0 = v7.Styling.joinTags;
local l_DragListener_0 = v7.UI.DragListener;
local l_HoverArea_0 = v7.UI.HoverArea;
local l_isInputMainPress_0 = v7.Util.isInputMainPress;
local l_Attribute_0 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles):GetAttribute("CursorOpenedHand");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v16) --[[ Line: 37 ]] --[[ Name: ControlPoint ]]
    -- upvalues: l_useContext_0 (copy), l_ContextServices_0 (copy), l_useState_0 (copy), l_useMemo_0 (copy), v15 (copy), l_useCallback_0 (copy), l_isInputMainPress_0 (copy), v2 (copy), l_joinTags_0 (copy), l_HoverArea_0 (copy), l_Attribute_0 (copy), l_DragListener_0 (copy)
    local v17 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v18, v19 = l_useState_0(false);
    local v20 = v16.DragTarget == v16.Label;
    local v21 = l_useMemo_0(function() --[[ Line: 44 ]]
        -- upvalues: v15 (ref), v16 (copy)
        return v15.plotToView(v16.Position);
    end, {
        v16.Position
    });
    local v22 = l_useCallback_0(function() --[[ Line: 48 ]]
        -- upvalues: v19 (copy)
        v19(true);
    end, {});
    local v23 = l_useCallback_0(function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy)
        v19(false);
    end, {});
    local v26 = l_useCallback_0(function(v24) --[[ Line: 56 ]]
        -- upvalues: v16 (copy)
        if v16.OnMoved then
            local v25 = Vector2.new(v24.Position.X, v24.Position.Y);
            v16.OnMoved(v25);
        end;
    end, {
        v16.OnMoved
    });
    local v27 = l_useCallback_0(function() --[[ Line: 63 ]]
        -- upvalues: v16 (copy)
        if v16.OnDragEnd then
            v16.OnDragEnd();
        end;
    end, {
        v16.OnDragEnd
    });
    local v30 = l_useCallback_0(function(_, v29) --[[ Line: 69 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v16 (copy)
        if l_isInputMainPress_0(v29) then
            if v16.OnDragStart then
                v16.OnDragStart(v16.Label);
                return;
            end;
        elseif v29.UserInputType == Enum.UserInputType.MouseButton2 and v16.OnRightClick then
            v16.OnRightClick();
        end;
    end, {
        v16.OnDragStart, 
        v16.Label
    });
    local v33 = l_useCallback_0(function(_, v32) --[[ Line: 81 ]]
        -- upvalues: v16 (copy)
        if v32.UserInputType == Enum.UserInputType.MouseWheel and v16.OnScroll then
            v16.OnScroll(v32.Position.Z);
        end;
    end, {
        v16.OnScroll
    });
    local v34 = "";
    if v20 then
        v34 = "Pressed";
    elseif v18 then
        v34 = "Hovered";
    end;
    return v2.createElement("ImageButton", {
        Position = UDim2.fromScale(v21.X, v21.Y), 
        [v2.Tag] = l_joinTags_0("ControlPoint", v34), 
        [v2.Event.InputBegan] = v30, 
        [v2.Event.InputChanged] = v33
    }, {
        Inner = v2.createElement("ImageLabel"), 
        Text = v2.createElement("TextLabel", {
            Text = v17:getText("Label", "ControlPoint_" .. v16.Label)
        }), 
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = v22, 
            MouseLeave = v23
        }), 
        DragListener = v20 and v2.createElement(l_DragListener_0, {
            OnDragMoved = v26, 
            OnDragEnded = v27
        })
    });
end;
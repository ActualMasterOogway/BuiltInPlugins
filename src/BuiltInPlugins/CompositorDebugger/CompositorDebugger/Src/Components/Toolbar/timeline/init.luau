local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_join_0 = v1.join;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_DragListener_0 = l_UI_0.DragListener;
local l_Pane_0 = l_UI_0.Pane;
local v11 = require(script.Parent.timelineTick);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v13 = require(l_Thunks_0.SetScrubberOffset);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v16 = require(l_Util_0.Constants);
local v17 = v3.PureComponent:extend("Timeline");
v17.init = function(v18) --[[ Line: 40 ]] --[[ Name: init ]]
    v18.state = {
        dragging = false
    };
    v18.onAbsoluteSizeChanged = function(v19) --[[ Line: 45 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            absoluteSize = v19.AbsoluteSize
        });
    end;
    v18.setScrubberPosition = function(v20) --[[ Line: 51 ]]
        -- upvalues: v18 (copy)
        local v21 = math.clamp((v20 - v18.props.MouseOffset) / v18.state.absoluteSize.X - 1, -1, 0) * v18.props.Timespan;
        v18.props.SetScrubberOffset(v21);
    end;
    v18.onDragStarted = function(_, v23) --[[ Line: 57 ]]
        -- upvalues: v18 (copy)
        if v23.UserInputType == Enum.UserInputType.MouseButton1 then
            v18.setScrubberPosition(v23.Position.X);
            v18:setState({
                dragging = true
            });
        end;
    end;
    v18.onDragMoved = function(v24) --[[ Line: 66 ]]
        -- upvalues: v18 (copy)
        if v18.state.dragging then
            v18.setScrubberPosition(v24.Position.X);
        end;
    end;
    v18.onDragEnded = function() --[[ Line: 72 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            dragging = false
        });
        v18.props.Analytics:report("onScrubbing");
    end;
end;
v17.renderTicks = function(v25, v26) --[[ Line: 80 ]] --[[ Name: renderTicks ]]
    -- upvalues: v16 (copy), v3 (copy), v11 (copy)
    local l_Timespan_0 = v25.props.Timespan;
    local v28 = v16.TIMECONTROLS_INVERVALS[l_Timespan_0] or v16.TIMECONTROLS_INVERVALS[v16.DEFAULT_TIMECONTROLS_INTERVAL];
    local l_Minor_0 = v28.Minor;
    local l_Medium_0 = v28.Medium;
    local l_Major_0 = v28.Major;
    local v32 = nil;
    for v33 = 0, l_Timespan_0, l_Minor_0 do
        v32 = v33 == 0 and "RBorder" or v33 == l_Timespan_0 and "LBorder" or v33 % l_Major_0 == 0 and "Major" or l_Medium_0 and v33 % l_Medium_0 == 0 and "Medium" or "Minor";
        local v34 = 1 - v33 / l_Timespan_0;
        v26["Tick_" .. tostring(v33)] = v3.createElement(v11, {
            ZIndex = 1, 
            Position = UDim2.fromScale(v34, 0), 
            Tick = v33, 
            [v3.Tag] = v32
        });
    end;
end;
v17.render = function(v35) --[[ Line: 116 ]] --[[ Name: render ]]
    -- upvalues: l_join_0 (copy), v3 (copy), l_DragListener_0 (copy), l_Pane_0 (copy)
    local l_state_0 = v35.state;
    local l_props_0 = v35.props;
    local v38 = l_join_0(l_props_0.children, {
        DragListener = if l_state_0.dragging then v3.createElement(l_DragListener_0, {
            OnDragMoved = v35.onDragMoved, 
            OnDragEnded = v35.onDragEnded
        }) else nil
    });
    v35:renderTicks(v38);
    return v3.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        [v3.Change.AbsoluteSize] = v35.onAbsoluteSizeChanged, 
        [v3.Event.InputBegan] = v35.onDragStarted, 
        [v3.Tag] = l_props_0[v3.Tag]
    }, v38);
end;
v17 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization
})(v17);
return (v4.connect(nil, function(v39) --[[ Line: 145 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy)
    return {
        SetScrubberOffset = function(v40) --[[ Line: 147 ]] --[[ Name: SetScrubberOffset ]]
            -- upvalues: v39 (copy), v13 (ref)
            v39(v13(v40));
        end
    };
end)(v17));
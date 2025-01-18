local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useContext_0 = v2.useContext;
local l_useState_0 = v2.useState;
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_Pane_0 = v6.UI.Pane;
local l_showContextMenu_0 = v6.UI.showContextMenu;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(l_Parent_0.ControlPoint);
local v12 = require(l_script_FirstAncestor_0.Src.Util.FilterTypeUtil);
local v13 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v14) --[[ Line: 34 ]] --[[ Name: FilterHandles ]]
    -- upvalues: l_useContext_0 (copy), l_ContextServices_0 (copy), l_useState_0 (copy), v12 (copy), l_useCallback_0 (copy), v13 (copy), l_showContextMenu_0 (copy), l_script_FirstAncestor_0 (copy), v2 (copy), l_Pane_0 (copy), v11 (copy)
    local v15 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v16 = not v14.FilterHook.bypass;
    local v17, v18 = l_useState_0("");
    local v19 = v12.hasGain(v14.FilterHook.filterType);
    local v20 = v12.hasQ(v14.FilterHook.filterType);
    local v22 = l_useCallback_0(function(v21) --[[ Line: 44 ]]
        -- upvalues: v18 (copy)
        v18(v21);
    end, {});
    local v23 = l_useCallback_0(function() --[[ Line: 48 ]]
        -- upvalues: v18 (copy)
        v18("");
    end, {});
    local v25 = l_useCallback_0(function(v24) --[[ Line: 53 ]]
        -- upvalues: v13 (ref), v14 (copy), v19 (copy)
        v24 = v13.mouseToPlot(v24, v14.PlotRef.current);
        v14.FilterHook.setFrequency(v24.X);
        if v19 then
            v14.FilterHook.setGain(v24.Y);
        end;
    end, {
        v14.PlotRef, 
        v14.FilterHook.filterType, 
        v14.FilterHook.setGain, 
        v14.FilterHook.setFrequency
    });
    local v27 = l_useCallback_0(function(v26) --[[ Line: 64 ]]
        -- upvalues: v14 (copy)
        v14.FilterHook.setFilterType(v26);
    end, {
        v14.FilterHook.setFilterType
    });
    local v29 = l_useCallback_0(function() --[[ Line: 68 ]]
        -- upvalues: v12 (ref), v15 (copy), v27 (copy), l_showContextMenu_0 (ref), l_script_FirstAncestor_0 (ref)
        local v28 = v12.getContextMenuItems(v15, v27);
        l_showContextMenu_0(l_script_FirstAncestor_0.Parent, v28);
    end, {});
    local v32 = l_useCallback_0(function(v30) --[[ Line: 73 ]]
        -- upvalues: v20 (copy), v13 (ref), v14 (copy)
        if v20 then
            local v31 = math.pow(2, v13.log2(v14.FilterHook.q) + 0.3 * v30);
            v14.FilterHook.setQ(v31);
        end;
    end, {
        v14.FilterHook.filterType, 
        v14.FilterHook.q, 
        v14.FilterHook.setQ
    });
    local v33 = 0;
    if v19 then
        v33 = v14.FilterHook.gain;
    end;
    return v16 and v2.createElement(l_Pane_0, {
        Active = true, 
        LayoutOrder = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Control = v2.createElement(v11, {
            Position = Vector2.new(v14.FilterHook.frequency, v33), 
            Label = "F", 
            DragTarget = v17, 
            OnDragStart = v22, 
            OnMoved = v25, 
            OnDragEnd = v23, 
            OnRightClick = v29, 
            OnScroll = v32
        })
    });
end;
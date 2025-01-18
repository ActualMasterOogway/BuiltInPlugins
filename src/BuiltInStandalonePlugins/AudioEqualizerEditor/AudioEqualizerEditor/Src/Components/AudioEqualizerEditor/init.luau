local l_Parent_0 = script.Parent;
local l_l_Parent_0_FirstAncestor_0 = l_Parent_0:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_l_Parent_0_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useContext_0 = v2.useContext;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local v8 = require(l_l_Parent_0_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_Pane_0 = v8.UI.Pane;
local l_Checkbox_0 = v8.UI.Checkbox;
local v12 = require(l_l_Parent_0_FirstAncestor_0.Src.Types);
local v13 = require(l_Parent_0.AnalyzerCurve);
local v14 = require(l_Parent_0.EqCurve);
local v15 = require(l_Parent_0.EqHandles);
local v16 = require(l_Parent_0.FilterControls);
local v17 = require(l_Parent_0.FilterCurve);
local v18 = require(l_Parent_0.FilterHandles);
local v19 = require(l_Parent_0.Grid);
local v20 = require(l_Parent_0.useNodeHook);
local v21 = Vector2.new(540, 300);
local v22 = Vector2.new(2000, 2000);
return function(v23) --[[ Line: 48 ]] --[[ Name: AudioEqualizerEditor ]]
    -- upvalues: l_useContext_0 (copy), l_ContextServices_0 (copy), l_useState_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v20 (copy), l_useEffect_0 (copy), v12 (copy), v2 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), l_Pane_0 (copy), v21 (copy), v22 (copy), l_Checkbox_0 (copy), v19 (copy), v13 (copy)
    local v24 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v25, v26 = l_useState_0(Vector2.one);
    local v27 = l_useRef_0(nil);
    local v29 = l_useCallback_0(function(v28) --[[ Line: 55 ]]
        -- upvalues: v23 (copy)
        if v28 ~= v23.Data then
            v23.OnChanged(v28);
        end;
    end, {
        v23.OnChanged
    });
    local v30 = v20(v23.Data, v29);
    l_useEffect_0(function() --[[ Line: 63 ]]
        -- upvalues: v30 (copy), v23 (copy)
        v30.reset(v23.Data);
    end, {
        v23.Data
    });
    local v32 = l_useCallback_0(function(v31) --[[ Line: 67 ]]
        -- upvalues: v26 (copy)
        if v31 then
            v26(v31.AbsoluteSize);
        end;
    end, {});
    local v33 = l_useCallback_0(function() --[[ Line: 73 ]]
        -- upvalues: v30 (copy)
        v30.setBypass(not v30.bypass);
    end, {
        v30
    });
    local v34 = l_useCallback_0(function() --[[ Line: 77 ]]
        -- upvalues: v23 (copy)
        v23.SetAnalysisEnabled(not v23.AnalysisEnabled);
    end, {
        v23.AnalysisEnabled, 
        v23.SetAnalysisEnabled
    });
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    if v23.Data.InstanceType == v12.EQUALIZER then
        v36 = v2.createElement(v14, {
            EqHook = v30, 
            PlotAbsoluteSize = v25
        });
        v37 = not v30.bypass and v2.createElement(v15, {
            EqHook = v30, 
            PlotAbsoluteSize = v25, 
            PlotRef = v27
        });
    elseif v23.Data.InstanceType == v12.FILTER then
        v35 = v2.createElement(v16, {
            FilterHook = v30, 
            Position = UDim2.fromOffset(0, 25), 
            Size = UDim2.new(1, 0, 0, 25)
        });
        v36 = v2.createElement(v17, {
            FilterHook = v30, 
            PlotAbsoluteSize = v25
        });
        v37 = not v30.bypass and v2.createElement(v18, {
            FilterHook = v30, 
            PlotAbsoluteSize = v25, 
            PlotRef = v27
        });
    end;
    local v38 = UDim2.new(1, 0, 1, -(v35 and 50 or 25) - 10);
    return v23.Enabled and v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        [v2.Tag] = "X-Pad X-ColumnM X-FitY"
    }, {
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MinSize = v21, 
            MaxSize = v22
        }), 
        Controls = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, 25), 
            LayoutOrder = 1, 
            [v2.Tag] = "X-RowM"
        }, {
            Bypass = v2.createElement(l_Checkbox_0, {
                LayoutOrder = 1, 
                Text = v24:getText("Label", "Bypass"), 
                Checked = v30.bypass, 
                OnClick = v33
            }), 
            AnalysisEnabled = v2.createElement(l_Checkbox_0, {
                LayoutOrder = 2, 
                Text = v24:getText("Label", "EnableAnalyzer"), 
                Checked = v23.AnalysisEnabled, 
                OnClick = v34
            })
        }), 
        NodeControls = v35, 
        Canvas = v2.createElement(l_Pane_0, {
            Size = v38, 
            LayoutOrder = 2
        }, {
            Grid = v2.createElement(v19, {
                InstanceType = v23.Data.InstanceType, 
                PlotAbsoluteSize = v25
            }), 
            PlotCanvas = v2.createElement(l_Pane_0, {
                Position = UDim2.new(0, 50, 0, 50), 
                Size = UDim2.new(1, -100, 1, -100), 
                BackgroundTransparency = 1, 
                ForwardRef = v27, 
                [v2.Change.AbsoluteSize] = v32
            }, {
                Analyzer = v2.createElement(v13, {
                    Enabled = v23.AnalysisEnabled, 
                    PlotAbsoluteSize = v25
                }), 
                Curve = v36, 
                Handles = v37
            })
        })
    });
end;
local l_Parent_0 = script.Parent;
local l_l_Parent_0_FirstAncestor_0 = l_Parent_0:FindFirstAncestor("AudioCompressorEditor");
local v2 = require(l_l_Parent_0_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_l_Parent_0_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_l_Parent_0_FirstAncestor_0.Src.Types);
local v9 = require(l_Parent_0.useDataHook);
local v10 = require(l_Parent_0.CompressorCurve);
local v11 = require(l_Parent_0.CompressorHandles);
local v12 = require(l_Parent_0.Grid);
local v13 = require(l_Parent_0.MainControls);
local v14 = require(l_Parent_0.MeteringLine);
local v15 = require(l_Parent_0.TopControls);
local v16 = Vector2.new(540, 300);
local v17 = Vector2.new(2000, 2000);
local v18 = {};
return function(v19) --[[ Line: 43 ]] --[[ Name: AudioCompressorEditor ]]
    -- upvalues: l_useState_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v9 (copy), l_useEffect_0 (copy), v18 (ref), v2 (copy), l_Pane_0 (copy), v16 (copy), v17 (copy), v15 (copy), v12 (copy), v14 (copy), v10 (copy), v11 (copy), v13 (copy)
    local v20, v21 = l_useState_0(Vector2.one);
    local v22 = l_useRef_0(nil);
    local v24 = l_useCallback_0(function(v23) --[[ Line: 47 ]]
        -- upvalues: v19 (copy)
        if v23 ~= v19.Data and v19.OnChanged then
            v19.OnChanged(v23);
        end;
    end, {
        v19.OnChanged
    });
    local v25 = v9(v19.Data, v24);
    l_useEffect_0(function() --[[ Line: 55 ]]
        -- upvalues: v25 (copy), v19 (copy), v18 (ref)
        v25.reset(v19.Data);
        v18 = {};
    end, {
        v19.Data
    });
    local v27 = l_useCallback_0(function(v26) --[[ Line: 64 ]]
        -- upvalues: v21 (copy)
        if v26 then
            v21(v26.AbsoluteSize);
        end;
    end, {});
    local v28, v29 = l_useState_0("");
    return v19.Enabled and v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        [v2.Tag] = "X-Pad X-ColumnM X-FitY"
    }, {
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MinSize = v16, 
            MaxSize = v17
        }), 
        TopControls = v2.createElement(v15, {
            DataHook = v25, 
            DisplaySettings = v19.DisplaySettings, 
            SetDisplaySettings = v19.SetDisplaySettings
        }), 
        MainPanel = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -75), 
            LayoutOrder = 2, 
            [v2.Tag] = "X-Pad X-RowM"
        }, {
            Canvas = v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(0.75, 1), 
                LayoutOrder = 1
            }, {
                PlotCanvas = v2.createElement(l_Pane_0, {
                    Position = UDim2.new(0, 25, 0, 25), 
                    Size = UDim2.new(1, -50, 1, -50), 
                    BackgroundTransparency = 1, 
                    ForwardRef = v22, 
                    [v2.Change.AbsoluteSize] = v27
                }, {
                    Grid = v2.createElement(v12, {
                        PlotAbsoluteSize = v20
                    }), 
                    MeteringLine = v2.createElement(v14, {
                        InstanceType = v25.instanceType, 
                        DisplaySettings = v19.DisplaySettings, 
                        PlotAbsoluteSize = v20, 
                        ForceRefresh = v18
                    }), 
                    Curve = v2.createElement(v10, {
                        Enabled = v19.DisplaySettings.ShowEnvelope, 
                        DataHook = v25, 
                        PlotAbsoluteSize = v20
                    }), 
                    Handles = v2.createElement(v11, {
                        DataHook = v25, 
                        ActiveControl = v28, 
                        PlotAbsoluteSize = v20
                    })
                })
            }), 
            MainControlsPanel = v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(0.25, 1), 
                LayoutOrder = 2
            }, {
                MainControls = v2.createElement(v13, {
                    DataHook = v25, 
                    SetActiveControl = v29
                })
            })
        })
    });
end;
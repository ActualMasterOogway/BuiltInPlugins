local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_Parent_0.Path2DWrapper);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Path2DUtil);
local v10 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local function v14(v11, v12) --[[ Line: 29 ]] --[[ Name: pointToControl ]]
    -- upvalues: v10 (copy), v9 (copy)
    local v13 = v10.plotToAbs(v11, v12);
    return v9.makeControlPoint(v13);
end;
return function(v15) --[[ Line: 34 ]] --[[ Name: FilterCurve ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), l_useEffect_0 (copy), v10 (copy), v14 (copy), v2 (copy), l_Pane_0 (copy), v8 (copy)
    local v16 = l_useRef_0(nil);
    local v17 = not v15.FilterHook.bypass;
    local v18, v19 = l_useState_0({
        Left = {}, 
        Right = {}
    });
    l_useEffect_0(function() --[[ Line: 40 ]]
        -- upvalues: v16 (copy), v15 (copy), v10 (ref), v14 (ref), v19 (copy)
        if not v16 or not v16.current then
            return;
        else
            assert(v16, "filterRef was nil");
            assert(v16.current, "filterRef.current was nil");
            local l_current_0 = v16.current;
            l_current_0.FilterType = v15.FilterHook.filterType;
            l_current_0.Frequency = v15.FilterHook.frequency;
            l_current_0.Gain = v15.FilterHook.gain;
            l_current_0.Q = v15.FilterHook.q;
            local v21 = {};
            local v22 = {};
            local l_frequency_0 = v15.FilterHook.frequency;
            local v24 = 1;
            while v10.getXMin() <= l_frequency_0 do
                local l_l_current_0_GainAt_0 = l_current_0:GetGainAt(l_frequency_0);
                local v26 = Vector2.new(l_frequency_0, l_l_current_0_GainAt_0);
                table.insert(v21, v14(v26, v15.PlotAbsoluteSize));
                local l_l_frequency_0_0 = l_frequency_0;
                v24 = v24 - 0.005;
                l_frequency_0 = l_frequency_0 * v24;
                if v10.getXMin() < l_l_frequency_0_0 and l_frequency_0 < v10.getXMin() then
                    l_frequency_0 = v10.getXMin();
                end;
            end;
            l_frequency_0 = v15.FilterHook.frequency;
            v24 = 1;
            while l_frequency_0 <= v10.getXMax() do
                local l_l_current_0_GainAt_1 = l_current_0:GetGainAt(l_frequency_0);
                local v29 = Vector2.new(l_frequency_0, l_l_current_0_GainAt_1);
                table.insert(v22, v14(v29, v15.PlotAbsoluteSize));
                local l_l_frequency_0_1 = l_frequency_0;
                v24 = v24 + 0.005;
                l_frequency_0 = l_frequency_0 * v24;
                if l_l_frequency_0_1 < v10.getXMax() and v10.getXMax() < l_frequency_0 then
                    l_frequency_0 = v10.getXMax();
                end;
            end;
            v19({
                Left = v21, 
                Right = v22
            });
            return;
        end;
    end, {
        v15.PlotAbsoluteSize, 
        v15.FilterHook, 
        v16
    });
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        LeftCurve = v2.createElement(v8, {
            ControlPoints = v18.Left, 
            Tag = v17 and "FullCurve" or "FullCurveDisabled"
        }), 
        RightCurve = v2.createElement(v8, {
            ControlPoints = v18.Right, 
            Tag = v17 and "FullCurve" or "FullCurveDisabled"
        }), 
        Filter = v2.createElement("AudioFilter", {
            ref = v16
        })
    });
end;
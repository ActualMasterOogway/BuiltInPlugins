local l_Parent_0 = script.Parent;
local l_l_Parent_0_FirstAncestor_0 = l_Parent_0:FindFirstAncestor("AudioCompressorEditor");
local v2 = require(l_l_Parent_0_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useContext_0 = v2.useContext;
local v5 = require(l_l_Parent_0_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_Pane_0 = v5.UI.Pane;
local v8 = v5.Util.LayoutOrderIterator.new();
local v9 = require(l_Parent_0.Knob);
local _ = require(l_l_Parent_0_FirstAncestor_0.Src.Types);
local function _(v11) --[[ Line: 28 ]] --[[ Name: log10 ]]
    return math.log(v11) / 2.302585092994046;
end;
local function _(v13) --[[ Line: 31 ]] --[[ Name: invLog10 ]]
    return (math.pow(10, v13));
end;
local function v16(v15) --[[ Line: 35 ]] --[[ Name: ratioCurve ]]
    return math.log(v15) / 2.302585092994046;
end;
local function v18(v17) --[[ Line: 38 ]] --[[ Name: ratioInvCurve ]]
    return (math.pow(10, v17));
end;
local function v20(v19) --[[ Line: 42 ]] --[[ Name: attackCurve ]]
    return math.log(v19 + 0.1) / 2.302585092994046;
end;
local function v22(v21) --[[ Line: 45 ]] --[[ Name: attackInvCurve ]]
    return math.pow(10, v21) - 0.1;
end;
local function v24(v23) --[[ Line: 49 ]] --[[ Name: releaseCurve ]]
    return math.log(v23 + 1) / 2.302585092994046;
end;
local function v26(v25) --[[ Line: 52 ]] --[[ Name: releaseInvCurve ]]
    return math.pow(10, v25) - 1;
end;
return function(v27) --[[ Line: 56 ]] --[[ Name: MainControls ]]
    -- upvalues: l_useContext_0 (copy), l_ContextServices_0 (copy), l_useCallback_0 (copy), v2 (copy), l_Pane_0 (copy), v9 (copy), v8 (copy), v16 (copy), v18 (copy), v20 (copy), v22 (copy), v24 (copy), v26 (copy)
    local l_DataHook_0 = v27.DataHook;
    local v29 = v27.DataHook.instanceType == "AudioCompressor";
    local v30 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local function _(v31) --[[ Line: 63 ]]
        -- upvalues: l_useCallback_0 (ref), v27 (copy)
        return l_useCallback_0(function() --[[ Line: 64 ]]
            -- upvalues: v27 (ref), v31 (copy)
            if v27.SetActiveControl then
                v27.SetActiveControl(v31);
            end;
        end, {
            v27.SetActiveControl
        });
    end;
    local l_l_useCallback_0_0 = l_useCallback_0;
    local v34 = "Threshold";
    local l_v34_0 = v34 --[[ copy: 8 -> 14 ]];
    l_l_useCallback_0_0 = l_l_useCallback_0_0(function() --[[ Line: 64 ]]
        -- upvalues: v27 (copy), l_v34_0 (copy)
        if v27.SetActiveControl then
            v27.SetActiveControl(l_v34_0);
        end;
    end, {
        v27.SetActiveControl
    });
    local l_l_useCallback_0_1 = l_useCallback_0;
    local v37 = "Ratio";
    local l_v37_0 = v37 --[[ copy: 9 -> 15 ]];
    l_l_useCallback_0_1 = l_l_useCallback_0_1(function() --[[ Line: 64 ]]
        -- upvalues: v27 (copy), l_v37_0 (copy)
        if v27.SetActiveControl then
            v27.SetActiveControl(l_v37_0);
        end;
    end, {
        v27.SetActiveControl
    });
    v34 = l_useCallback_0;
    local v39 = "Attack";
    local l_v39_0 = v39 --[[ copy: 10 -> 16 ]];
    v34 = v34(function() --[[ Line: 64 ]]
        -- upvalues: v27 (copy), l_v39_0 (copy)
        if v27.SetActiveControl then
            v27.SetActiveControl(l_v39_0);
        end;
    end, {
        v27.SetActiveControl
    });
    v37 = l_useCallback_0;
    local v41 = "Release";
    local l_v41_0 = v41 --[[ copy: 11 -> 17 ]];
    v37 = v37(function() --[[ Line: 64 ]]
        -- upvalues: v27 (copy), l_v41_0 (copy)
        if v27.SetActiveControl then
            v27.SetActiveControl(l_v41_0);
        end;
    end, {
        v27.SetActiveControl
    });
    v39 = l_useCallback_0;
    local v43 = "MakeupGain";
    v39 = v39(function() --[[ Line: 64 ]]
        -- upvalues: v27 (copy), v43 (copy)
        if v27.SetActiveControl then
            v27.SetActiveControl(v43);
        end;
    end, {
        v27.SetActiveControl
    });
    v41 = l_useCallback_0;
    local v44 = "";
    v41 = v41(function() --[[ Line: 64 ]]
        -- upvalues: v27 (copy), v44 (copy)
        if v27.SetActiveControl then
            v27.SetActiveControl(v44);
        end;
    end, {
        v27.SetActiveControl
    });
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        [v2.Tag] = "X-ColumnM"
    }, {
        ThresholdKnob = v2.createElement(v9, {
            Label = v30:getText("Label", v29 and "Threshold" or "MaxLevel"), 
            Value = l_DataHook_0.threshold, 
            Min = v29 and -60 or -12, 
            Max = 0, 
            Precision = 1, 
            Size = 25, 
            DragRange = 100, 
            LayoutOrder = v8:getNextOrder(), 
            OnInputBegan = l_l_useCallback_0_0, 
            OnInputChanged = l_DataHook_0.setThreshold, 
            OnInputEnded = v41
        }), 
        RatioKnob = v29 and v2.createElement(v9, {
            Label = v30:getText("Label", "Ratio"), 
            Value = l_DataHook_0.ratio, 
            Min = 1, 
            Max = 40, 
            CurveFunction = v16, 
            InverseCurveFunction = v18, 
            Size = 25, 
            DragRange = 100, 
            LayoutOrder = v8:getNextOrder(), 
            OnInputBegan = l_l_useCallback_0_1, 
            OnInputChanged = l_DataHook_0.setRatio, 
            OnInputEnded = v41
        }), 
        AttackKnob = v29 and v2.createElement(v9, {
            Label = v30:getText("Label", "Attack"), 
            Value = l_DataHook_0.attack, 
            Min = 1.0E-4, 
            Max = 0.5, 
            Precision = 3, 
            CurveFunction = v20, 
            InverseCurveFunction = v22, 
            Size = 25, 
            DragRange = 100, 
            LayoutOrder = v8:getNextOrder(), 
            OnInputBegan = v34, 
            OnInputChanged = l_DataHook_0.setAttack, 
            OnInputEnded = v41
        }), 
        ReleaseKnob = v2.createElement(v9, {
            Label = v30:getText("Label", "Release"), 
            Value = l_DataHook_0.release, 
            Min = v29 and 0.01 or 0.001, 
            Max = v29 and 5 or 1, 
            Precision = 3, 
            CurveFunction = v24, 
            InverseCurveFunction = v26, 
            Size = 25, 
            DragRange = 100, 
            LayoutOrder = v8:getNextOrder(), 
            OnInputBegan = v37, 
            OnInputChanged = l_DataHook_0.setRelease, 
            OnInputEnded = v41
        }), 
        MakeupGainKnob = v29 and v2.createElement(v9, {
            Label = v30:getText("Label", "MakeupGain"), 
            Value = l_DataHook_0.makeupGain, 
            Min = -30, 
            Max = 30, 
            Size = 25, 
            DragRange = 100, 
            LayoutOrder = v8:getNextOrder(), 
            OnInputBegan = v39, 
            OnInputChanged = l_DataHook_0.setMakeupGain, 
            OnInputEnded = v41
        })
    });
end;
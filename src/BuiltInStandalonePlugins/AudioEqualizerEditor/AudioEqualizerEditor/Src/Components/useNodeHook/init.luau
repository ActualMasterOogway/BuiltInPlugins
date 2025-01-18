local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local v5 = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v7, v8) --[[ Line: 20 ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v5 (copy), l_useCallback_0 (copy), v6 (copy)
    local l_InstanceType_0 = v7.InstanceType;
    local v10, v11 = l_useState_0(v7.LowGain);
    local v12, v13 = l_useState_0(v7.MidGain);
    local v14, v15 = l_useState_0(v7.HighGain);
    local v16, v17 = l_useState_0(if v7.MidRange then v7.MidRange.Min else 0);
    local v18, v19 = l_useState_0(if v7.MidRange then v7.MidRange.Max else 0);
    local v20, v21 = l_useState_0(v7.Bypass);
    local v22, v23 = l_useState_0(v7.FilterType);
    local v24, v25 = l_useState_0(v7.Frequency);
    local v26, v27 = l_useState_0(v7.Gain);
    local v28, v29 = l_useState_0(v7.Q);
    local v30, v31 = l_useState_0(v7.Bypass);
    local v32, v33 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 46 ]]
        -- upvalues: v32 (copy), v33 (copy), l_InstanceType_0 (copy), v5 (ref), v8 (copy), v10 (copy), v12 (copy), v14 (copy), v16 (copy), v18 (copy), v20 (copy), v22 (copy), v24 (copy), v26 (copy), v28 (copy), v30 (copy)
        if not v32 then
            v33(true);
            return;
        elseif l_InstanceType_0 == v5.EQUALIZER then
            v8({
                InstanceType = v5.EQUALIZER, 
                LowGain = v10, 
                MidGain = v12, 
                HighGain = v14, 
                MidRange = NumberRange.new(v16, (math.max(v16, v18))), 
                Bypass = v20
            });
            return;
        else
            if l_InstanceType_0 == v5.FILTER then
                v8({
                    InstanceType = v5.FILTER, 
                    FilterType = v22, 
                    Frequency = v24, 
                    Gain = v26, 
                    Q = v28, 
                    Bypass = v30
                });
            end;
            return;
        end;
    end, {
        v10, 
        v12, 
        v14, 
        v16, 
        v18, 
        v20, 
        v22, 
        v24, 
        v26, 
        v28, 
        v30
    });
    if l_InstanceType_0 == v5.EQUALIZER then
        return {
            lowGain = v10, 
            midGain = v12, 
            highGain = v14, 
            lowThreshold = v16, 
            highThreshold = v18, 
            bypass = v20, 
            setLowGain = l_useCallback_0(function(v34) --[[ Line: 101 ]]
                -- upvalues: v6 (ref), v11 (copy)
                v34 = math.clamp(v34, v6.getYMin(), (v6.getYMax()));
                v11(v34);
            end, {
                v11
            }), 
            setMidGain = l_useCallback_0(function(v35) --[[ Line: 106 ]]
                -- upvalues: v6 (ref), v13 (copy)
                v35 = math.clamp(v35, v6.getYMin(), (v6.getYMax()));
                v13(v35);
            end, {
                v13
            }), 
            setHighGain = l_useCallback_0(function(v36) --[[ Line: 111 ]]
                -- upvalues: v6 (ref), v15 (copy)
                v36 = math.clamp(v36, v6.getYMin(), (v6.getYMax()));
                v15(v36);
            end, {
                v15
            }), 
            setLowThreshold = l_useCallback_0(function(v37) --[[ Line: 116 ]]
                -- upvalues: v6 (ref), v18 (copy), v19 (copy), v17 (copy)
                local v38 = math.clamp(v37, v6.getXMin(), (v6.getXMax()));
                if v18 < v38 then
                    v19(v38);
                end;
                v17(v38);
            end, {
                v18, 
                v17, 
                v19
            }), 
            setHighThreshold = l_useCallback_0(function(v39) --[[ Line: 124 ]]
                -- upvalues: v6 (ref), v16 (copy), v17 (copy), v19 (copy)
                local v40 = math.clamp(v39, v6.getXMin(), (v6.getXMax()));
                if v40 < v16 then
                    v17(v40);
                end;
                v19(v40);
            end, {
                v16, 
                v17, 
                v19
            }), 
            setBypass = l_useCallback_0(function(v41) --[[ Line: 132 ]]
                -- upvalues: v21 (copy)
                v21(v41);
            end, {
                v21
            }), 
            reset = l_useCallback_0(function(v42) --[[ Line: 136 ]]
                -- upvalues: v11 (copy), v13 (copy), v15 (copy), v17 (copy), v19 (copy), v21 (copy)
                v11(v42.LowGain);
                v13(v42.MidGain);
                v15(v42.HighGain);
                v17(v42.MidRange.Min);
                v19(v42.MidRange.Max);
                v21(v42.Bypass);
            end, {
                v11, 
                v13, 
                v15, 
                v17, 
                v19, 
                v21
            })
        };
    elseif l_InstanceType_0 == v5.FILTER then
        return {
            filterType = v22, 
            frequency = v24, 
            gain = v26, 
            q = v28, 
            bypass = v30, 
            setFilterType = l_useCallback_0(function(v43) --[[ Line: 154 ]]
                -- upvalues: v23 (copy)
                v23(v43);
            end, {
                v23
            }), 
            setFrequency = l_useCallback_0(function(v44) --[[ Line: 158 ]]
                -- upvalues: v6 (ref), v25 (copy)
                v44 = math.clamp(v44, v6.getXMin(), (v6.getXMax()));
                v25(v44);
            end, {
                v25
            }), 
            setGain = l_useCallback_0(function(v45) --[[ Line: 163 ]]
                -- upvalues: v6 (ref), v27 (copy)
                v45 = math.clamp(v45, v6.getYMin(), (v6.getYMax()));
                v27(v45);
            end, {
                v27
            }), 
            setQ = l_useCallback_0(function(v46) --[[ Line: 168 ]]
                -- upvalues: v29 (copy)
                v46 = math.clamp(v46, 0.1, 10);
                v29(v46);
            end, {
                v28, 
                v29
            }), 
            setBypass = l_useCallback_0(function(v47) --[[ Line: 173 ]]
                -- upvalues: v31 (copy)
                v31(v47);
            end, {
                v31
            }), 
            reset = l_useCallback_0(function(v48) --[[ Line: 177 ]]
                -- upvalues: v23 (copy), v25 (copy), v27 (copy), v29 (copy), v31 (copy)
                v23(v48.FilterType);
                v25(v48.Frequency);
                v27(v48.Gain);
                v29(v48.Q);
                v31(v48.Bypass);
            end, {
                v23, 
                v25, 
                v27, 
                v29, 
                v31
            })
        };
    else
        assert(l_InstanceType_0 == v5.NO_INSTANCE, "unsupported instance type");
        return {
            bypass = false, 
            setBypass = function(_) --[[ Line: 190 ]] --[[ Name: setBypass ]]

            end, 
            reset = function(_) --[[ Line: 191 ]] --[[ Name: reset ]]

            end
        };
    end;
end;
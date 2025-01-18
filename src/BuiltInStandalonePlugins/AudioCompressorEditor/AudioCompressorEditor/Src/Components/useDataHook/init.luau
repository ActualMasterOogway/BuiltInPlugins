local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, v7) --[[ Line: 28 ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy)
    local v8, v9 = l_useState_0(v6.Type);
    local v10, v11 = l_useState_0(v6.Threshold);
    local v12, v13 = l_useState_0(v6.Ratio);
    local v14, v15 = l_useState_0(v6.Attack);
    local v16, v17 = l_useState_0(v6.Release);
    local v18, v19 = l_useState_0(v6.MakeupGain);
    local v20, v21 = l_useState_0(v6.Bypass);
    local v22, v23 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 39 ]]
        -- upvalues: v22 (copy), v23 (copy), v7 (copy), v8 (copy), v10 (copy), v12 (copy), v14 (copy), v16 (copy), v18 (copy), v20 (copy)
        if not v22 then
            v23(true);
            return;
        else
            v7({
                Type = v8, 
                Threshold = v10, 
                Ratio = v12, 
                Attack = v14, 
                Release = v16, 
                MakeupGain = v18, 
                Bypass = v20
            });
            return;
        end;
    end, {
        v8, 
        v10, 
        v12, 
        v14, 
        v16, 
        v18, 
        v20, 
        v22
    });
    return {
        instanceType = v8, 
        threshold = v10, 
        ratio = v12, 
        attack = v14, 
        release = v16, 
        makeupGain = v18, 
        bypass = v20, 
        setThreshold = l_useCallback_0(function(v24) --[[ Line: 67 ]]
            -- upvalues: v8 (copy), v11 (copy)
            if v8 == "AudioCompressor" then
                v24 = math.clamp(v24, -60, 0);
            elseif v8 == "AudioLimiter" then
                v24 = math.clamp(v24, -12, 0);
            end;
            v11(v24);
        end, {
            v8, 
            v11
        }), 
        setRatio = l_useCallback_0(function(v25) --[[ Line: 76 ]]
            -- upvalues: v13 (copy)
            v25 = math.clamp(v25, 1, 50);
            v13(v25);
        end, {
            v13
        }), 
        setAttack = l_useCallback_0(function(v26) --[[ Line: 81 ]]
            -- upvalues: v15 (copy)
            v26 = math.clamp(v26, 1.0E-4, 0.5);
            v15(v26);
        end, {
            v15
        }), 
        setRelease = l_useCallback_0(function(v27) --[[ Line: 86 ]]
            -- upvalues: v8 (copy), v17 (copy)
            if v8 == "AudioCompressor" then
                v27 = math.clamp(v27, 0.01, 5);
            elseif v8 == "AudioLimiter" then
                v27 = math.clamp(v27, 0.001, 1);
            end;
            v17(v27);
        end, {
            v8, 
            v17
        }), 
        setMakeupGain = l_useCallback_0(function(v28) --[[ Line: 95 ]]
            -- upvalues: v19 (copy)
            v28 = math.clamp(v28, -30, 30);
            v19(v28);
        end, {
            v19
        }), 
        setBypass = l_useCallback_0(function(v29) --[[ Line: 100 ]]
            -- upvalues: v21 (copy)
            v21(v29);
        end, {
            v21
        }), 
        reset = l_useCallback_0(function(v30) --[[ Line: 104 ]]
            -- upvalues: v9 (copy), v11 (copy), v13 (copy), v15 (copy), v17 (copy), v19 (copy), v21 (copy)
            v9(v30.Type);
            v11(v30.Threshold);
            v13(v30.Ratio);
            v15(v30.Attack);
            v17(v30.Release);
            v19(v30.MakeupGain);
            v21(v30.Bypass);
        end, {
            v9, 
            v11, 
            v13, 
            v15, 
            v17, 
            v19, 
            v21
        })
    };
end;
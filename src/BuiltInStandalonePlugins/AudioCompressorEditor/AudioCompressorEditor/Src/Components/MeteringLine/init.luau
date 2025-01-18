local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_Parent_0.Path2DWrapper);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnalyzerUtil);
local v10 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local function _(v11) --[[ Line: 38 ]] --[[ Name: toDb ]]
    if v11 > 1.0E-4 then
        return 8.685889638065035 * math.log(v11);
    else
        return -80;
    end;
end;
return function(v13) --[[ Line: 42 ]] --[[ Name: MeteringLine ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v9 (copy), l_useMemo_0 (copy), v10 (copy), v2 (copy), v8 (copy), l_Pane_0 (copy)
    local v14, v15 = l_useState_0({
        In = {}, 
        Out = {}, 
        Sidechain = {}, 
        MaxLength = 100, 
        Length = 0, 
        Head = 1
    });
    local v16, v17 = l_useState_0({});
    l_useEffect_0(function() --[[ Line: 54 ]]
        -- upvalues: v13 (copy), v14 (copy), v15 (copy), v9 (ref), v17 (copy)
        if v13.DisplaySettings.IsPaused then
            return;
        else
            v14.Length = 0;
            v14.Head = 1;
            v15(v14);
            v9.startAnalyzing(function(v18, v19, v20) --[[ Line: 64 ]]
                -- upvalues: v14 (ref), v15 (ref), v17 (ref)
                if v14.Length >= v14.MaxLength then
                    v14.Head = v14.Head % v14.Length + 1;
                else
                    v14.Length = v14.Length + 1;
                end;
                local v21 = (v14.Head + v14.Length - 2) % v14.Length + 1;
                v14.In[v21] = if v18 > 1.0E-4 then 8.685889638065035 * math.log(v18) else -80;
                v14.Out[v21] = if v19 > 1.0E-4 then 8.685889638065035 * math.log(v19) else -80;
                v14.Sidechain[v21] = if v20 > 1.0E-4 then 8.685889638065035 * math.log(v20) else -80;
                v15(v14);
                v17({});
            end);
            return function() --[[ Line: 80 ]]
                -- upvalues: v9 (ref)
                v9.stopAnalyzing();
            end;
        end;
    end, {
        v13.DisplaySettings.IsPaused, 
        v13.ForceRefresh
    });
    local v22 = {};
    local function v33(v23, v24, v25) --[[ Line: 87 ]]
        -- upvalues: l_useMemo_0 (ref), v13 (copy), v14 (copy), v10 (ref), v16 (copy), v22 (copy), v2 (ref), v8 (ref)
        local v32 = l_useMemo_0(function() --[[ Line: 88 ]]
            -- upvalues: v13 (ref), v24 (copy), v14 (ref), v25 (copy), v10 (ref)
            local v26 = {};
            if not v13.DisplaySettings[v24] then
                return v26;
            else
                for v27 = 1, v14.Length do
                    local v28 = (v27 - 1 + v14.Head - 1) % v14.Length + 1;
                    local v29 = v25(v28);
                    local l_X_0 = v10.viewToPlot(Vector2.new((v27 - 1) / (v14.MaxLength - 1), 0), Vector2.one).X;
                    local v31 = v10.plotToAbs(Vector2.new(l_X_0, v29), v13.PlotAbsoluteSize);
                    table.insert(v26, (Path2DControlPoint.new(UDim2.fromOffset(v31.X, v31.Y))));
                end;
                return v26;
            end;
        end, {
            v16, 
            v13.PlotAbsoluteSize, 
            v13.DisplaySettings[v24]
        });
        v22[v23] = v2.createElement(v8, {
            ControlPoints = v32, 
            Tag = "AnalyzerCurve" .. v23
        });
    end;
    v33("In", "ShowInputWaveform", function(v34) --[[ Line: 112 ]]
        -- upvalues: v14 (copy)
        return v14.In[v34];
    end);
    v33("Out", "ShowOutputWaveform", function(v35) --[[ Line: 115 ]]
        -- upvalues: v14 (copy)
        return v14.Out[v35];
    end);
    v33("Gain", "ShowGainChange", function(v36) --[[ Line: 118 ]]
        -- upvalues: v14 (copy)
        return v14.Out[v36] - v14.In[v36];
    end);
    v33("Sidechain", "ShowSidechain", function(v37) --[[ Line: 121 ]]
        -- upvalues: v14 (copy)
        return v14.Sidechain[v37];
    end);
    if v13.InstanceType == "AudioLimiter" then
        v22.Sidechain = nil;
    end;
    local v38 = false;
    if v14.Length > 0 then
        v38 = v2.createElement(l_Pane_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        }, v22);
    end;
    return v38;
end;
local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v9 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v9.useEffect;
local l_useMemo_0 = v9.useMemo;
local l_useState_0 = v9.useState;
local v13 = require(l_Parent_0.Path2DWrapper);
local v14 = require(l_script_FirstAncestor_0.Src.Util.AnalyzerUtil);
local v15 = require(l_script_FirstAncestor_0.Src.Util.Path2DUtil);
local v16 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local v17 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFIntAudioEqualizerEditorAnalyzerResolution();
local function v21(v18, v19) --[[ Line: 23 ]] --[[ Name: pointToControl ]]
    -- upvalues: v16 (copy), v15 (copy)
    local v20 = v16.viewToAbs(v18, v19);
    return v15.makeControlPoint(v20);
end;
return function(v22) --[[ Line: 33 ]] --[[ Name: AnalyzerCurve ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), v14 (copy), l_useMemo_0 (copy), v16 (copy), v15 (copy), v21 (copy), v17 (copy), v9 (copy), v13 (copy)
    local v23, v24 = l_useState_0({});
    l_useEffect_0(function() --[[ Line: 36 ]]
        -- upvalues: v22 (copy), v14 (ref), v24 (copy)
        if not v22.Enabled then
            return;
        else
            v14.startAnalyzing(v24);
            return function() --[[ Line: 42 ]]
                -- upvalues: v14 (ref)
                v14.stopAnalyzing();
            end;
        end;
    end, {
        v22.Enabled
    });
    local v30 = l_useMemo_0(function() --[[ Line: 47 ]]
        -- upvalues: v16 (ref), v22 (copy), v15 (ref), v21 (ref)
        local v25 = {};
        local v26 = Vector2.new(v16.getXMin(), v16.getYMin());
        local l_PlotAbsoluteSize_0 = v22.PlotAbsoluteSize;
        local v28 = v16.viewToAbs(v26, l_PlotAbsoluteSize_0);
        local v29 = v15.makeControlPoint(v28);
        v6(v25, 1, v29, v21(Vector2.new(v16.getXMin(), v16.getYMin()), v22.PlotAbsoluteSize));
        return v25;
    end, {});
    local v51 = l_useMemo_0(function() --[[ Line: 54 ]]
        -- upvalues: v23 (copy), v30 (copy), v17 (ref), v16 (ref), v21 (ref), v22 (copy)
        local v31 = {};
        local v32 = #v23;
        if v32 == 0 then
            return v30;
        else
            for v33 = 0, v17 do
                local l_X_0 = v16.viewToPlot(Vector2.new((v33 - 0.5) / v17, 0)).X;
                local l_X_1 = v16.viewToPlot(Vector2.new((v33 + 0.5) / v17, 0)).X;
                local v36 = math.floor(v32 * l_X_0 / 24000);
                local v37 = math.ceil(v32 * l_X_1 / 24000);
                local v38 = 0;
                for v39 = v36, v37 do
                    if v32 > v39 then
                        local v40 = 24000 * v39 / v32;
                        local v41 = 24000 * (v39 + 1) / v32;
                        local v42 = math.max(l_X_0, v40);
                        local v43 = math.min(l_X_1, v41);
                        if v43 > v42 then
                            local v44 = (v42 - v40) / (v41 - v40);
                            local v45 = v23[v39 + 1];
                            local v46 = v23[v39 + 2];
                            if v46 == nil then
                                v46 = 0;
                            end;
                            local v47 = v45 * (1 - v44) + v46 * v44;
                            local v48 = l_X_1 - l_X_0;
                            local v49 = v41 - v40;
                            local v50 = (v43 - v42) / v48;
                            v38 = v38 + v47 * math.min(v48 / v49, 1) * v50 * 5;
                        end;
                    end;
                end;
                v38 = math.clamp(v38, 0, 1);
                table.insert(v31, v21(Vector2.new(v33 / v17, 1 - v38), v22.PlotAbsoluteSize));
            end;
            return v31;
        end;
    end, {
        v23
    });
    return v22.Enabled and v9.createElement(v13, {
        ControlPoints = v22.Enabled and v51 or v30, 
        Tag = "AnalyzerCurve"
    });
end;
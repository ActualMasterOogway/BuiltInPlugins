local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v3.useCallback;
local l_useContext_0 = v3.useContext;
local l_useMemo_0 = v3.useMemo;
local l_useRef_0 = v3.useRef;
local l_useState_0 = v3.useState;
local v9 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v9.ContextServices;
local l_Pane_0 = v9.UI.Pane;
local l_SelectInput_0 = v9.UI.SelectInput;
local l_Tabs_0 = v9.UI.Tabs;
local v14 = require(l_Parent_0.useCurve);
local v15 = require(l_Parent_0.CurveRenderer.Curve);
local v16 = require(l_Parent_0.CurveRenderer.Grid);
local v17 = require(l_Parent_0.CurveRenderer.PolarCurve);
local v18 = require(l_Parent_0.CurveRenderer.PolarGrid);
local v19 = require(l_Parent_0.Editors.CurveHandles);
local v20 = require(l_Parent_0.Editors.CurveControls);
local v21 = require(l_Parent_0.Editors.PolarCurveHandles);
local v22 = require(l_script_FirstAncestor_0.Src.Types);
local v23 = require(l_script_FirstAncestor_0.Src.Util.AttenuationUtil);
local v24 = v2.getFFlagCLI_122163();
local v25 = Vector2.new(540, 300);
local v26 = Vector2.new(2000, 2000);
local v27 = {
    {
        Label = "Curve (Polar)"
    }, 
    {
        Label = "Curve"
    }
};
makeKeypointsForPolarPattern = function(v28, v29, v30, v31) --[[ Line: 63 ]] --[[ Name: makeKeypointsForPolarPattern ]]
    local v32 = {};
    for v33 = 0, 180, 180 / v28 do
        local v34 = math.rad(v33);
        local v35 = v29 + v30 * math.cos(v34) + v31 * math.sin(v34);
        table.insert(v32, Vector2.new(v33, (math.abs(v35))));
    end;
    return v32;
end;
makeKeypointsForShotgunPattern = function(v36) --[[ Line: 74 ]] --[[ Name: makeKeypointsForShotgunPattern ]]
    local v37 = {};
    for v38 = 0, 180, 180 / v36 do
        local v39 = math.rad(v38);
        local v40 = 0.4375 * (math.cos(2 * v39 + 3.141592653589793) - 0.5 - 0.75 * math.cos(v39));
        table.insert(v37, Vector2.new(v38, (math.abs(v40))));
    end;
    return v37;
end;
return function(v41) --[[ Line: 85 ]] --[[ Name: AttenuationCurveRenderer ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), v27 (copy), l_useContext_0 (copy), l_ContextServices_0 (copy), l_useCallback_0 (copy), v22 (copy), v24 (copy), l_useMemo_0 (copy), v3 (copy), v14 (copy), v23 (copy), v18 (copy), v17 (copy), v21 (copy), v20 (copy), v16 (copy), v15 (copy), v19 (copy), l_Pane_0 (copy), v25 (copy), v26 (copy), l_Tabs_0 (copy), l_SelectInput_0 (copy)
    local v42 = l_useRef_0(nil);
    local v43, v44 = l_useState_0(Vector2.one);
    local v45, v46 = l_useState_0(v27[1]);
    local l_v27_0 = v27;
    local v48 = l_useContext_0(l_ContextServices_0.Localization.Context);
    local v50 = l_useCallback_0(function(v49) --[[ Line: 96 ]]
        -- upvalues: v41 (copy), v22 (ref)
        v41.OnChanged(v49, v22.ANGLE);
    end, {
        v41.Data, 
        v41.OnChanged
    });
    local v51 = nil;
    if v24 then
        v51 = l_useMemo_0(function() --[[ Line: 102 ]]
            -- upvalues: v48 (copy)
            return v48:getText("Preset", "Custom");
        end);
    end;
    local v52, v53 = v3.useState(v51);
    local v54 = nil;
    if v24 then
        v54 = l_useCallback_0(function() --[[ Line: 110 ]]
            -- upvalues: v53 (copy), v51 (ref)
            v53(v51);
        end, {
            v51, 
            v41.Data, 
            v41.OnChanged
        });
    end;
    local v55 = v14(v23.strTableToKeypoints(v41.Data.AngleCurve), v22.ANGLE, v50, v54);
    local v56 = nil;
    v56 = v55;
    assert(v56, "curve was nil");
    local v58 = l_useCallback_0(function(v57) --[[ Line: 122 ]]
        -- upvalues: v44 (copy)
        if v57 then
            v44(v57.AbsoluteSize);
        end;
    end, {});
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local l_Label_0 = v45.Label;
    local v64 = 0;
    if string.find(l_Label_0, "Polar") then
        v59 = v18;
        v60 = v17;
        v61 = v21;
        v62 = v20;
        v64 = 25;
    else
        v59 = v16;
        v60 = v15;
        v61 = v19;
        v62 = v20;
        v64 = 50;
    end;
    local v65 = v59 and v3.createElement(v59, {
        CurveHook = v56, 
        PropertyType = "Angle", 
        PlotAbsoluteSize = v43
    });
    local v66 = v60 and v3.createElement(v60, {
        CurveHook = v56, 
        PlotAbsoluteSize = v43
    });
    local v67 = v61 and v3.createElement(v61, {
        CurveHook = v56, 
        PlotAbsoluteSize = v43, 
        PlotRef = v42
    });
    local v68 = v62 and v3.createElement(v62, {
        CurveHook = v56
    });
    local v69 = nil;
    if v24 then
        v69 = l_useMemo_0(function() --[[ Line: 173 ]]
            -- upvalues: v48 (copy)
            return {
                [1] = v48:getText("Preset", "Omni"), 
                [2] = v48:getText("Preset", "Cardioid"), 
                [3] = v48:getText("Preset", "Dipole"), 
                [4] = v48:getText("Preset", "Shotgun")
            };
        end);
    end;
    local v70 = nil;
    if v24 then
        v70 = l_useCallback_0(function(v71) --[[ Line: 185 ]]
            -- upvalues: v53 (copy), v69 (ref), v56 (ref)
            v53(v71);
            local v72 = {};
            if v71 == v69[1] then
                v72 = makeKeypointsForPolarPattern(1, 1, 0, 0);
            elseif v71 == v69[2] then
                v72 = makeKeypointsForPolarPattern(8, 0.5, 0.5, 0);
            elseif v71 == v69[3] then
                v72 = makeKeypointsForPolarPattern(16, 0, 1, 0);
            elseif v71 == v69[4] then
                v72 = makeKeypointsForShotgunPattern(16);
            end;
            v56.reset(v72);
        end, {
            v69, 
            v52, 
            v53, 
            v56
        });
    end;
    return v41.Enabled and v3.createElement(l_Pane_0, {
        [v3.Tag] = "X-Pad X-ColumnM X-FitY"
    }, {
        UISizeConstraint = v3.createElement("UISizeConstraint", {
            MinSize = v25, 
            MaxSize = v26
        }), 
        TabsRow = v3.createElement(l_Pane_0, {
            [v3.Tag] = "X-Pad X-RowM X-FitY", 
            ZIndex = 2
        }, {
            EditorTypeTabs = v3.createElement(l_Tabs_0, {
                Tabs = l_v27_0, 
                SelectedTab = v45, 
                OnTabSelected = function(v73) --[[ Line: 218 ]] --[[ Name: OnTabSelected ]]
                    -- upvalues: v46 (copy)
                    v46(v73);
                end
            }), 
            Presets = v24 and v3.createElement(l_SelectInput_0, {
                PlaceholderText = v52, 
                Items = v69, 
                OnItemActivated = v70
            }, {})
        }), 
        Canvas = v3.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -125), 
            LayoutOrder = 2
        }, {
            PlotCanvas = v3.createElement(l_Pane_0, {
                Position = UDim2.new(0, v64, 0, v64), 
                Size = UDim2.new(1, -v64 * 2, 1, -v64 * 2), 
                BackgroundTransparency = 1, 
                ForwardRef = v42, 
                [v3.Change.AbsoluteSize] = v58
            }, {
                Handles = v67, 
                Curve = v66, 
                Grid = v65
            })
        }), 
        Controls = v68
    });
end;
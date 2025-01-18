local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.DraggerFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local v6 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v7 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(script.BodyPointAdornment);
local _ = require(script.Types);
local v11 = require(script.getBoundingBox);
local v12 = require(script.useBodyMoveHandles);
local l_DraggerContext_PluginImpl_0 = v3.Implementation.DraggerContext_PluginImpl;
local v14 = require(script.DraggerSchema);
local l_DraggerToolComponent_0 = v3.DraggerTools.DraggerToolComponent;
local v16 = require(script.DraggerSelection);
local l_MoveHandles_0 = v3.Handles.MoveHandles;
local l_RotateHandles_0 = v3.Handles.RotateHandles;
local v19 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v21 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.useBindFocusOnPositions);
local v22 = require(script.useDisambiguationContextMenu);
local v23 = require(l_script_FirstAncestor_0.Src.Hooks.useRefWithInitial);
local v24 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v25 = require(l_script_FirstAncestor_0.Src.Hooks.useUndoRedoActions);
local l_Mouse_0 = v4.ContextServices.Mouse;
local l_Plugin_0 = v4.ContextServices.Plugin;
local l_Stylizer_0 = v4.ContextServices.Stylizer;
local function v29(v30) --[[ Line: 53 ]] --[[ Name: createUndoCheckpoint ]]
    -- upvalues: v29 (copy)
    local v31 = {};
    for _, v33 in v30 do
        v31[v33] = v33.getCFrame();
    end;
    return function() --[[ Line: 59 ]]
        -- upvalues: v29 (ref), v30 (copy), v31 (copy)
        local v34 = v29(v30);
        for v35, v36 in v31 do
            v35.onChange(v36);
        end;
        return v34;
    end;
end;
local function _(v37, v38) --[[ Line: 70 ]] --[[ Name: processUndos ]]
    -- upvalues: v19 (copy)
    local v39 = table.remove(v37);
    if v39 == nil then
        return;
    else
        assert(v39 ~= nil, v19.LUAU_ANALYZE_ERROR);
        table.insert(v38, (v39()));
        return;
    end;
end;
return function(v41) --[[ Line: 81 ]] --[[ Name: BodyPointsTool ]]
    -- upvalues: l_Stylizer_0 (copy), v5 (copy), l_Plugin_0 (copy), v24 (copy), v23 (copy), v16 (copy), l_DraggerContext_PluginImpl_0 (copy), v2 (copy), v22 (copy), l_Mouse_0 (copy), v19 (copy), v25 (copy), v21 (copy), v9 (copy), v12 (copy), v11 (copy), v29 (copy), l_MoveHandles_0 (copy), l_RotateHandles_0 (copy), v14 (copy), v6 (copy), l_DraggerToolComponent_0 (copy), l_CoreGui_0 (copy), v7 (copy)
    local v42 = l_Stylizer_0:use("BodyPointsTool");
    local v43 = {};
    local v44, v45 = v5.useState({});
    local v46 = v5.useRef(nil);
    local v47 = l_Plugin_0:use():get();
    local v48 = v24(false);
    local v49 = v23(function() --[[ Line: 93 ]]
        -- upvalues: v16 (ref), v45 (copy)
        return v16.new(v45);
    end);
    local v51 = v23(function() --[[ Line: 97 ]]
        -- upvalues: l_DraggerContext_PluginImpl_0 (ref), v47 (copy), v49 (copy), v46 (copy)
        local v50 = l_DraggerContext_PluginImpl_0.new(v47, game, settings(), v49.current);
        v50.hoveredPointNames = {};
        v50.getGuiParent = function() --[[ Line: 102 ]]
            -- upvalues: v46 (ref)
            assert(v46.current ~= nil, "Container isn't mounted yet");
            return v46.current;
        end;
        v50.shouldGridSnap = function() --[[ Line: 107 ]]
            return false;
        end;
        return v50;
    end);
    local l_current_0 = v51.current;
    v49.current.draggerContext = l_current_0;
    l_current_0.generallyEquivalentPointNames = v41.generallyEquivalentPointNames;
    l_current_0.selection = v49.current;
    l_current_0.points = v41.points;
    local v54 = v5.useMemo(function() --[[ Line: 121 ]]
        -- upvalues: v2 (ref), v41 (copy), v44 (copy)
        return v2.filter(v41.points, function(v53) --[[ Line: 122 ]]
            -- upvalues: v44 (ref)
            return table.find(v44, v53.name) ~= nil;
        end);
    end, {
        v41.points, 
        v44
    });
    l_current_0.selectedPoints = v54;
    l_current_0.worldModel = v41.worldModel;
    v22(l_current_0);
    local v55 = v24(true);
    l_current_0.projectionEnabled = v55.enabled;
    local v56 = v24(true);
    v5.useEffect(v48.enable, {});
    local v57 = l_Mouse_0:use():get();
    local v61 = v5.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v41 (copy)
        local v58 = {};
        for _, v60 in v41.points do
            table.insert(v58, {
                name = v60.name, 
                cframe = v60.getCFrame()
            });
        end;
        return v58;
    end, {
        v41.points
    });
    local v62 = v5.useRef({});
    assert(v62.current ~= nil, v19.LUAU_ANALYZE_ERROR);
    local v63 = v5.useRef({});
    assert(v63.current ~= nil, v19.LUAU_ANALYZE_ERROR);
    local v64, v65 = v5.useState(v61);
    local v77 = v5.useCallback(function(v66) --[[ Line: 162 ]]
        -- upvalues: v2 (ref), v41 (copy), v56 (copy)
        local v67 = v66.getCFrame();
        local v69 = v66.symmetricalPartner and v2.find(v41.points, function(v68) --[[ Line: 166 ]]
            -- upvalues: v66 (copy)
            return v68.name == v66.symmetricalPartner;
        end);
        local v70 = v69 and v69.getCFrame();
        return function(v71) --[[ Line: 171 ]]
            -- upvalues: v66 (copy), v56 (ref), v69 (copy), v70 (copy), v67 (copy)
            v66.onChange(v71);
            if v56.enabled and v69 ~= nil and v70 ~= nil then
                local v72 = v71.Position - v67.Position;
                local v73, v74, v75 = (v71 * v67:Inverse()).Rotation:ToOrientation();
                local v76 = CFrame.fromOrientation(v73, -v74, -v75);
                v69.onChange((v70 + v72 * Vector3.new(-1, 1, 1, 0)) * v76);
            end;
        end;
    end, {
        v41.points, 
        v56.enabled
    });
    l_current_0.createUpdatePointPosition = v77;
    v25(function() --[[ Line: 189 ]]
        -- upvalues: v62 (copy), v63 (copy), v19 (ref)
        local l_current_1 = v62.current;
        local l_current_2 = v63.current;
        local v80 = table.remove(l_current_1);
        if v80 == nil then
            return;
        else
            assert(v80 ~= nil, v19.LUAU_ANALYZE_ERROR);
            table.insert(l_current_2, (v80()));
            return;
        end;
    end, function() --[[ Line: 191 ]]
        -- upvalues: v63 (copy), v62 (copy), v19 (ref)
        local l_current_3 = v63.current;
        local l_current_4 = v62.current;
        local v83 = table.remove(l_current_3);
        if v83 == nil then
            return;
        else
            assert(v83 ~= nil, v19.LUAU_ANALYZE_ERROR);
            table.insert(l_current_4, (v83()));
            return;
        end;
    end);
    local v87 = v5.useMemo(function() --[[ Line: 195 ]]
        -- upvalues: v64 (copy), v44 (copy), v41 (copy)
        local v84 = {};
        for _, v86 in v64 do
            if table.find(v44, v86.name) ~= nil then
                table.insert(v84, (v41.worldModel.PrimaryPart.CFrame * v86.cframe).Position);
                if #v84 == #v44 then
                    break;
                end;
            end;
        end;
        return v84;
    end, {
        v64, 
        v44, 
        v41.worldModel
    });
    v21(v87);
    v5.useEffect(function() --[[ Line: 213 ]]
        -- upvalues: v65 (copy), v61 (copy), v54 (copy)
        local v88 = {};
        local function v89() --[[ Line: 216 ]] --[[ Name: reresolve ]]
            -- upvalues: v65 (ref), v61 (ref)
            v65(v61);
        end;
        for _, v91 in v54 do
            if v91.connectChanged ~= nil then
                table.insert(v88, v91.connectChanged(v89));
            end;
        end;
        return function() --[[ Line: 226 ]]
            -- upvalues: v88 (copy)
            for _, v93 in v88 do
                v93();
            end;
        end;
    end, {
        v54
    });
    for v94, v95 in v64 do
        local v96 = table.find(v44, v95.name) ~= nil;
        local v99 = not v96 and v56.enabled and v2.find(v44, function(v97) --[[ Line: 237 ]]
            -- upvalues: v2 (ref), v41 (copy), v95 (copy)
            return v2.find(v41.points, function(v98) --[[ Line: 238 ]]
                -- upvalues: v97 (copy)
                return v98.name == v97;
            end).symmetricalPartner == v95.name;
        end);
        v43[("Point%*"):format(v94)] = v5.createElement(v9, {
            adornee = v41.worldModel.PrimaryPart, 
            cframe = v95.cframe, 
            selected = v96 or v99, 
            color = if v96 then Color3.new(0, 1, 0) else if v99 then Color3.new(0, 0, 1) else Color3.new(1, 0, 0), 
            transparency = (not not v96 or v99) and 0 or 0.75, 
            transparencyOverModel = 0.5, 
            showOrientation = not not v96 or v99 and true or nil, 
            onMouseEnter = function() --[[ Line: 257 ]] --[[ Name: onMouseEnter ]]
                -- upvalues: l_current_0 (copy), v95 (copy)
                if table.find(l_current_0.hoveredPointNames, v95.name) ~= nil then
                    return;
                else
                    table.insert(l_current_0.hoveredPointNames, v95.name);
                    return;
                end;
            end, 
            onMouseLeave = function() --[[ Line: 265 ]] --[[ Name: onMouseLeave ]]
                -- upvalues: l_current_0 (copy), v95 (copy)
                local v100 = table.find(l_current_0.hoveredPointNames, v95.name);
                if v100 ~= nil then
                    table.remove(l_current_0.hoveredPointNames, v100);
                end;
            end
        });
    end;
    local v101 = v12(l_current_0, v41.worldModel);
    local v114 = v5.useMemo(function() --[[ Line: 276 ]]
        -- upvalues: v11 (ref), l_current_0 (copy), v63 (copy), v62 (copy), v29 (ref), v54 (copy), v77 (copy)
        local v102 = {};
        return {
            beginDrag = function() --[[ Line: 280 ]] --[[ Name: beginDrag ]]
                -- upvalues: v11 (ref), l_current_0 (ref), v63 (ref), v62 (ref), v29 (ref), v54 (ref), v77 (ref), v102 (copy)
                local v103 = v11(l_current_0);
                table.clear(v63.current);
                table.insert(v62.current, (v29(v54)));
                for _, v105 in v54 do
                    local v106 = v77(v105);
                    local v107 = v105.getCFrame();
                    table.insert(v102, function(v108) --[[ Line: 290 ]]
                        -- upvalues: v103 (copy), v106 (copy), v107 (copy)
                        local v109 = v103:Inverse() * v108 * v103;
                        v106(v109 * v107.Rotation + v107.Position);
                    end);
                end;
            end, 
            updateDrag = function(_, v111) --[[ Line: 297 ]] --[[ Name: updateDrag ]]
                -- upvalues: v102 (copy)
                for _, v113 in v102 do
                    v113(v111);
                end;
                return v111;
            end, 
            endDrag = function() --[[ Line: 305 ]] --[[ Name: endDrag ]]
                -- upvalues: v102 (copy)
                table.clear(v102);
            end, 
            render = function() --[[ Line: 309 ]] --[[ Name: render ]]
                return nil;
            end
        };
    end, {
        v54, 
        v61, 
        v77
    });
    local v115 = v5.useMemo(function() --[[ Line: 315 ]]
        -- upvalues: l_MoveHandles_0 (ref), l_current_0 (copy), v114 (copy)
        return l_MoveHandles_0.new(l_current_0, {
            ShowBoundingBox = false, 
            Summonable = false, 
            Outset = 0.3
        }, v114);
    end, {
        v114
    });
    local v116 = v5.useMemo(function() --[[ Line: 323 ]]
        -- upvalues: l_RotateHandles_0 (ref), l_current_0 (copy), v114 (copy)
        return l_RotateHandles_0.new(l_current_0, {
            ShowBoundingBox = false, 
            Summonable = false, 
            Outset = 0.3
        }, v114);
    end, {
        v114
    });
    local v117 = v5.useMemo(function() --[[ Line: 331 ]]
        -- upvalues: v57 (copy), v51 (copy), v14 (ref), v41 (copy), v54 (copy), v101 (copy), v115 (copy), v116 (copy)
        return {
            Mouse = v57, 
            DraggerContext = v51.current, 
            DraggerSchema = v14, 
            DraggerSettings = {
                AnalyticsName = v41.name, 
                HandlesList = if #v54 == 0 then {
                    v101
                } else {
                    v115, 
                    v116
                }
            }
        };
    end, {
        v101, 
        v115, 
        v116, 
        #v54 == 0
    });
    return v5.createElement(v5.Fragment, {}, {
        [v19.EDITING_TOOLS_GUI_NAMES.BodyPoints] = v6.createPortal(v5.createElement("Folder", {
            ref = v46
        }, v43, {
            Dragger = v48.enabled and v5.createElement(l_DraggerToolComponent_0, v117)
        }), l_CoreGui_0, v19.EDITING_TOOLS_GUI_NAMES.BodyPoints), 
        [v19.EDITING_TOOLS_GUI_NAMES.BodyPointsToolToolbar] = v5.createElement(v7.Toolbar, {
            HorizontalItems = {
                {
                    Type = "Button", 
                    Tooltip = "Projection", 
                    Icon = v42.ProjectionImage, 
                    OnClick = v55.toggle, 
                    Selected = v55.enabled
                }, 
                {
                    Type = "Button", 
                    Tooltip = "Symmetrical", 
                    Icon = v42.SymmetricalImage, 
                    OnClick = v56.toggle, 
                    Selected = v56.enabled
                }, 
                {
                    Type = "Separator"
                }, 
                unpack(v41.additionalToolbarItems)
            }
        })
    });
end;
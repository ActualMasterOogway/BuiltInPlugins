local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v8 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v9 = require(l_script_FirstAncestor_0.Packages.Framework);
local v10 = require(l_script_FirstAncestor_0.Packages.LuaMeshEditingModule);
local _ = require(l_script_FirstAncestor_0.Packages._Index.LuaMeshEditingModule.LuaMeshEditingModule.Types);
local v12 = require(l_script_FirstAncestor_0.Packages.React);
local v13 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local v14 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.CageEditingTool.LuaMeshEditingModuleWrapper);
local v15 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v16 = require(l_script_FirstAncestor_0.Src.Util.Serializers);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v19 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.createSegmentationMapAsync);
local v20 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.createSymmetryMapAsync);
local v21 = require(script.mirrorCage);
local v22 = require(l_script_FirstAncestor_0.Src.Hooks.useAsync);
local v23 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.useBindFocusOnPositions);
local v24 = require(l_script_FirstAncestor_0.Src.Hooks.useRefWithInitial);
local v25 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v26 = require(l_script_FirstAncestor_0.Src.Hooks.useUndoRedoActions);
local l_BrushTool_0 = v10.Tools.BrushTool;
local _ = v10.MeshEditingContexts.CageEditingContext;
local l_ContextServices_0 = v9.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_LuaMeshEditingModuleContext_0 = v8.Contexts.LuaMeshEditingModuleContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
return function(v33) --[[ Line: 45 ]] --[[ Name: CageEditingTool ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), v16 (copy), v24 (copy), l_BrushTool_0 (copy), v12 (copy), v25 (copy), v23 (copy), v22 (copy), v20 (copy), v19 (copy), v15 (copy), v21 (copy), v26 (copy), l_ContextServices_0 (copy), l_LuaMeshEditingModuleContext_0 (copy), v14 (copy), v13 (copy)
    local v34 = l_Localization_0:use();
    local v35 = l_Stylizer_0:use("CageEditingTool");
    local l_cageMeshesDataSerializer_0 = v16.cageMeshesDataSerializer;
    local l_cageHistorySerializer_0 = v16.cageHistorySerializer;
    local v38 = v24(l_BrushTool_0.new);
    local v39, v40 = v12.useState(50);
    local v41, v42 = v12.useState(0.3);
    local v43 = v25(true);
    local v44, v45 = v12.useState({});
    v23(v44);
    local v46 = v22(function() --[[ Line: 60 ]]
        -- upvalues: v20 (ref), v33 (copy)
        return v20(v33.mannequin);
    end, {
        v33.mannequin
    });
    local v47 = v22(function() --[[ Line: 64 ]]
        -- upvalues: v19 (ref), v33 (copy)
        return v19(v33.mannequin);
    end, {
        v33.mannequin
    });
    local v48 = v12.useRef(nil);
    local v56 = v12.useCallback(function(v49) --[[ Line: 70 ]]
        -- upvalues: v46 (copy), v15 (ref), v21 (ref), v33 (copy), v48 (copy), v38 (copy)
        if v46.state ~= "ok" then
            return;
        else
            assert(v46.state == "ok", v15.LUAU_ANALYZE_ERROR);
            local v50 = v21(v33.mannequin, v46.value, v49);
            local l_current_0 = v48.current;
            if l_current_0 == nil then
                return;
            else
                local v52 = l_current_0:getMeshesData();
                for v53, v54 in v50 do
                    v52[v53].VertexData = v54;
                end;
                local l_current_1 = v38.current;
                if l_current_1 == nil then
                    return;
                else
                    l_current_1:resetCurrentContextTo(v52);
                    return;
                end;
            end;
        end;
    end, {
        v33.mannequin, 
        v46
    });
    local v58 = v12.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v48 (copy), v38 (copy)
        if v48.current == nil then
            return;
        else
            local l_current_2 = v38.current;
            if l_current_2 == nil then
                return;
            else
                l_current_2:undo();
                return;
            end;
        end;
    end, {});
    local v60 = v12.useCallback(function() --[[ Line: 110 ]]
        -- upvalues: v48 (copy), v38 (copy)
        if v48.current == nil then
            return;
        else
            local l_current_3 = v38.current;
            if l_current_3 == nil then
                return;
            else
                l_current_3:redo();
                return;
            end;
        end;
    end, {});
    local v62 = v12.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v38 (copy), l_cageMeshesDataSerializer_0 (copy), v33 (copy)
        local l_current_4 = v38.current;
        if l_current_4 == nil then
            return;
        else
            l_current_4:resetCurrentContextTo((l_cageMeshesDataSerializer_0.deserialize(v33.initialMeshesData)));
            return;
        end;
    end, {
        v33.initialMeshesData
    });
    v12.useEffect(function() --[[ Line: 134 ]]
        -- upvalues: v48 (copy), v33 (copy), l_cageMeshesDataSerializer_0 (copy)
        if v48.current == nil or v33.initialMeshesData ~= nil then
            return;
        else
            local v63 = l_cageMeshesDataSerializer_0.serialize(v48.current:getMeshesData());
            v33.setInitialMeshesData(v63);
            return;
        end;
    end, {
        v33.initialMeshesData
    });
    local v64 = nil;
    local v65 = nil;
    if v38 ~= nil then
        local v66, v67 = v38.current:getUndoRedoStack();
        v64 = v66;
        v65 = v67;
    end;
    local l_useEffect_0 = v12.useEffect;
    local function v73() --[[ Line: 148 ]]
        -- upvalues: v38 (copy), l_cageHistorySerializer_0 (copy), v33 (copy)
        local l_current_5 = v38.current;
        if l_current_5 == nil then
            return;
        else
            local v70, v71 = l_current_5:getUndoRedoStack();
            local v72 = l_cageHistorySerializer_0.serialize(v70, v71);
            v33.setChangeHistory(v72);
            return;
        end;
    end;
    local v74 = {};
    local v75 = false;
    if v64 ~= nil then
        v75 = #v64;
    end;
    local v76 = false;
    if v65 ~= nil then
        v76 = #v65;
    end;
    v6(v74, 1, v75, v76);
    l_useEffect_0(v73, v74);
    v12.useEffect(function() --[[ Line: 162 ]]
        -- upvalues: v38 (copy), v33 (copy), l_cageHistorySerializer_0 (copy)
        local l_current_6 = v38.current;
        if l_current_6 == nil then
            return;
        elseif v33.changeHistory == nil then
            return;
        else
            local v78, v79 = l_cageHistorySerializer_0.deserialize(v33.changeHistory);
            l_current_6:restoreUndoRedoStack(v78, v79);
            return;
        end;
    end, {
        v33.mannequin
    });
    v26(v58, v60);
    return l_ContextServices_0.provide({
        l_LuaMeshEditingModuleContext_0.new({
            BrushTool = v38.current
        })
    }, {
        CageEditingTool = v12.createElement(v14, {
            mannequin = v33.mannequin, 
            falloff = v39 / 100 * v41 / v15.FALLOFF_CURSOR_ADJUSTMENT, 
            radius = v41, 
            segmentationMap = v47, 
            symmetrical = v43.enabled, 
            symmetryMap = v46, 
            onChangeSelectedPositions = v45, 
            outerCageContextRef = v48
        }), 
        [v15.EDITING_TOOLS_GUI_NAMES.CageEditingToolToolbar] = v12.createElement(v13.Toolbar, {
            HorizontalItems = {
                {
                    Type = "Button", 
                    Icon = v35.SymmetryImage, 
                    Tooltip = v34:getText("CageEditingTool", "Symmetry"), 
                    TooltipDescription = v34:getText("CageEditingTool", "SymmetryDescription"), 
                    OnClick = v43.toggle, 
                    Selected = v43.enabled
                }, 
                {
                    Type = "SplitButton", 
                    Options = {
                        {
                            Icon = v12.createElement("ImageLabel", {
                                Image = v35.MirrorToRightImage, 
                                Size = UDim2.fromScale(1, 1)
                            }), 
                            Text = v34:getText("CageEditingTool", "MirrorLeft"), 
                            OnClick = function() --[[ Line: 221 ]] --[[ Name: OnClick ]]
                                -- upvalues: v56 (copy)
                                v56("right");
                            end
                        }, 
                        {
                            Icon = v12.createElement("ImageLabel", {
                                Image = v35.MirrorToLeftImage, 
                                Size = UDim2.fromScale(1, 1)
                            }), 
                            Text = v34:getText("CageEditingTool", "MirrorRight"), 
                            OnClick = function() --[[ Line: 232 ]] --[[ Name: OnClick ]]
                                -- upvalues: v56 (copy)
                                v56("left");
                            end
                        }
                    }
                }, 
                {
                    Type = "Separator"
                }, 
                {
                    Type = "Slider", 
                    Value = v41, 
                    OnChange = v42, 
                    Icon = v35.RadiusImage, 
                    Tooltip = v34:getText("CageEditingTool", "Radius"), 
                    Min = 0.01, 
                    Max = 2
                }, 
                {
                    Type = "Slider", 
                    Value = v39, 
                    OnChange = v40, 
                    Icon = v35.FalloffImage, 
                    Tooltip = v34:getText("CageEditingTool", "Falloff"), 
                    Min = 1, 
                    Max = 100, 
                    InputPrecision = 0, 
                    DisplayFormat = "%d%%"
                }, 
                {
                    Type = "Separator"
                }, 
                {
                    Type = "Button", 
                    Icon = v35.ResetChangesImage, 
                    Tooltip = v34:getText("EditingTools", "ResetEdits"), 
                    OnClick = v62
                }, 
                unpack(v33.additionalToolbarItems)
            }
        })
    });
end;
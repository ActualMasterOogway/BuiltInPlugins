local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_MaterialGrid_0 = v3.Components.MaterialGrid;
local l_MaterialPreviewGeometryType_0 = v3.Enums.MaterialPreviewGeometryType;
local l_getSerializedMaterialIdentifier_0 = v3.Util.getSerializedMaterialIdentifier;
local v15 = require(l_script_FirstAncestor_0.Src.Components.PromptGroupFooter);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorFixSelectedMaterial);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorFixSaveIconDisappear);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorTempMaterialVariantsFix);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v22 = require(l_Util_0.Constants);
local v23 = require(l_Util_0.GeneratedMaterialsContext);
local v24 = require(l_Util_0.GenerationContext);
local v25 = require(l_Util_0.PluginSettingsContext);
local v26 = require(l_Util_0.PreviewContext);
local v27 = require(l_Util_0.getAllMaterialVariants);
local v28 = require(l_Util_0.getSampleCount);
local l_SETTING_GEOMETRY_TYPE_0 = v22.SETTING_GEOMETRY_TYPE;
local l_SETTING_GEOMETRY_TYPE_DEFAULT_0 = v22.SETTING_GEOMETRY_TYPE_DEFAULT;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v32) --[[ Line: 65 ]] --[[ Name: Browser ]]
    -- upvalues: v16 (copy), v4 (copy), v23 (copy), v24 (copy), l_ContextServices_0 (copy), l_Localization_0 (copy), v25 (copy), l_SETTING_GEOMETRY_TYPE_0 (copy), l_MaterialPreviewGeometryType_0 (copy), l_SETTING_GEOMETRY_TYPE_DEFAULT_0 (copy), v26 (copy), l_getSerializedMaterialIdentifier_0 (copy), l_showContextMenu_0 (copy), v19 (copy), v27 (copy), v28 (copy), v1 (copy), l_Stylizer_0 (copy), v15 (copy), v18 (copy), l_Image_0 (copy), l_Pane_0 (copy), l_MaterialGrid_0 (copy), v17 (copy)
    assert(v16(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local v33 = v4.useContext(v23);
    local l_promptGroups_0 = v33.promptGroups;
    local l_materialStates_0 = v33.materialStates;
    local l_removeMaterial_0 = v33.removeMaterial;
    local l_removeAllMaterials_0 = v33.removeAllMaterials;
    local v38 = v4.useContext(v24);
    local l_lastGeneratedPromptText_0 = v38.lastGeneratedPromptText;
    local l_isGenerating_0 = v38.isGenerating;
    local v41 = l_ContextServices_0.Plugin.use():get();
    local v42 = l_Localization_0:use();
    local v43 = v4.useContext(v25);
    local v44 = v43.getSetting(l_SETTING_GEOMETRY_TYPE_0);
    local v45 = nil;
    if v44 then
        v45 = l_MaterialPreviewGeometryType_0.fromRawValue(v44);
    else
        v43.setSetting(l_SETTING_GEOMETRY_TYPE_0, l_SETTING_GEOMETRY_TYPE_DEFAULT_0);
    end;
    local v46 = v4.useContext(v26);
    local l_selectedMaterial_0 = v46.selectedMaterial;
    local l_setSelectedMaterial_0 = v46.setSelectedMaterial;
    local v49 = if l_selectedMaterial_0 then l_getSerializedMaterialIdentifier_0(l_selectedMaterial_0) else nil;
    local v54 = v4.useCallback(function(v50) --[[ Line: 97 ]]
        -- upvalues: v42 (copy), l_selectedMaterial_0 (copy), l_setSelectedMaterial_0 (copy), l_removeMaterial_0 (copy), l_promptGroups_0 (copy), l_removeAllMaterials_0 (copy), v45 (ref), l_MaterialPreviewGeometryType_0 (ref), v43 (copy), l_SETTING_GEOMETRY_TYPE_0 (ref), l_showContextMenu_0 (ref), v41 (copy)
        local v53 = {
            {
                Text = v42:getText("Browser", "Remove"), 
                Enabled = v50 ~= nil, 
                OnItemClicked = function() --[[ Line: 102 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v50 (copy), l_selectedMaterial_0 (ref), l_setSelectedMaterial_0 (ref), l_removeMaterial_0 (ref)
                    if v50 and l_selectedMaterial_0 == v50.Material then
                        l_setSelectedMaterial_0(nil);
                    end;
                    if v50 then
                        l_removeMaterial_0(v50.Material);
                    end;
                end
            }, 
            {
                Text = v42:getText("Browser", "RemoveAll"), 
                Enabled = #l_promptGroups_0 > 0, 
                OnItemClicked = function() --[[ Line: 114 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: l_setSelectedMaterial_0 (ref), l_removeAllMaterials_0 (ref)
                    l_setSelectedMaterial_0(nil);
                    l_removeAllMaterials_0();
                end
            }, 
            {
                ShowSeparator = true
            }, 
            {
                Checked = v45 == l_MaterialPreviewGeometryType_0.Plane, 
                Text = v42:getText("Browser", "PlanePreview"), 
                Enabled = true, 
                OnItemClicked = function() --[[ Line: 126 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: l_MaterialPreviewGeometryType_0 (ref), v43 (ref), l_SETTING_GEOMETRY_TYPE_0 (ref)
                    local v51 = l_MaterialPreviewGeometryType_0.Plane.rawValue();
                    v43.setSetting(l_SETTING_GEOMETRY_TYPE_0, v51);
                end
            }, 
            {
                Checked = v45 == l_MaterialPreviewGeometryType_0.Sphere, 
                Text = v42:getText("Browser", "SpherePreview"), 
                Enabled = true, 
                OnItemClicked = function() --[[ Line: 135 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: l_MaterialPreviewGeometryType_0 (ref), v43 (ref), l_SETTING_GEOMETRY_TYPE_0 (ref)
                    local v52 = l_MaterialPreviewGeometryType_0.Sphere.rawValue();
                    v43.setSetting(l_SETTING_GEOMETRY_TYPE_0, v52);
                end
            }
        };
        task.spawn(function() --[[ Line: 142 ]]
            -- upvalues: l_showContextMenu_0 (ref), v41 (ref), v53 (copy)
            l_showContextMenu_0(v41, v53);
        end);
    end, {
        l_selectedMaterial_0, 
        l_promptGroups_0, 
        v45, 
        l_removeMaterial_0, 
        l_removeAllMaterials_0
    });
    if v19() then
        v4.useEffect(function() --[[ Line: 148 ]]
            -- upvalues: v27 (ref), l_promptGroups_0 (copy), v33 (copy), l_selectedMaterial_0 (copy)
            for _, v56 in (v27(l_promptGroups_0)) do
                if v33.getMaterialStatus(v56) ~= "Uploaded" and v56 ~= l_selectedMaterial_0 then
                    v56.Parent = nil;
                end;
            end;
        end, {
            l_promptGroups_0, 
            l_selectedMaterial_0
        });
    end;
    local v57 = v28();
    local v62 = v4.useMemo(function() --[[ Line: 161 ]]
        -- upvalues: l_isGenerating_0 (copy), v57 (copy), v27 (ref), l_promptGroups_0 (copy), v1 (ref)
        local v58 = {};
        if l_isGenerating_0 then
            for _ = 1, v57 do
                table.insert(v58, {
                    Loading = true
                });
            end;
        end;
        local v60 = v27(l_promptGroups_0);
        v1.append(v58, v1.map(v60, function(v61) --[[ Line: 174 ]]
            return {
                Id = v61, 
                Loading = false, 
                Material = v61
            };
        end));
        return v58;
    end, {
        l_promptGroups_0, 
        l_isGenerating_0
    });
    local v63 = l_Stylizer_0:use("Browser");
    local v64 = v1.join(v63.CellGroupHeader, {
        HeaderComponent = v15
    });
    local v69 = v4.useMemo(function() --[[ Line: 192 ]]
        -- upvalues: v1 (ref), l_promptGroups_0 (copy), l_isGenerating_0 (copy), l_lastGeneratedPromptText_0 (copy), v57 (copy)
        local v66 = v1.map(l_promptGroups_0, function(v65) --[[ Line: 193 ]]
            return {
                CellCount = #v65.materialVariants, 
                Text = v65.filteredPromptText or v65.promptText
            };
        end);
        if l_isGenerating_0 then
            local v67 = l_promptGroups_0[1];
            if v67 and v67.promptText == l_lastGeneratedPromptText_0 then
                local v68 = v66[1];
                v68.CellCount = v68.CellCount + v57;
                return v66;
            else
                table.insert(v66, 1, {
                    CellCount = v57, 
                    Text = l_lastGeneratedPromptText_0
                });
            end;
        end;
        return v66;
    end, {
        l_promptGroups_0, 
        l_isGenerating_0, 
        l_lastGeneratedPromptText_0
    });
    local v70 = nil;
    v70 = if v18() then {
        v62, 
        l_materialStates_0, 
        l_promptGroups_0
    } else {
        v33
    };
    local v72 = v4.useCallback(function(v71) --[[ Line: 223 ]]
        -- upvalues: v33 (copy), v4 (ref), l_Image_0 (ref), v63 (copy)
        if not v71.Material or v71.Loading then
            return nil;
        elseif v33.getMaterialStatus(v71.Material) == "Uploaded" then
            return {
                StatusIcon = v4.createElement(l_Image_0, {
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/StudioSharedUI/ready@2x.png", 
                    ImageColor3 = v63.StatusIconImageColor, 
                    Position = v63.StatusIconPosition, 
                    Size = v63.StatusIconSize
                })
            };
        else
            return nil;
        end;
    end, v70);
    return v4.createElement(l_Pane_0, {
        LayoutOrder = v32.LayoutOrder, 
        Size = v32.Size
    }, {
        Grid = v4.createElement(l_MaterialGrid_0, {
            CellGroups = v69, 
            CellGroupHeader = v64, 
            Items = v62, 
            MaterialPreviewGeometryType = v45, 
            OnClick = function(v73) --[[ Line: 254 ]] --[[ Name: OnClick ]]
                -- upvalues: l_setSelectedMaterial_0 (copy)
                l_setSelectedMaterial_0(v73.Material);
            end, 
            OnRenderItemChildren = v72, 
            OnRightClick = v54, 
            Padding = v63.Padding, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            SelectedItemId = if v17() then v49 else l_selectedMaterial_0, 
            ShowGridLabels = false
        })
    });
end;
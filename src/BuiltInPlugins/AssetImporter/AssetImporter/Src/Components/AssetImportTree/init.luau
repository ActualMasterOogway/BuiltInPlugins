local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_CheckboxTreeView_0 = l_UI_0.CheckboxTreeView;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_IconButton_0 = l_UI_0.IconButton;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v18 = require(l_script_FirstAncestor_0.Src.Components.TreeViewToolbar);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedImportItem);
local v20 = require(l_script_FirstAncestor_0.Src.Actions.SetTreeExpansion);
local v21 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateChecked);
local v22 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v23 = require(l_script_FirstAncestor_0.Src.Resources.StatusLevel);
local v24 = require(l_script_FirstAncestor_0.Src.Utility.Status.countStatusLevelsForTree);
local v25 = require(l_script_FirstAncestor_0.Src.Utility.Status.getFirstDescendantWithStatus);
local v26 = require(l_script_FirstAncestor_0.Src.Utility.trimFilename);
local v27 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v28 = require(l_script_FirstAncestor_0.Src.Utility.DebugFlags);
local v29 = require(l_script_FirstAncestor_0.Src.Utility.createCalloutComponents);
local v30 = game:DefineFastFlag("UseImportNameForRoot", false);
local v31 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportWarningIconJump);
local v32 = v2.PureComponent:extend("AssetImportTree");
local _ = function(v33) --[[ Line: 48 ]] --[[ Name: generateChecked ]]
    local v34 = {};
    local function v35(v36) --[[ Line: 51 ]] --[[ Name: percolateDown ]]
        -- upvalues: v34 (copy), v35 (copy)
        for _, v38 in pairs(v36) do
            v34[v38] = true;
            local l_v38_Children_0 = v38:GetChildren();
            if #l_v38_Children_0 > 0 then
                v35(l_v38_Children_0);
            end;
        end;
    end;
    v35(v33);
    return v34;
end;
local function v53(v41, v42, v43, v44, v45) --[[ Line: 68 ]] --[[ Name: DEPRECATED_getStatusIcon ]]
    -- upvalues: v23 (copy), v2 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    if v42 == v23.Error then
        v46 = "rbxasset://textures/StudioSharedUI/alert_error@2x.png";
        v47 = v45:getText("AssetImportTree", "Errors");
        v48 = v41.errors;
        v49 = v41.descErrors;
    elseif v42 == v23.Warning then
        v46 = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png";
        v47 = v45:getText("AssetImportTree", "Warnings");
        v48 = v41.warnings;
        v49 = v41.descWarnings;
    end;
    local v50 = nil;
    if v48 > 0 then
        local v51 = v45:getText("AssetImportTree", "Contains");
        v50 = string.format(v51, v48, v47);
    elseif v49 > 0 and not v43 then
        local v52 = v45:getText("AssetImportTree", "Descendants");
        v50 = string.format(v52, v49, v47);
    else
        return nil;
    end;
    return v2.createElement(l_Image_0, {
        LayoutOrder = v44:getNextOrder(), 
        Style = {
            Image = v46
        }, 
        Size = UDim2.new(0, 20, 0, 20)
    }, {
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = v50
        })
    });
end;
local function v67(v54, v55, v56, v57, v58) --[[ Line: 108 ]] --[[ Name: toggleAncestors ]]
    -- upvalues: l_Checkbox_0 (copy)
    local function v59(v60) --[[ Line: 109 ]] --[[ Name: toggleAncestorsRecursive ]]
        -- upvalues: v56 (copy), v58 (copy), v57 (copy), v55 (copy), l_Checkbox_0 (ref), v59 (copy)
        local v61 = v56[v60];
        if not v61 or v58[v60] == nil then
            return;
        else
            local v62 = true;
            local v63 = false;
            for _, v65 in ipairs(v57(v61)) do
                local v66 = v58[v65];
                if v66 == nil then
                    v66 = v55[v65] or false;
                end;
                v62 = v62 and v66 ~= l_Checkbox_0.Indeterminate and v66;
                v63 = v63 or v66 == l_Checkbox_0.Indeterminate or v66;
            end;
            if v62 then
                if v55[v61] == true then
                    return;
                elseif v61:IsA("GroupImportData") or v61:IsA("RootImportData") then
                    v58[v61] = true;
                end;
            elseif not v63 then
                if v55[v61] == false then
                    return;
                elseif v61:IsA("GroupImportData") or v61:IsA("RootImportData") then
                    v58[v61] = false;
                end;
            end;
            v59(v61);
            return;
        end;
    end;
    v59(v54);
end;
local function v69() --[[ Line: 148 ]] --[[ Name: getCalloutList ]]
    -- upvalues: v28 (copy)
    local function v68() --[[ Line: 149 ]]
        -- upvalues: v28 (ref)
        return not v28.RunningUnderCLI();
    end;
    return {
        {
            Name = "ApplyToAllCallout", 
            ShouldShow = v68
        }
    };
end;
v32.init = function(v70) --[[ Line: 158 ]] --[[ Name: init ]]
    -- upvalues: v30 (copy), v26 (copy), l_LayoutOrderIterator_0 (copy), v31 (copy), v23 (copy), v53 (copy), v2 (copy), l_Pane_0 (copy), l_showContextMenu_0 (copy)
    v70.getChildren = function(v71) --[[ Line: 159 ]]
        return v71:GetChildren();
    end;
    v70.getContents = function(v72) --[[ Line: 163 ]]
        -- upvalues: v30 (ref), v26 (ref), v70 (copy)
        if not v30 and v72.ClassName == "RootImportData" then
            return v26(v70.props.FileName), nil;
        else
            return v72.ImportName, nil;
        end;
    end;
    v70.setChecked = function(v73) --[[ Line: 171 ]]
        -- upvalues: v70 (copy)
        local l_props_0 = v70.props;
        l_props_0.SetChecked(v73);
        if l_props_0.SelectedImportItem then
            local l_Preview_0 = l_props_0.SelectedImportItem:GetPreview();
            l_props_0.UpdatePreviewInstance(l_Preview_0);
        end;
    end;
    v70.SelectItem = function(v76) --[[ Line: 181 ]]
        -- upvalues: v70 (copy)
        local v77 = next(v76);
        if v70.props.SelectedImportItem == v77 then
            return;
        else
            v70.props.SetSelectedImportItem(v77);
            if v77 then
                v70.props.UpdatePreviewInstance(v77:GetPreview());
                return;
            else
                v70.props.UpdatePreviewInstance(nil);
                return;
            end;
        end;
    end;
    v70.statusCounts = {};
    v70.afterItem = function(v78) --[[ Line: 196 ]]
        -- upvalues: v70 (copy), l_LayoutOrderIterator_0 (ref), v31 (ref), v23 (ref), v53 (ref), v2 (ref), l_Pane_0 (ref)
        local l_Item_0 = v78.Item;
        local v80 = v70.statusCounts[l_Item_0];
        if not v80 then
            return nil;
        else
            local v81 = l_LayoutOrderIterator_0.new();
            local v82 = nil;
            v82 = if v31() then v70:getStatusIcon(v80, v23.Error, l_Item_0, v78.Expanded, v81) or v70:getStatusIcon(v80, v23.Warning, l_Item_0, v78.Expanded, v81) else v53(v80, v23.Error, v78.Expanded, v81, v70.props.Localization) or v53(v80, v23.Warning, v78.Expanded, v81, v70.props.Localization);
            local v83 = v82 and 20 or 0;
            return v2.createElement(l_Pane_0, {
                Size = UDim2.new(0, v83, 0, 20), 
                LayoutOrder = v78.LayoutOrder, 
                Layout = Enum.FillDirection.Horizontal
            }, {
                StatusCount = v82
            });
        end;
    end;
    v70.createContextMenu = function(v84) --[[ Line: 241 ]]
        -- upvalues: v70 (copy), l_showContextMenu_0 (ref)
        local v85 = v70.props.Plugin:get();
        local l_Localization_1 = v70.props.Localization;
        local l_PresetController_0 = v70.props.PresetController;
        local v88 = {
            {
                Text = l_Localization_1:getText("AssetImportTree", "RightClickApplyToAll1", {
                    nodeName = v84.ImportName
                }), 
                OnItemClicked = function() --[[ Line: 248 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: l_PresetController_0 (copy), v84 (copy)
                    l_PresetController_0:applyImportDataToSession(v84);
                end
            }
        };
        l_showContextMenu_0(v85, v88);
    end;
end;
v32.getStatusIcon = function(v89, v90, v91, v92, v93, v94) --[[ Line: 258 ]] --[[ Name: getStatusIcon ]]
    -- upvalues: v23 (copy), v2 (copy), l_IconButton_0 (copy), v25 (copy)
    local v95 = nil;
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local l_Stylizer_1 = v89.props.Stylizer;
    local l_Localization_2 = v89.props.Localization;
    if v91 == v23.Error then
        v95 = l_Stylizer_1.ErrorIcon.Image;
        v96 = l_Localization_2:getText("AssetImportTree", "Errors");
        v97 = v90.errors;
        v98 = v90.descErrors;
    elseif v91 == v23.Warning then
        v95 = l_Stylizer_1.WarningIcon.Image;
        v96 = l_Localization_2:getText("AssetImportTree", "Warnings");
        v97 = v90.warnings;
        v98 = v90.descWarnings;
    end;
    local v101 = nil;
    if v97 > 0 then
        local v102 = l_Localization_2:getText("AssetImportTree", "Contains");
        v101 = string.format(v102, v97, v96);
    elseif v98 > 0 and not v93 then
        local v103 = l_Localization_2:getText("AssetImportTree", "Descendants");
        v101 = string.format(v103, v98, v96);
    else
        return nil;
    end;
    return v2.createElement(l_IconButton_0, {
        LayoutOrder = v94:getNextOrder(), 
        IconSize = 20, 
        LeftIcon = v95, 
        OnClick = function() --[[ Line: 290 ]] --[[ Name: OnClick ]]
            -- upvalues: v25 (ref), v92 (copy), v91 (copy), v89 (copy)
            local v104 = v25(v92, v91);
            if v104 then
                v89.SelectItem({
                    [v104] = true
                });
                local v105 = {};
                while v104.Parent do
                    v104 = v104.Parent;
                    v105[v104] = true;
                end;
                v89.props.SetExpansion(v105);
            end;
        end, 
        Style = "IconOnly", 
        Size = UDim2.new(0, 20, 0, 20), 
        TooltipText = v101
    });
end;
v32.render = function(v106) --[[ Line: 311 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v24 (copy), v29 (copy), v69 (copy), v2 (copy), l_Pane_0 (copy), v18 (copy), l_Separator_0 (copy), l_CheckboxTreeView_0 (copy), v67 (copy)
    local l_props_1 = v106.props;
    local v108 = l_props_1.Stylizer.Sizes.ToolbarHeight + 1;
    local l_Checked_0 = l_props_1.Checked;
    if not l_Checked_0 then
        local l_Instances_0 = l_props_1.Instances;
        local v111 = {};
        local l_v111_0 = v111 --[[ copy: 6 -> 8 ]];
        local function v113(v114) --[[ Line: 51 ]] --[[ Name: percolateDown ]]
            -- upvalues: l_v111_0 (copy), v113 (copy)
            for _, v116 in pairs(v114) do
                l_v111_0[v116] = true;
                local l_v116_Children_0 = v116:GetChildren();
                if #l_v116_Children_0 > 0 then
                    v113(l_v116_Children_0);
                end;
            end;
        end;
        v113(l_Instances_0);
        l_Checked_0 = v111;
    end;
    local v118 = l_LayoutOrderIterator_0.new();
    v106.statusCounts = v24(l_props_1.ImportTree);
    local function v120(v119) --[[ Line: 324 ]] --[[ Name: createContextMenu ]]
        -- upvalues: v106 (copy)
        v106.createContextMenu(v119.Item);
    end;
    local v121 = v29(v69(), "AssetImportTree", l_props_1.AssetImportSession);
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical
    }, {
        Toolbar = v2.createElement(v18, {
            Expansion = l_props_1.Expansion, 
            LayoutOrder = v118:getNextOrder(), 
            OnExpansionChange = l_props_1.SetExpansion, 
            Size = UDim2.new(1, 0, 0, v108)
        }), 
        Callout = v2.createElement(l_Pane_0, {
            LayoutOrder = v118:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        }, v121), 
        Separator = v2.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = v118:getNextOrder()
        }), 
        TreeView = v2.createElement(l_CheckboxTreeView_0, {
            RootItems = l_props_1.Instances or {}, 
            Selection = l_props_1.SelectedImportItem and {
                [l_props_1.SelectedImportItem] = true
            } or {}, 
            Expansion = l_props_1.Expansion, 
            Checked = l_Checked_0, 
            LayoutOrder = v118:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -v108), 
            OnSelectionChange = v106.SelectItem, 
            OnExpansionChange = l_props_1.SetExpansion, 
            OnCheck = v106.setChecked, 
            GetChildren = v106.getChildren, 
            GetContents = v106.getContents, 
            ExpandableRoot = false, 
            AfterItem = v106.afterItem, 
            ToggleAncestors = v67, 
            ToggleDescendants = l_CheckboxTreeView_0.DownPropagators.toggleAllChildren, 
            OnRightClick = v120
        })
    });
end;
v32 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_ContextServices_0.Plugin, 
    PresetController = v27
})(v32);
return v3.connect(function(v122) --[[ Line: 380 ]] --[[ Name: mapStateToProps ]]
    return {
        AssetImportSession = v122.Preview.assetImportSession, 
        ImportTree = v122.Preview.importTree, 
        SelectedImportItem = v122.Preview.selectedImportItem, 
        Expansion = v122.Preview.importDataExpansion or {}, 
        Checked = v122.Preview.importDataChecked or {}
    };
end, function(v123) --[[ Line: 390 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v20 (copy), v21 (copy), v22 (copy)
    return {
        SetSelectedImportItem = function(v124) --[[ Line: 392 ]] --[[ Name: SetSelectedImportItem ]]
            -- upvalues: v123 (copy), v19 (ref)
            v123(v19(v124));
        end, 
        SetExpansion = function(v125) --[[ Line: 395 ]] --[[ Name: SetExpansion ]]
            -- upvalues: v123 (copy), v20 (ref)
            v123(v20(v125));
        end, 
        SetChecked = function(v126) --[[ Line: 398 ]] --[[ Name: SetChecked ]]
            -- upvalues: v123 (copy), v21 (ref)
            v123(v21(v126));
        end, 
        UpdatePreviewInstance = function(v127) --[[ Line: 401 ]] --[[ Name: UpdatePreviewInstance ]]
            -- upvalues: v123 (copy), v22 (ref)
            v123(v22(v127));
        end
    };
end)(v32);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_join_0 = v4.Dash.join;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Pane_0 = l_UI_0.Pane;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v17 = require(l_Actions_0.SetMaterialVariant);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v20 = require(l_Controllers_0.GeneralServiceController);
local v21 = require(l_Controllers_0.MaterialServiceController);
local v22 = require(l_Controllers_0.PluginController);
local l_Components_0 = l_Parent_0.Src.Components;
local v24 = require(l_Components_0.MaterialBrowser.MaterialEditor);
local l_TopBar_0 = l_Components_0.MaterialBrowser.TopBar;
local v26 = require(l_TopBar_0.ActionButton);
local v27 = require(l_TopBar_0.ViewTypeSelector);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v29 = require(l_Constants_0.getMaterialName);
local v30 = require(l_Constants_0.getMaterialPath);
local v31 = require(l_Constants_0.getSupportedMaterials);
local l_Flags_0 = l_Parent_0.Src.Flags;
local v33 = require(l_Flags_0.getFFlagMaterialActionAsTool);
local l_game_FastInt_0 = game:GetFastInt("InfluxReportMaterialManagerHundrethPercent2");
local v35 = v31();
local v36 = v2.PureComponent:extend("TopBar");
local v37 = v33() and 2 or 3;
v36.init = function(v38) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v35 (copy), v29 (copy), l_game_FastInt_0 (copy), v30 (copy), v24 (ref), v2 (copy)
    v38.createMaterialVariant = function() --[[ Line: 99 ]]
        -- upvalues: v38 (copy), v35 (ref), v29 (ref), l_game_FastInt_0 (ref), v30 (ref), v24 (ref), v2 (ref)
        local l_props_0 = v38.props;
        local v40 = if l_props_0.Material then l_props_0.Material.Material else l_props_0.MaterialServiceController:getCategoryDefaultMaterial(l_props_0.Path);
        if not v35[v40] then
            v40 = Enum.Material.Plastic;
        end;
        local l_Search_0 = l_props_0.Search;
        local v42 = l_props_0.GeneralServiceController:createMaterialVariant(v40, l_Search_0);
        local v43 = {
            BaseMaterial = v29(v40)
        };
        l_props_0.Analytics:report("newMaterialVariant", v43, l_game_FastInt_0);
        l_props_0.Analytics:report("newMaterialVariantCounter");
        l_props_0.MaterialServiceController:setPath(v30(v40));
        l_props_0.dispatchSetMaterialVariant(v42);
        v24 = v2.createElement(v24, {
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 1)
        });
    end;
    v38.showInExplorer = function() --[[ Line: 123 ]]
        -- upvalues: v38 (copy)
        local l_props_1 = v38.props;
        if l_props_1.Material and l_props_1.Material.MaterialVariant then
            l_props_1.GeneralServiceController:SetSelection({
                l_props_1.Material.MaterialVariant
            });
            l_props_1.Analytics:report("showInExplorer");
        end;
    end;
    v38.DEPRECATED_materialAsTool = function() --[[ Line: 134 ]]
        -- upvalues: v38 (copy)
        local l_props_2 = v38.props;
        if not l_props_2.DEPRECATED_ActiveAsTool and l_props_2.Material then
            l_props_2.PluginController:DEPRECATED_toggleMaterialAsTool();
        elseif l_props_2.DEPRECATED_ActiveAsTool then
            l_props_2.PluginController:DEPRECATED_untoggleMaterialAsTool();
        end;
        l_props_2.Analytics:report("materialAsTool");
    end;
    v38.setSearch = function(v46) --[[ Line: 146 ]]
        -- upvalues: v38 (copy)
        local l_props_3 = v38.props;
        l_props_3.MaterialServiceController:setSearch(v46);
        l_props_3.Analytics:report("searchBar");
    end;
end;
v36.render = function(v48) --[[ Line: 154 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v33 (copy), v37 (copy), v2 (copy), l_Pane_0 (copy), l_join_0 (copy), v26 (copy), l_SearchBar_0 (copy), v27 (copy)
    local l_props_4 = v48.props;
    local l_TopBar_1 = l_props_4.Stylizer.TopBar;
    local l_LayoutOrder_0 = l_props_4.LayoutOrder;
    local l_Size_0 = l_props_4.Size;
    local l_Localization_1 = l_props_4.Localization;
    local v54 = l_LayoutOrderIterator_0.new();
    local l_CreateNewVariant_0 = l_TopBar_1.CreateNewVariant;
    local l_ShowInExplorer_0 = l_TopBar_1.ShowInExplorer;
    local v57 = if v33() then nil else l_TopBar_1.DEPRECATED_MaterialAsToolMouseIcon;
    local l_BackgroundColor_0 = l_TopBar_1.BackgroundColor;
    local l_Offset_0 = l_TopBar_1.ButtonSize.X.Offset;
    local l_Padding_0 = l_TopBar_1.Padding;
    local l_SpacerWidth_0 = l_TopBar_1.SpacerWidth;
    local l_SearchBarMaxWidth_0 = l_TopBar_1.SearchBarMaxWidth;
    local l_TopBarButtonWidth_0 = l_TopBar_1.TopBarButtonWidth;
    local l_Offset_1 = l_TopBar_1.ViewTypeSize.X.Offset;
    local v65 = math.min(1, (l_props_4.AbsoluteSize.X - (v37 * (l_Offset_0 + l_Padding_0) + (l_Offset_1 + l_Padding_0))) / (2 * l_SpacerWidth_0 + l_SearchBarMaxWidth_0));
    local v66 = not l_props_4.Material or not l_props_4.Material.MaterialVariant or false;
    local v67 = if v33() then nil else l_props_4.DEPRECATED_ActiveAsTool;
    return v2.createElement(l_Pane_0, l_join_0({
        BackgroundColor = l_BackgroundColor_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = l_LayoutOrder_0, 
        Padding = l_Padding_0, 
        Size = l_Size_0, 
        Spacing = l_Padding_0
    }, l_props_4.WrapperProps), {
        CreateMaterialVariant = v2.createElement(v26, {
            ImageStyle = l_CreateNewVariant_0, 
            IsDisabled = false, 
            LayoutOrder = v54:getNextOrder(), 
            OnClick = v48.createMaterialVariant, 
            TooltipText = l_Localization_1:getText("TopBar", "Create")
        }), 
        ShowInExplorer = v2.createElement(v26, {
            ImageStyle = l_ShowInExplorer_0, 
            IsDisabled = v66, 
            LayoutOrder = v54:getNextOrder(), 
            OnClick = v48.showInExplorer, 
            TooltipText = l_Localization_1:getText("TopBar", "Show")
        }), 
        MaterialAsTool = if v33() then nil else v2.createElement(v26, {
            ImageStyle = v57, 
            IsPressed = if v33() then nil else v67, 
            LayoutOrder = v54:getNextOrder(), 
            OnClick = v48.DEPRECATED_materialAsTool, 
            TooltipText = l_Localization_1:getText("TopBar", "MaterialAsTool")
        }), 
        RestPane = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, -(v37 * (l_Offset_0 + l_Padding_0) + (l_Offset_1 + l_Padding_0)), 1, 0), 
            LayoutOrder = v54:getNextOrder()
        }, {
            SearchBar = v2.createElement(l_SearchBar_0, {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                OnSearchRequested = v48.setSearch, 
                PlaceholderText = l_Localization_1:getText("TopBar", "Search"), 
                ShowSearchButton = false, 
                ShowSearchIcon = true, 
                Size = UDim2.new(0, l_SearchBarMaxWidth_0 * v65, 0, l_TopBarButtonWidth_0)
            })
        }), 
        ViewType = v2.createElement(v27, {
            LayoutOrder = v54:getNextOrder()
        })
    });
end;
v36 = l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v20, 
    Localization = l_Localization_0, 
    MaterialServiceController = v21, 
    PluginController = v22, 
    Stylizer = l_Stylizer_0
})(v36);
return v3.connect(function(v68) --[[ Line: 249 ]]
    -- upvalues: v33 (copy)
    return {
        DEPRECATED_ActiveAsTool = if v33() then nil else v68.MaterialBrowserReducer.DEPRECATED_ActiveAsTool, 
        Material = v68.MaterialBrowserReducer.Material, 
        Path = v68.MaterialBrowserReducer.Path, 
        Search = v68.MaterialBrowserReducer.Search
    };
end, function(v69) --[[ Line: 258 ]]
    -- upvalues: v17 (copy)
    return {
        dispatchSetMaterialVariant = function(v70) --[[ Line: 260 ]] --[[ Name: dispatchSetMaterialVariant ]]
            -- upvalues: v69 (copy), v17 (ref)
            v69(v17(v70));
        end
    };
end)(l_withAbsoluteSize_0(v36));
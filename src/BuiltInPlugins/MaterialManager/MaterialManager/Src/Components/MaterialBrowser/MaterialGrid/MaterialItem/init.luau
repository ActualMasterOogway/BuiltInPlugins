local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v10 = require(l_Parent_0.Src.Actions.SetMaterial);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v12 = require(l_Constants_0.getFullMaterialType);
local v13 = require(l_Constants_0.getMaterialName);
local l_MaterialGrid_0 = l_Parent_0.Src.Components.MaterialBrowser.MaterialGrid;
local v15 = require(l_MaterialGrid_0.MaterialListItem);
local v16 = require(l_MaterialGrid_0.MaterialTileItem);
local v17 = v2.PureComponent:extend("MaterialItem");
v17.init = function(v18) --[[ Line: 43 ]] --[[ Name: init ]]
    v18.onClick = function() --[[ Line: 44 ]]
        -- upvalues: v18 (copy)
        local l_props_0 = v18.props;
        l_props_0.dispatchSetMaterial(l_props_0.MaterialItem);
    end;
    v18.onMouseEnter = function() --[[ Line: 50 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            hover = true
        });
    end;
    v18.onMouseLeave = function() --[[ Line: 56 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            hover = false
        });
    end;
    v18.applyToSelection = function() --[[ Line: 62 ]]
        -- upvalues: v18 (copy)
        local l_props_1 = v18.props;
        local l_MaterialItem_0 = l_props_1.MaterialItem;
        l_props_1.GeneralServiceController:ApplyToSelection(l_MaterialItem_0.Material, if l_MaterialItem_0.MaterialVariant then l_MaterialItem_0.MaterialVariant.Name else nil);
        l_props_1.Analytics:report("applyToSelectionAction");
    end;
    v18.state = {
        hover = false
    };
end;
v17.render = function(v22) --[[ Line: 78 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v13 (copy), v2 (copy), v15 (copy), v16 (copy)
    local l_props_2 = v22.props;
    local l_Localization_1 = l_props_2.Localization;
    local l_MaterialItem_1 = l_props_2.MaterialItem;
    local v26 = v12(l_MaterialItem_1, l_Localization_1);
    local l_MaterialVariant_0 = l_MaterialItem_1.MaterialVariant;
    local v28 = if not l_MaterialVariant_0 then l_Localization_1:getText("Materials", v13(l_MaterialItem_1.Material)) else l_MaterialVariant_0.Name;
    if l_props_2.ViewType == "List" then
        return v2.createElement(v15, {
            ApplyToSelection = v22.applyToSelection, 
            Hover = v22.state.hover, 
            LayoutOrder = l_props_2.LayoutOrder, 
            Material = l_MaterialItem_1, 
            MaterialDescription = v26, 
            MaterialName = v28, 
            MenuHover = l_props_2.MenuHover, 
            OnClick = v22.onClick, 
            OnMouseEnter = v22.onMouseEnter, 
            OnMouseLeave = v22.onMouseLeave, 
            Selected = l_props_2.Material == l_MaterialItem_1, 
            Status = l_props_2.MaterialStatus
        });
    else
        return v2.createElement(v16, {
            ApplyToSelection = v22.applyToSelection, 
            Hover = v22.state.hover, 
            LayoutOrder = l_props_2.LayoutOrder, 
            Material = l_MaterialItem_1, 
            MaterialDescription = v26, 
            MaterialName = v28, 
            MaterialTileSize = l_props_2.MaterialTileSize, 
            MenuHover = l_props_2.MenuHover, 
            OnClick = v22.onClick, 
            OnMouseEnter = v22.onMouseEnter, 
            OnMouseLeave = v22.onMouseLeave, 
            Selected = l_props_2.Material == l_MaterialItem_1, 
            Status = l_props_2.MaterialStatus
        });
    end;
end;
v17 = l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v8, 
    Localization = l_Localization_0
})(v17);
return v3.connect(function(v29, v30) --[[ Line: 130 ]]
    return {
        Material = v29.MaterialBrowserReducer.Material, 
        MaterialStatus = if not v30.MaterialItem.MaterialVariant then v29.MaterialBrowserReducer.MaterialStatus[v30.MaterialItem.Material] else nil, 
        MaterialTileSize = v29.MaterialBrowserReducer.MaterialTileSize, 
        MenuHover = v29.MaterialBrowserReducer.MenuHover, 
        ViewType = v29.MaterialBrowserReducer.ViewType
    };
end, function(v31) --[[ Line: 140 ]]
    -- upvalues: v10 (copy)
    return {
        dispatchSetMaterial = function(v32) --[[ Line: 142 ]] --[[ Name: dispatchSetMaterial ]]
            -- upvalues: v31 (copy), v10 (ref)
            v31(v10(v32));
        end
    };
end)(v17);
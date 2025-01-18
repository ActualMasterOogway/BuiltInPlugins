local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v4.ContextServices.withContext;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local v10 = require(l_Parent_0.Src.Resources.Constants.getViewTypes);
local _ = require(l_Parent_0.Src.Reducers.MainReducer);
local v12 = require(l_Parent_0.Src.Controllers.PluginController);
local v13 = require(l_Parent_0.Src.Components.MaterialBrowser.TopBar.ViewTypeButton);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v15 = require(l_Actions_0.SetMenuHover);
local v16 = require(l_Actions_0.SetViewType);
local v17 = v10();
local v18 = v2.PureComponent:extend("ViewTypeSelector");
v18.init = function(v19) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v13 (copy)
    v19.selectViewType = function(v20, _) --[[ Line: 46 ]]
        -- upvalues: v19 (copy)
        v19.props.dispatchSetViewType(v20);
        v19.props.dispatchSetMenuHover(false);
        v19.props.PluginController:setViewType(v20);
    end;
    v19.onRenderViewType = function(v22, v23, v24) --[[ Line: 53 ]]
        -- upvalues: v2 (ref), v13 (ref)
        return v2.createElement(v13, {
            LayoutOrder = v23, 
            OnClick = v24, 
            ViewType = v22
        });
    end;
    v19.onMouseEnter = function() --[[ Line: 61 ]]
        -- upvalues: v19 (copy)
        v19.props.dispatchSetMenuHover(true);
    end;
    v19.onMouseLeave = function() --[[ Line: 65 ]]
        -- upvalues: v19 (copy)
        v19.props.dispatchSetMenuHover(false);
    end;
end;
v18.render = function(v25) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_SelectInput_0 (copy), v17 (copy)
    local l_props_0 = v25.props;
    local l_ViewTypeButton_0 = l_props_0.Stylizer.ViewTypeButton;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_ViewTypeButton_0.ViewTypeSize
    }, {
        SelectInput = v2.createElement(l_SelectInput_0, {
            Icons = {
                l_ViewTypeButton_0.Grid, 
                l_ViewTypeButton_0.List
            }, 
            Items = {
                v17.Grid, 
                v17.List
            }, 
            HideText = true, 
            OnItemActivated = v25.selectViewType, 
            OnRenderItem = v25.onRenderViewType, 
            OnMouseEnter = v25.onMouseEnter, 
            OnMouseLeave = v25.onMouseLeave, 
            SelectedIndex = l_props_0.ViewType == v17.Grid and 1 or 2, 
            Size = l_ViewTypeButton_0.ViewTypeSize
        })
    });
end;
v18 = l_withContext_0({
    PluginController = v12, 
    Stylizer = l_Stylizer_0
})(v18);
return v3.connect(function(v28) --[[ Line: 103 ]]
    return {
        ViewType = v28.MaterialBrowserReducer.ViewType
    };
end, function(v29) --[[ Line: 107 ]]
    -- upvalues: v16 (copy), v15 (copy)
    return {
        dispatchSetViewType = function(v30) --[[ Line: 109 ]] --[[ Name: dispatchSetViewType ]]
            -- upvalues: v29 (copy), v16 (ref)
            v29(v16(v30));
        end, 
        dispatchSetMenuHover = function(v31) --[[ Line: 112 ]] --[[ Name: dispatchSetMenuHover ]]
            -- upvalues: v29 (copy), v15 (ref)
            v29(v15(v31));
        end
    };
end)(v18);
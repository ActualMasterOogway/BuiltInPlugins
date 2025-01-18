local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_join_0 = v4.Dash.join;
local l_withContext_0 = v4.ContextServices.withContext;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SplitPane_0 = l_UI_0.SplitPane;
local l_IconButton_0 = l_UI_0.IconButton;
local v14 = require(l_Parent_0.Src.Actions.SetMaterialBrowserLayout);
local v15 = require(l_Parent_0.Src.Controllers.PluginController);
local l_Components_0 = l_Parent_0.Src.Components;
local v17 = require(l_Components_0.MaterialBrowser.MaterialEditor);
local v18 = require(l_Components_0.MaterialBrowser.MaterialGrid);
local v19 = require(l_Components_0.MaterialBrowser.SideBar);
local v20 = require(l_Components_0.MaterialBrowser.TopBar);
local v21 = require(l_Parent_0.Src.Resources.Constants.getViewTypes)();
local l_Flags_0 = l_Parent_0.Src.Flags;
local v23 = require(l_Flags_0.getFFlagMaterialActionAsTool);
local v24 = v2.PureComponent:extend("MaterialBrowser");
v24.init = function(v25) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    v25.onHideButtonClicked = function() --[[ Line: 70 ]]
        -- upvalues: v25 (copy), l_join_0 (ref)
        local l_props_0 = v25.props;
        local v27 = l_join_0(l_props_0.MaterialBrowserLayout, {
            BaseShowSideBar = false, 
            OverrideShowSideBar = false, 
            SideBarWidth = 200
        });
        l_props_0.dispatchSetMaterialBrowserLayout(v27);
        l_props_0.PluginController:setMaterialBrowserLayout(v27);
    end;
    v25.onShowButtonClicked = function() --[[ Line: 82 ]]
        -- upvalues: v25 (copy), l_join_0 (ref)
        local l_props_1 = v25.props;
        local l_MaterialBrowser_0 = l_props_1.Stylizer.MaterialBrowser;
        local l_Material_0 = l_props_1.Material;
        local l_AbsoluteSize_0 = l_props_1.AbsoluteSize;
        local v32 = l_MaterialBrowser_0.MaterialTileWidth + l_MaterialBrowser_0.Padding * 2 + (if l_Material_0 then l_MaterialBrowser_0.MaterialEditorWidth else 0) + l_MaterialBrowser_0.MinSideBarWidth;
        local v33 = l_join_0(l_props_1.MaterialBrowserLayout, {
            BaseShowSideBar = true, 
            OverrideShowSideBar = v32 > l_AbsoluteSize_0.X
        });
        l_props_1.dispatchSetMaterialBrowserLayout(v33);
        l_props_1.PluginController:setMaterialBrowserLayout(v33);
    end;
    v25.setSideBarWidth = function(v34) --[[ Line: 101 ]]
        -- upvalues: v25 (copy), l_join_0 (ref)
        local l_props_2 = v25.props;
        local v36 = l_join_0(l_props_2.MaterialBrowserLayout, {
            SideBarWidth = v34
        });
        l_props_2.dispatchSetMaterialBrowserLayout(v36);
        l_props_2.PluginController:setMaterialBrowserLayout(v36);
    end;
end;
v24.render = function(v37) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v23 (copy), v21 (copy), v2 (copy), l_Pane_0 (copy), v19 (copy), l_IconButton_0 (copy), v18 (copy), v17 (copy), l_join_0 (copy), v20 (copy), l_SplitPane_0 (copy)
    local l_props_3 = v37.props;
    local l_MaterialBrowser_1 = l_props_3.Stylizer.MaterialBrowser;
    local v40 = l_LayoutOrderIterator_0.new();
    local l_Material_1 = l_props_3.Material;
    local l_MaterialBrowserLayout_0 = l_props_3.MaterialBrowserLayout;
    local l_BaseShowSideBar_0 = l_MaterialBrowserLayout_0.BaseShowSideBar;
    local v44 = true;
    local v45 = if v23() then l_Material_1 else l_Material_1 and not l_props_3.DEPRECATED_ActiveAsTool;
    local v46 = (if l_props_3.ViewType == v21.Grid then l_props_3.MaterialTileSize else l_MaterialBrowser_1.MaterialTileWidth) + l_MaterialBrowser_1.Padding * 2 + if v45 then l_MaterialBrowser_1.MaterialEditorWidth else 0;
    local v47 = v46 + l_MaterialBrowser_1.MinSideBarWidth;
    local v48 = v47 <= l_props_3.AbsoluteSize.X;
    if v45 then
        if l_props_3.AbsoluteSize.X < v46 then
            l_BaseShowSideBar_0 = false;
            v44 = false;
        elseif l_props_3.AbsoluteSize.X < v47 then
            if l_MaterialBrowserLayout_0.OverrideShowSideBar then
                v44 = false;
            else
                l_BaseShowSideBar_0 = false;
            end;
        end;
    elseif l_props_3.AbsoluteSize.X < v46 then
        if l_MaterialBrowserLayout_0.OverrideShowSideBar then
            v44 = false;
        else
            l_BaseShowSideBar_0 = false;
        end;
    end;
    local v49 = if l_BaseShowSideBar_0 then v2.createElement(l_Pane_0, {
        LayoutOrder = v40:getNextOrder(), 
        Size = if not v44 and v45 then l_MaterialBrowser_1.MaterialGridSize else UDim2.fromScale(1, 1)
    }, {
        SideBar = v2.createElement(v19, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        }), 
        HideButton = v2.createElement(l_IconButton_0, {
            Size = l_MaterialBrowser_1.IconSize, 
            LeftIcon = l_MaterialBrowser_1.HideIcon, 
            IconColor = l_MaterialBrowser_1.IconColor, 
            BorderColor = l_MaterialBrowser_1.BackgroundColor, 
            OnClick = v37.onHideButtonClicked, 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, -5, 1, -5), 
            ZIndex = 2
        })
    }) else nil;
    local v50 = if v44 then v2.createElement(v18, {
        LayoutOrder = v40:getNextOrder(), 
        Size = if not not v45 or not v48 and l_BaseShowSideBar_0 then l_MaterialBrowser_1.MaterialGridSize else UDim2.fromScale(1, 1), 
        OnShowButtonClicked = v37.onShowButtonClicked, 
        SideBarVisible = l_BaseShowSideBar_0
    }) else if l_BaseShowSideBar_0 then nil else v2.createElement(l_Pane_0, {
        BackgroundColor = l_MaterialBrowser_1.GridBackgroundColor, 
        LayoutOrder = v40:getNextOrder(), 
        Size = l_MaterialBrowser_1.MaterialGridSize
    });
    local v51 = if v45 then v2.createElement(v17, {
        LayoutOrder = v40:getNextOrder(), 
        Size = l_MaterialBrowser_1.MaterialEditorSize
    }) else nil;
    local v52 = l_props_3.AbsoluteSize.X - v46;
    local v53 = if l_MaterialBrowserLayout_0.SideBarWidth < v52 then l_MaterialBrowserLayout_0.SideBarWidth else v52;
    return v2.createElement(l_Pane_0, l_join_0({
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Size = UDim2.fromScale(1, 1)
    }, l_props_3.WrapperProps), {
        TopBar = v2.createElement(v20, {
            Size = l_MaterialBrowser_1.TopBarSize
        }), 
        MainView = if v48 and l_BaseShowSideBar_0 then v2.createElement(l_SplitPane_0, {
            ClampSize = true, 
            Sizes = {
                UDim.new(0, v53), 
                UDim.new(1, -v53)
            }, 
            Layout = Enum.FillDirection.Horizontal, 
            MinSizes = {
                UDim.new(0, l_MaterialBrowser_1.MinSideBarWidth), 
                UDim.new(0, v46)
            }, 
            OnSizesChange = function(v54) --[[ Line: 226 ]] --[[ Name: OnSizesChange ]]
                -- upvalues: v37 (copy)
                v37.setSideBarWidth(v54[1].Offset);
            end, 
            Size = l_MaterialBrowser_1.MainViewSize
        }, {
            v49, 
            v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v40:getNextOrder()
            }, {
                MaterialGrid = v50, 
                MaterialEditor = v51
            })
        }) else v2.createElement(l_Pane_0, {
            Size = l_MaterialBrowser_1.MainViewSize
        }, {
            MainView = v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v40:getNextOrder()
            }, {
                SideBar = v49, 
                MaterialGrid = v50, 
                MaterialEditor = v51
            })
        })
    });
end;
v24 = l_withContext_0({
    PluginController = v15, 
    Stylizer = l_Stylizer_0
})(v24);
return v3.connect(function(v55, _) --[[ Line: 263 ]]
    -- upvalues: v23 (copy)
    return {
        DEPRECATED_ActiveAsTool = if v23() then nil else v55.MaterialBrowserReducer.DEPRECATED_ActiveAsTool, 
        Material = v55.MaterialBrowserReducer.Material, 
        MaterialBrowserLayout = v55.MaterialBrowserReducer.MaterialBrowserLayout, 
        MaterialTileSize = v55.MaterialBrowserReducer.MaterialTileSize, 
        ViewType = v55.MaterialBrowserReducer.ViewType
    };
end, function(v57) --[[ Line: 273 ]]
    -- upvalues: v14 (copy)
    return {
        dispatchSetMaterialBrowserLayout = function(v58) --[[ Line: 275 ]] --[[ Name: dispatchSetMaterialBrowserLayout ]]
            -- upvalues: v57 (copy), v14 (ref)
            v57(v14(v58));
        end
    };
end)(l_withAbsoluteSize_0(v24));
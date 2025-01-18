local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.showContextMenu);
local v3 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v4 = require(l_Parent_0.UI.Components.Pane);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
local v6 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v6.withContext;
local v8 = v1.PureComponent:extend("ButtonContextMenuExample");
v8.init = function(v9) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v9.onClickedAction = function(v10) --[[ Line: 15 ]]
        print("Clicked action id", v10.Id);
    end;
    v9.onButtonClicked = function() --[[ Line: 19 ]]
        -- upvalues: v9 (copy), v2 (ref)
        local v11 = v9.props.Plugin:get();
        local v12 = {
            {
                Id = "Id1", 
                Text = "Action 1", 
                OnItemClicked = v9.onClickedAction
            }, 
            {
                Id = "Id2", 
                Text = "Action 2", 
                Checked = true, 
                OnItemClicked = v9.onClickedAction
            }, 
            {
                Id = "Id3", 
                Text = "Action 3 - Disabled", 
                Enabled = false, 
                OnItemClicked = v9.onClickedAction
            }, 
            {
                Id = "Id4", 
                Text = "Action 4 - icon", 
                Icon = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                OnItemClicked = v9.onClickedAction
            }, 
            {
                Text = "Action 5 - Auto generated id", 
                OnItemClicked = v9.onClickedAction
            }
        };
        v2(v11, v12);
    end;
end;
v8.render = function(v13) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.createElement(v3, {
        Style = "Round", 
        Text = "Click Me!", 
        Size = UDim2.fromOffset(120, 32), 
        OnClick = v13.onButtonClicked
    });
end;
v8 = l_withContext_0({
    Plugin = v6.Plugin
})(v8);
local v14 = v1.PureComponent:extend("PaneContextSubMenuExample");
v14.init = function(v15) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v15.onClickedAction = function(v16) --[[ Line: 73 ]]
        print("Clicked action: ", v16.Text);
    end;
    v15.onRightClick = function() --[[ Line: 77 ]]
        -- upvalues: v15 (copy), v2 (ref)
        local v17 = v15.props.Plugin:get();
        local v18 = {
            {
                Text = "Copy", 
                Icon = "rbxasset://textures/StudioToolbox/AssetConfig/copy_2x.png", 
                OnItemClicked = v15.onClickedAction
            }, 
            {
                ShowSeparator = true
            }, 
            {
                Text = "Formatting Options"; 
                {
                    Text = "Cut", 
                    Icon = "rbxasset://textures/DeveloperFramework/AssetPreview/close_button.png", 
                    OnItemClicked = v15.onClickedAction
                }, 
                {
                    Text = "Paste", 
                    OnItemClicked = v15.onClickedAction
                }
            }
        };
        v2(v17, v18);
    end;
end;
v14.render = function(v19) --[[ Line: 108 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy), v5 (copy)
    return v1.createElement(v4, {
        Style = "BorderBox", 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = UDim.new(0, 10), 
        Padding = 5, 
        OnRightClick = v19.onRightClick
    }, {
        v1.createElement(v5, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = "Right-click here to open context menu"
        })
    });
end;
v14 = l_withContext_0({
    Plugin = v6.Plugin
})(v14);
local v20 = v1.PureComponent:extend("OrderedContextMenuExample");
v20.init = function(v21) --[[ Line: 131 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v21.onClickedAction = function(v22) --[[ Line: 132 ]]
        print("Clicked action: ", v22.Text);
    end;
    v21.onButtonClicked = function() --[[ Line: 136 ]]
        -- upvalues: v21 (copy), v2 (ref)
        local v23 = v21.props.Plugin:get();
        local v24 = {
            idB = {
                Text = "B", 
                OnItemClicked = v21.onClickedAction
            }, 
            idD = {
                Text = "D", 
                OnItemClicked = v21.onClickedAction
            }, 
            idA = {
                Text = "A", 
                OnItemClicked = v21.onClickedAction
            }, 
            idC = {
                Text = "C", 
                OnItemClicked = v21.onClickedAction
            }, 
            idI = {
                Text = "I", 
                OnItemClicked = v21.onClickedAction
            }
        };
        local v25 = {
            "idA", 
            "idB", 
            "idC", 
            "idD", 
            "idI"
        };
        v24.idD.Enabled = false;
        v2(v23, v24, v25);
    end;
end;
v20.render = function(v26) --[[ Line: 155 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.createElement(v3, {
        Style = "Round", 
        Text = "Click Me!", 
        Size = UDim2.fromOffset(120, 32), 
        OnClick = v26.onButtonClicked
    });
end;
v20 = l_withContext_0({
    Plugin = v6.Plugin
})(v20);
return {
    stories = {
        {
            name = "Button with Context Menu", 
            story = v8
        }, 
        {
            name = "Context Menu with sub-menus", 
            story = v14
        }, 
        {
            name = "Menu with a specific order", 
            story = v20
        }
    }
};
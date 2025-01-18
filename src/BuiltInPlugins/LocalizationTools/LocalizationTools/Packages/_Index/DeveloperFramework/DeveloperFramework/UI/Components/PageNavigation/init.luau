local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v7 = require(l_Parent_0.UI.Components.Tooltip);
local v8 = require(l_Parent_0.UI.Components.Image);
local v9 = require(l_Parent_0.UI.Components.DEPRECATED_TextInput);
local v10 = require(l_Parent_0.UI.Components.TextLabel);
local v11 = require(l_Parent_0.Util.StyleModifier);
local v12 = require(l_Parent_0.Util.Typecheck);
local v13 = v1.PureComponent:extend("PageNavigation");
v12.wrap(v13, script);
v13.init = function(v14) --[[ Line: 36 ]] --[[ Name: init ]]
    v14.firstPage = function() --[[ Line: 37 ]]
        -- upvalues: v14 (copy)
        v14.pageChange(1);
    end;
    v14.nextPage = function() --[[ Line: 40 ]]
        -- upvalues: v14 (copy)
        v14.pageChange(v14.props.PageIndex + 1);
    end;
    v14.lastPage = function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy)
        v14.pageChange(v14.props.PageCount);
    end;
    v14.prevPage = function() --[[ Line: 46 ]]
        -- upvalues: v14 (copy)
        v14.pageChange(v14.props.PageIndex - 1);
    end;
    v14.textChanged = function(v15) --[[ Line: 49 ]]
        -- upvalues: v14 (copy)
        local v16 = tonumber(v15) or 1;
        v14.pageChange(v16);
    end;
    v14.pageChange = function(v17) --[[ Line: 53 ]]
        -- upvalues: v14 (copy)
        local v18 = math.clamp(v17, 1, v14.props.PageCount);
        if v18 ~= v14.props.PageIndex then
            v14.props.OnPageChange(v18);
        end;
    end;
end;
v13.render = function(v19) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v1 (copy), v5 (copy), v6 (copy), v7 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), v8 (copy), v10 (copy), v9 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_PageIndex_0 = l_props_0.PageIndex;
    local l_Localization_0 = v19.props.Localization;
    local v24 = l_PageIndex_0 == 1 and v11.Disabled or nil;
    local v25 = l_props_0.PageCount <= l_PageIndex_0 and v11.Disabled or nil;
    return v1.createElement(v5, {
        Padding = l_Stylizer_0.Padding, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = l_Stylizer_0.Spacing
    }, {
        First = v1.createElement(v6, {
            StyleModifier = v24, 
            Style = "RoundSubtle", 
            Size = UDim2.fromOffset(l_Stylizer_0.ButtonSize, l_Stylizer_0.ButtonSize), 
            LayoutOrder = 1, 
            OnClick = v19.firstPage
        }, {
            Tooltip = v1.createElement(v7, {
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "PageNavigation", "FirstPage")
            }), 
            Icon = v1.createElement(v8, {
                Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageColor3 = l_Stylizer_0.IconColor, 
                Image = "rbxasset://textures/DeveloperFramework/PageNavigation/button_control_start.png"
            })
        }), 
        Prev = v1.createElement(v6, {
            StyleModifier = v24, 
            Style = "RoundSubtle", 
            Size = UDim2.fromOffset(l_Stylizer_0.ButtonSize, l_Stylizer_0.ButtonSize), 
            LayoutOrder = 2, 
            OnClick = v19.prevPage
        }, {
            Tooltip = v1.createElement(v7, {
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "PageNavigation", "PreviousPage")
            }), 
            Icon = v1.createElement(v8, {
                Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageColor3 = l_Stylizer_0.IconColor, 
                Image = "rbxasset://textures/DeveloperFramework/PageNavigation/button_control_previous.png"
            })
        }), 
        Page = v1.createElement(v10, {
            Text = "Page", 
            LayoutOrder = 3, 
            AutomaticSize = Enum.AutomaticSize.XY
        }), 
        PageIndex = v1.createElement(v9, {
            LayoutOrder = 4, 
            Text = tostring(l_props_0.PageIndex), 
            OnTextChanged = v19.textChanged, 
            Style = "RoundedBorder", 
            Size = UDim2.new(0, l_Stylizer_0.InputWidth, 0, l_Stylizer_0.ButtonSize)
        }), 
        PageCount = v1.createElement(v10, {
            LayoutOrder = 5, 
            Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "PageNavigation", "PageCount", {
                count = l_props_0.PageCount
            }), 
            AutomaticSize = Enum.AutomaticSize.XY
        }), 
        Next = v1.createElement(v6, {
            StyleModifier = v25, 
            Style = "RoundSubtle", 
            Size = UDim2.fromOffset(l_Stylizer_0.ButtonSize, l_Stylizer_0.ButtonSize), 
            LayoutOrder = 6, 
            OnClick = v19.nextPage
        }, {
            Tooltip = v1.createElement(v7, {
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "PageNavigation", "NextPage")
            }), 
            Icon = v1.createElement(v8, {
                Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageColor3 = l_Stylizer_0.IconColor, 
                Image = "rbxasset://textures/DeveloperFramework/PageNavigation/button_control_next.png"
            })
        }), 
        Last = v1.createElement(v6, {
            StyleModifier = v25, 
            Style = "RoundSubtle", 
            Size = UDim2.fromOffset(l_Stylizer_0.ButtonSize, l_Stylizer_0.ButtonSize), 
            LayoutOrder = 7, 
            OnClick = v19.lastPage
        }, {
            Tooltip = v1.createElement(v7, {
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "PageNavigation", "LastPage")
            }), 
            Icon = v1.createElement(v8, {
                Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageColor3 = l_Stylizer_0.IconColor, 
                Image = "rbxasset://textures/DeveloperFramework/PageNavigation/button_control_end.png"
            })
        })
    });
end;
return (l_withContext_0({
    Localization = v2.Localization, 
    Stylizer = v2.Stylizer
})(v13));
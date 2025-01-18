local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.ContextServices);
local v3 = require(l_Parent_0.Style.Colors);
local v4 = require(l_Parent_0.Style.Themes.BaseTheme);
local v5 = require(l_Parent_0.Style.Themes.StudioTheme);
local v6 = require(l_Parent_0.Style.ComponentSymbols);
local v7 = require(l_Parent_0.UI.Components.ExpandablePane);
local v8 = require(l_Parent_0.UI.Components.Image);
local v9 = require(l_Parent_0.UI.Components.LinkText);
local v10 = require(l_Parent_0.UI.Components.Pane);
local v11 = require(l_Parent_0.UI.Components.ExpandablePane.SimpleExpandablePane);
local v12 = require(l_Parent_0.UI.Components.TextLabel);
local v13 = require(l_Parent_0.UI.Components.UIFolderData);
local v14 = require(v13.ExpandablePane.style);
local v15 = require(l_Parent_0.Util.StyleModifier);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v17 = v14["&BorderBox"];
local l_Header_0 = v14.Header;
local v19 = v5.new();
v19:extend({
    [v6.ExpandablePane] = l_join_0(v4[v6.ExpandablePane], {
        ["&CustomStyle"] = l_join_0(v17, {
            Background = v3.darker(v3.Blue_Dark, 0.5), 
            BorderColor = v3.Blue, 
            Header = l_join_0(l_Header_0, {
                Arrow = {
                    Color = v3.White, 
                    Image = "rbxasset://textures/DeveloperFramework/Favorites/star_stroke.png", 
                    Size = UDim2.fromOffset(14, 14), 
                    [v15.Selected] = {
                        Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png"
                    }
                }, 
                Height = 50
            })
        })
    })
});
local v20 = v1.PureComponent:extend("ExpandedChangedStory");
v20.init = function(v21) --[[ Line: 52 ]] --[[ Name: init ]]
    v21.state = {
        expanded = false, 
        expandedCount = 0
    };
    v21.expandedChanged = function() --[[ Line: 58 ]]
        -- upvalues: v21 (copy)
        v21:setState(function(v22) --[[ Line: 59 ]]
            local v23 = not v22.expanded;
            local l_expandedCount_0 = v22.expandedCount;
            if v23 then
                l_expandedCount_0 = l_expandedCount_0 + 1;
            end;
            return {
                expanded = v23, 
                expandedCount = l_expandedCount_0
            };
        end);
    end;
end;
v20.render = function(v25) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v7 (copy), v12 (copy)
    return v1.createElement(v7, {
        Expanded = v25.state.expanded, 
        OnExpandedChanged = v25.expandedChanged, 
        Text = "OnExpandedChanged"
    }, {
        v1.createElement(v12, {
            Text = "This has an OnExpandedChanged callback", 
            [v1.Tag] = "X-FitY"
        }), 
        v1.createElement(v12, {
            Text = string.format("Expanded %d times", v25.state.expandedCount), 
            [v1.Tag] = "X-FitY"
        })
    });
end;
CustomHeader = function(v26) --[[ Line: 90 ]] --[[ Name: CustomHeader ]]
    -- upvalues: v1 (copy), v10 (copy), l_join_0 (copy), v8 (copy), v9 (copy)
    return v1.createElement(v10, l_join_0({
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = 8
    }, v26), {
        Icon = v1.createElement(v8, {
            LayoutOrder = 1, 
            Image = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png", 
            Size = UDim2.fromOffset(20, 20)
        }), 
        Link = v1.createElement(v9, {
            LayoutOrder = 2, 
            OnClick = function() --[[ Line: 106 ]] --[[ Name: OnClick ]]
                print("Link clicked");
            end, 
            Text = "1 warning"
        })
    });
end;
return {
    stories = {
        {
            name = "Default", 
            story = v1.createElement(v11, {
                Text = "Title"
            }, {
                v1.createElement(v12, {
                    Text = "This has the Default style", 
                    [v1.Tag] = "X-Fit"
                })
            })
        }, 
        {
            name = "OnExpandedChanged", 
            story = v20
        }, 
        {
            name = "Pane Styles", 
            story = v1.createElement(v10, {
                [v1.Tag] = "Muted X-FitY X-ColumnM X-Pad"
            }, {
                Box = v1.createElement(v11, {
                    LayoutOrder = 1, 
                    Style = "Box", 
                    Text = "Box"
                }, {
                    v1.createElement(v12, {
                        Text = "This has a Box style", 
                        [v1.Tag] = "X-Fit"
                    })
                }), 
                RoundBox = v1.createElement(v11, {
                    LayoutOrder = 2, 
                    Style = "RoundBox", 
                    Text = "RoundBox"
                }, {
                    v1.createElement(v12, {
                        Text = "This has a RoundBox style", 
                        [v1.Tag] = "X-Fit"
                    })
                }), 
                BorderBox = v1.createElement(v11, {
                    LayoutOrder = 3, 
                    Style = "BorderBox", 
                    Text = "BorderBox"
                }, {
                    v1.createElement(v12, {
                        Text = "This has a BorderBox style", 
                        [v1.Tag] = "X-Fit"
                    })
                })
            })
        }, 
        {
            name = "Other Styles", 
            story = v1.createElement(v10, {
                [v1.Tag] = "Muted X-FitY X-ColumnM X-Pad"
            }, {
                Section = v1.createElement(v11, {
                    LayoutOrder = 1, 
                    Style = "Section", 
                    Text = "Section"
                }, {
                    v1.createElement(v12, {
                        Text = "This has a Section style", 
                        [v1.Tag] = "X-Fit"
                    })
                })
            })
        }, 
        {
            name = "Custom Header", 
            story = v1.createElement(v11, {
                HeaderComponent = CustomHeader, 
                Style = "BorderBox", 
                Text = "Title"
            }, {
                v1.createElement(v12, {
                    Text = "This has a custom HeaderComponent", 
                    [v1.Tag] = "X-Fit"
                })
            })
        }, 
        {
            name = "Custom Style", 
            summary = "Custom header Height, Arrow style, BackgroundColor and BorderColor.", 
            story = v2.provide({
                v19
            }, {
                v1.createElement(v11, {
                    Style = "CustomStyle", 
                    Text = "Title"
                }, {
                    v1.createElement(v12, {
                        Text = "This has a custom style", 
                        [v1.Tag] = "X-Fit"
                    })
                })
            })
        }, 
        {
            name = "Always Expanded", 
            summary = "Can't collapse pane and arrow is hidden.", 
            story = v1.createElement(v11, {
                AlwaysExpanded = true, 
                Style = "Section", 
                Text = "Section"
            }, {
                v1.createElement(v12, {
                    Text = "This pane will stay open", 
                    [v1.Tag] = "X-Fit"
                })
            })
        }
    }
};
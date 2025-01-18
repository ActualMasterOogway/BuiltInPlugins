local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkShimmerImprovements);
local v4 = require(l_Parent_0.UI.ContextServices);
local l_Style_0 = l_Parent_0.Style;
local v6 = require(l_Style_0.ComponentSymbols);
local v7 = require(l_Style_0.Colors);
local v8 = require(l_Style_0.StyleKey);
local v9 = require(l_Style_0.ThemeSwitcher);
local v10 = require(l_Style_0.Themes.BaseTheme);
local l_Components_0 = l_Parent_0.UI.Components;
local v12 = require(l_Components_0.Pane);
local v13 = require(l_Components_0.Shimmer);
local l_join_0 = v1.join;
local v15 = {
    [v8.ShimmerContent] = v7.Gray_Mid
};
local v16 = {
    [v8.ShimmerContent] = v7.Gray_Lightest
};
local v17 = v9.new(v15, v16);
v17:extend({
    [v6.Pane] = l_join_0(v10[v6.Pane], {
        ["&PlaceholderContent"] = {
            Background = v8.ShimmerContent, 
            CornerRadius = UDim.new(0, 4)
        }
    })
});
local v18 = v2.Component:extend("RenderLater");
v18.didMount = function(v19) --[[ Line: 41 ]] --[[ Name: didMount ]]
    v19.summonTask = task.delay(v19.delay, function() --[[ Line: 42 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            mounted = true
        });
    end);
end;
v18.willUnmount = function(v20) --[[ Line: 47 ]] --[[ Name: willUnmount ]]
    task.cancel(v20.summonTask);
end;
v18.render = function(v21) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    if v21.state.mounted then
        return v2.createFragment(v21.props.children);
    else
        return nil;
    end;
end;
if v3() then
    return {
        stories = {
            {
                name = "Shimmer", 
                story = v2.createElement(v13, {
                    CornerRadius = 4, 
                    Size = UDim2.fromOffset(128, 128)
                })
            }, 
            {
                name = "Content Placeholder", 
                summary = "Multiple shimmers can be combined to create a placeholder for loading content", 
                story = v4.provide({
                    v17
                }, {
                    Story = v2.createElement(v12, {
                        Size = UDim2.fromOffset(256, 128), 
                        Style = "PlaceholderContent"
                    }, {
                        UICorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        }), 
                        ImagePlaceholder = v2.createElement(v13, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            CornerRadius = UDim.new(0.5, 0), 
                            Position = UDim2.new(0, 16, 0.5, 0), 
                            Size = UDim2.fromOffset(80, 80)
                        }), 
                        TextPlaceholder1 = v2.createElement(v13, {
                            AnchorPoint = Vector2.new(1, 0.5), 
                            CornerRadius = 6, 
                            Position = UDim2.new(1, -16, 0.33, 0), 
                            Size = UDim2.fromOffset(128, 24)
                        }), 
                        TextPlaceholder2 = v2.createElement(v13, {
                            AnchorPoint = Vector2.new(1, 0.5), 
                            CornerRadius = 6, 
                            Position = UDim2.new(1, -16, 0.66, 0), 
                            Size = UDim2.fromOffset(128, 24)
                        })
                    })
                })
            }
        }
    };
else
    return {
        stories = {
            {
                name = "Shimmer", 
                story = v2.createElement(v13, {
                    Size = UDim2.fromOffset(200, 200)
                })
            }, 
            {
                name = "Multiple shimmers, deferred", 
                story = v2.createElement(v12, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Spacing = 10, 
                    Layout = Enum.FillDirection.Horizontal
                }, {
                    Shimmer1 = v2.createElement(v13, {
                        Size = UDim2.fromOffset(200, 200)
                    }), 
                    Shimmer2 = v2.createElement(v18, {
                        delay = 2
                    }, {
                        Shimmer = v2.createElement(v13, {
                            Size = UDim2.fromOffset(200, 200)
                        })
                    })
                })
            }
        }
    };
end;
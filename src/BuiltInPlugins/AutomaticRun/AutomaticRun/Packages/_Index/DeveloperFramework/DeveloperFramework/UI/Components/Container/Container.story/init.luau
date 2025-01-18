local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local v3 = require(l_Parent_0.UI.Components.Container);
local v4 = require(l_Parent_0.UI.Components.Box);
local v5 = require(l_Parent_0.UI.Components.Image);
local v6 = require(l_Parent_0.UI.Components.Pane);
local v7 = require(l_Parent_0.Style.ComponentSymbols);
local v8 = require(l_Parent_0.Style.Themes.BaseTheme);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v10 = require(l_Parent_0.Style.ThemeSwitcher).new();
v10:extend({
    [v7.Box] = l_join_0(v8[v7.Box], {
        Transparency = 0, 
        BorderSize = 0, 
        ["&Black"] = {
            Color = Color3.new(0, 0, 0)
        }, 
        ["&Red"] = {
            Color = Color3.new(0.3, 0, 0)
        }
    }), 
    [v7.Image] = l_join_0(v8[v7.Image], {
        ["&WarningIcon"] = {
            Image = "rbxasset://textures/ui/ErrorIcon.png"
        }
    })
});
return function() --[[ Line: 40 ]]
    -- upvalues: v2 (copy), v10 (copy), v1 (copy), v6 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v2.provide({
        v10
    }, {
        Main = v1.createElement(v6, {
            Padding = 20, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = Color3.fromRGB(128, 128, 128)
        }, {
            RedElement = v1.createElement(v3, {
                Size = UDim2.new(1, 0, 0, 100), 
                Padding = {
                    Right = 20
                }, 
                Background = v4, 
                BackgroundStyle = "Red"
            }, {
                Image = v1.createElement(v3, {
                    Size = UDim2.fromOffset(80, 80), 
                    Position = UDim2.fromScale(1, 0.5), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Background = v5, 
                    BackgroundStyle = "WarningIcon"
                }), 
                TextContainer = v1.createElement(v3, {
                    Padding = {
                        Left = 40
                    }
                }, {
                    Text = v1.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = "This is test text.", 
                        Font = Enum.Font.SourceSans, 
                        TextSize = 24, 
                        TextColor3 = Color3.new(1, 1, 1)
                    })
                })
            })
        })
    });
end;
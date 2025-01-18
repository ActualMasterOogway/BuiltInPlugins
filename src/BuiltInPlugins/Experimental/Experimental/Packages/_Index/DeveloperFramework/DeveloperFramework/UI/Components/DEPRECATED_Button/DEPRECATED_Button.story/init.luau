local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local v3 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v4 = require(l_Parent_0.UI.Components.Pane);
local v5 = require(l_Parent_0.UI.Components.HoverArea);
local v6 = require(l_Parent_0.UI.Components.Image);
local v7 = require(l_Parent_0.Style.ComponentSymbols);
local v8 = require(l_Parent_0.Style.ThemeSwitcher);
local v9 = require(l_Parent_0.Style.Themes.BaseTheme);
local v10 = require(l_Parent_0.Util.StyleModifier);
local v11 = require(l_Parent_0.Style.StyleKey);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v13 = v8.new();
v13:extend({
    [v7.Image] = l_join_0(v9[v7.Image], {
        ["&Settings"] = {
            Image = "rbxasset://textures/AnimationEditor/btn_manage.png", 
            Color = v11.MainText, 
            Size = UDim2.fromOffset(24, 24)
        }, 
        ["&SettingsPrimary"] = {
            Color = v11.DialogMainButtonText
        }
    })
});
local function v14() --[[ Line: 36 ]] --[[ Name: printClicked ]]
    print("Clicked");
end;
local v21 = {
    controls = {
        isDisabled = false
    }, 
    stories = {
        Round = function(v15) --[[ Line: 46 ]] --[[ Name: Round ]]
            -- upvalues: v2 (copy), v13 (copy), v1 (copy), v3 (copy), v10 (copy), v14 (copy), v5 (copy)
            return v2.provide({
                v13
            }, {
                Child = v1.createElement(v3, {
                    Style = "Round", 
                    Text = "Cancel", 
                    StyleModifier = if v15.controls.isDisabled then v10.Disabled else nil, 
                    Size = UDim2.fromOffset(120, 32), 
                    LayoutOrder = 2, 
                    OnClick = v14
                }, {
                    v1.createElement(v5, {
                        Cursor = "PointingHand"
                    })
                })
            });
        end, 
        RoundSubtle = function(v16) --[[ Line: 62 ]] --[[ Name: RoundSubtle ]]
            -- upvalues: v2 (copy), v13 (copy), v1 (copy), v3 (copy), v10 (copy), v14 (copy), v5 (copy)
            return v2.provide({
                v13
            }, {
                Child = v1.createElement(v3, {
                    Style = "RoundSubtle", 
                    Text = "Save", 
                    StyleModifier = if v16.controls.isDisabled then v10.Disabled else nil, 
                    Size = UDim2.fromOffset(120, 32), 
                    LayoutOrder = 3, 
                    OnClick = v14
                }, {
                    v1.createElement(v5, {
                        Cursor = "PointingHand"
                    })
                })
            });
        end, 
        RoundPrimary = function(v17) --[[ Line: 77 ]] --[[ Name: RoundPrimary ]]
            -- upvalues: v2 (copy), v13 (copy), v1 (copy), v3 (copy), v10 (copy), v14 (copy), v5 (copy)
            return v2.provide({
                v13
            }, {
                Child = v1.createElement(v3, {
                    Style = "RoundPrimary", 
                    Text = "Save", 
                    StyleModifier = if v17.controls.isDisabled then v10.Disabled else nil, 
                    Size = UDim2.fromOffset(120, 32), 
                    LayoutOrder = 3, 
                    OnClick = v14
                }, {
                    v1.createElement(v5, {
                        Cursor = "PointingHand"
                    })
                })
            });
        end, 
        CloseButton = function(v18) --[[ Line: 93 ]] --[[ Name: CloseButton ]]
            -- upvalues: v2 (copy), v13 (copy), v1 (copy), v3 (copy), v10 (copy), v14 (copy)
            return v2.provide({
                v13
            }, {
                Child = v1.createElement(v3, {
                    Style = "Close", 
                    StyleModifier = if v18.controls.isDisabled then v10.Disabled else nil, 
                    Size = UDim2.fromOffset(22, 22), 
                    LayoutOrder = 1, 
                    OnClick = v14
                })
            });
        end, 
        RoundPrimaryWithImage = function(v19) --[[ Line: 107 ]] --[[ Name: RoundPrimaryWithImage ]]
            -- upvalues: v2 (copy), v13 (copy), v1 (copy), v3 (copy), v10 (copy), v14 (copy), v6 (copy)
            return v2.provide({
                v13
            }, {
                Child = v1.createElement(v3, {
                    Style = "Round", 
                    StyleModifier = if v19.controls.isDisabled then v10.Disabled else nil, 
                    Size = UDim2.fromOffset(24, 24), 
                    LayoutOrder = 3, 
                    OnClick = v14
                }, {
                    Settings = v1.createElement(v6, {
                        Style = "Settings"
                    })
                })
            });
        end, 
        RoundWithImage = function(v20) --[[ Line: 124 ]] --[[ Name: RoundWithImage ]]
            -- upvalues: v2 (copy), v13 (copy), v1 (copy), v3 (copy), v10 (copy), v14 (copy), v4 (copy), v6 (copy)
            return v2.provide({
                v13
            }, {
                Child = v1.createElement(v3, {
                    Style = "RoundPrimary", 
                    StyleModifier = if v20.controls.isDisabled then v10.Disabled else nil, 
                    Size = UDim2.fromOffset(120, 32), 
                    LayoutOrder = 4, 
                    OnClick = v14
                }, {
                    Pane = v1.createElement(v4, {
                        Layout = Enum.FillDirection.Horizontal, 
                        Padding = {
                            Left = 10, 
                            Right = 5
                        }
                    }, {
                        Settings = v1.createElement(v6, {
                            Style = "Settings", 
                            LayoutOrder = 1
                        }), 
                        Text = v1.createElement("TextLabel", {
                            LayoutOrder = 2, 
                            Text = "Settings", 
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromScale(1, 1), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Font = Enum.Font.SourceSans, 
                            TextSize = 18, 
                            TextColor3 = Color3.new(1, 1, 1)
                        })
                    })
                })
            });
        end
    }
};
v21.stories.RoundWithIcon = function(v22) --[[ Line: 162 ]]
    -- upvalues: v2 (copy), v13 (copy), v1 (copy), v3 (copy), v10 (copy), v14 (copy)
    return v2.provide({
        v13
    }, {
        Child = v1.createElement(v3, {
            Icon = "rbxasset://textures/AnimationEditor/btn_manage.png", 
            Style = "Round", 
            StyleModifier = if v22.controls.isDisabled then v10.Disabled else nil, 
            Size = UDim2.fromOffset(24, 24), 
            LayoutOrder = 3, 
            OnClick = v14, 
            Text = "Settings"
        })
    });
end;
return v21;
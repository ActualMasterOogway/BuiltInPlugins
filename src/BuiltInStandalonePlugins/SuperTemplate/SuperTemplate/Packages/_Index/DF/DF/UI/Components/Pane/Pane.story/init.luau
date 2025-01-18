local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.Components.TextLabel);
local v3 = require(l_Parent_0.UI.Components.Pane);
local l_useState_0 = v1.useState;
local v5 = Color3.new(0, 1, 0);
local v6 = Color3.new(0, 0, 0);
local function _() --[[ Line: 10 ]] --[[ Name: counter ]]
    local v7 = -1;
    return function() --[[ Line: 12 ]]
        -- upvalues: v7 (ref)
        v7 = v7 + 1;
        return v7;
    end;
end;
return function() --[[ Line: 18 ]]
    -- upvalues: l_useState_0 (copy), v1 (copy), v3 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v9, v10 = l_useState_0(false);
    local v11, v12 = l_useState_0(false);
    local v13 = -1;
    local v14;
    do
        local l_v13_0 = v13;
        v14 = function() --[[ Line: 12 ]]
            -- upvalues: l_v13_0 (ref)
            l_v13_0 = l_v13_0 + 1;
            return l_v13_0;
        end;
    end;
    return v1.createElement(v3, {
        [v1.Tag] = "X-ColumnM X-Fit X-Pad"
    }, {
        Default = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has the Default style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Paper = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Paper X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has Paper style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Main = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Main X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has Main style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Muted = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Muted X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has Muted style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Contrast = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Contrast X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has Contrast style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Corner = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Main X-Corner X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has Main X-Corner style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        PrimaryBrand = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "PrimaryBrand X-Corner X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a PrimaryBrand X-Corner style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Primary = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Primary X-Corner X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a Primary X-Corner style", 
                [v1.Tag] = "X-Fit Contrast"
            })
        }), 
        Secondary = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Secondary X-Corner X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a Secondary X-Corner style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Border = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Main X-Stroke X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a Main X-Stroke style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        RoundBorder = v1.createElement(v3, {
            LayoutOrder = v14(), 
            [v1.Tag] = "Main X-Stroke X-Corner X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a Main X-Stroke X-Corner style", 
                [v1.Tag] = "X-Fit"
            })
        }), 
        CustomColors = v1.createElement(v3, {
            BackgroundColor3 = Color3.fromRGB(255, 200, 200), 
            BorderColor3 = Color3.fromRGB(255, 100, 0), 
            LayoutOrder = v14(), 
            [v1.Tag] = "Main Border X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a Main Border style with custom colors", 
                TextColor = Color3.fromRGB(0, 0, 0), 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Pressable = v1.createElement(v3, {
            BackgroundColor = v9 and v5 or nil, 
            OnPress = function() --[[ Line: 138 ]] --[[ Name: OnPress ]]
                -- upvalues: v10 (copy)
                v10(true);
            end, 
            LayoutOrder = v14(), 
            [v1.Tag] = "Main Border X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a Main Border style and an OnPress callback.\n\nPress me!", 
                TextColor = v9 and v6 or nil, 
                [v1.Tag] = "X-Fit"
            })
        }), 
        Clickable = v1.createElement(v3, {
            LayoutOrder = v14(), 
            BackgroundColor3 = v11 and v5 or nil, 
            OnClick = function() --[[ Line: 153 ]] --[[ Name: OnClick ]]
                -- upvalues: v12 (copy)
                v12(true);
            end, 
            [v1.Tag] = "Main Border X-Fit X-Pad"
        }, {
            Label = v1.createElement(v2, {
                Text = "This pane has a Main Border style and an OnClick callback.\n\nClick me!", 
                TextColor = v11 and v6 or nil, 
                [v1.Tag] = "X-Fit"
            })
        })
    });
end;
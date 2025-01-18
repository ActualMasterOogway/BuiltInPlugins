local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local v4 = require(l_script_FirstAncestor_0.Components.Text);
local v5 = require(l_script_FirstAncestor_0.Enums.ControlState);
local function v7(v6) --[[ Line: 10 ]] --[[ Name: Story ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    return v2.createElement(v3, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        GroupTransparency = v6.GroupTransparency, 
        padding = 10, 
        stroke = {
            Color = Color3.new(1, 1, 1), 
            Transparency = 0.3, 
            Thickness = 2
        }
    }, {
        v2.createElement(v3, {
            Size = UDim2.new(0, 100, 0, 100), 
            backgroundStyle = {
                Transparency = 0.8, 
                Color3 = Color3.new(1, 1, 1)
            }, 
            tag = "row align-x-center align-y-center"
        }, {
            v2.createElement(v4, {
                textStyle = {
                    Color3 = Color3.new(1, 1, 1)
                }, 
                fontStyle = {
                    Font = Enum.Font.BuilderSansMedium, 
                    FontSize = 24, 
                    LineHeight = 1
                }, 
                Text = "View"
            })
        })
    });
end;
local function v13(v8) --[[ Line: 44 ]] --[[ Name: StoryGuiState ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v9, v10 = v2.useBinding(v5.Initialize);
    return v2.createElement(v3, {
        Size = UDim2.new(0, 120, 0, 120), 
        LayoutOrder = 2, 
        GroupTransparency = v8.GroupTransparency, 
        backgroundStyle = {
            Transparency = 0, 
            Color3 = Color3.fromRGB(120, 0, 180)
        }, 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, 
        onStateChanged = function(v11) --[[ Line: 47 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v10 (copy)
            v10(v11);
        end
    }, {
        v2.createElement(v4, {
            textStyle = {
                Color3 = Color3.new(1, 1, 1)
            }, 
            Text = v9:map(function(v12) --[[ Line: 70 ]]
                return (tostring(v12));
            end)
        })
    });
end;
return {
    summary = "View", 
    stories = {
        Basic = {
            name = "Basic Use", 
            story = function(v14) --[[ Line: 82 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v3 (copy), v7 (copy), v13 (copy)
                local l_transparency_0 = v14.controls.transparency;
                return v2.createElement(v3, {
                    tag = "auto-xy row gap-large"
                }, {
                    Basic = v2.createElement(v7, {
                        GroupTransparency = l_transparency_0
                    }), 
                    GuiState = v2.createElement(v13, {
                        GroupTransparency = l_transparency_0
                    })
                });
            end
        }
    }, 
    controls = {
        transparency = {
            0, 
            0.25, 
            0.75
        }
    }
};
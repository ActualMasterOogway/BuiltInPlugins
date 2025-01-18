local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Components.Text);
local v6 = require(l_script_FirstAncestor_0.Enums.ControlState);
return {
    summary = "Image", 
    stories = {
        {
            name = "Basic Image", 
            story = function(_) --[[ Line: 11 ]] --[[ Name: Story ]]
                -- upvalues: v2 (copy), v3 (copy)
                return v2.createElement(v3, {
                    Image = "icons/graphic/success_xlarge", 
                    tag = "size-2800"
                });
            end
        }, 
        {
            name = "Basic Asset Use", 
            story = function(_) --[[ Line: 18 ]] --[[ Name: AssetStory ]]
                -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
                return v2.createElement(v4, {
                    backgroundStyle = {
                        Transparency = 0.5
                    }, 
                    tag = "col gap-large auto-xy padding-small"
                }, v2.createElement(v3, {
                    Image = "rbxassetid://7229442422", 
                    backgroundStyle = {
                        Transparency = 0, 
                        Color3 = Color3.fromRGB(255, 255, 255)
                    }, 
                    tag = "size-2800"
                }), v2.createElement(v3, {
                    Image = "component_assets/circle_22_stroke_3", 
                    slice = {
                        center = Rect.new(11, 11, 12, 12)
                    }, 
                    backgroundStyle = {
                        Transparency = 1, 
                        Color3 = Color3.fromRGB(255, 255, 255)
                    }, 
                    tag = "size-2800-800 col align-x-center align-y-center"
                }, v2.createElement(v5, {
                    Text = "Slice Center", 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    textStyle = {
                        Color3 = Color3.fromRGB(255, 255, 255)
                    }
                })));
            end
        }, 
        {
            name = "GUI State Use", 
            story = function(_) --[[ Line: 59 ]] --[[ Name: StoryGuiState ]]
                -- upvalues: v2 (copy), v6 (copy), v3 (copy)
                local v10, v11 = v2.useBinding(v6.Initialize);
                return v2.createElement(v3, {
                    Image = v10:map(function(v12) --[[ Line: 67 ]]
                        -- upvalues: v6 (ref)
                        if v12 == v6.Default then
                            return "rbxthumb://type=Asset&id=23155839&w=420&h=420";
                        elseif v12 == v6.Hover then
                            return "rbxthumb://type=Asset&id=23155842&w=420&h=420";
                        elseif v12 == v6.Pressed then
                            return "rbxthumb://type=Asset&id=23155847&w=420&h=420";
                        else
                            return "rbxthumb://type=Asset&id=23155833&w=420&h=420";
                        end;
                    end), 
                    backgroundStyle = {
                        Transparency = 0, 
                        Color3 = Color3.fromRGB(120, 0, 180)
                    }, 
                    tag = "col align-x-center align-y-center size-2800", 
                    onStateChanged = function(v13) --[[ Line: 62 ]] --[[ Name: onStateChanged ]]
                        -- upvalues: v11 (copy)
                        v11(v13);
                    end
                });
            end
        }
    }
};
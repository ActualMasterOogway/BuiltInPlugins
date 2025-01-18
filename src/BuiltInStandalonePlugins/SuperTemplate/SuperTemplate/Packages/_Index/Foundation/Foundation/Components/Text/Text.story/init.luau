local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Text);
local v4 = require(l_script_FirstAncestor_0.Enums.ControlState);
return {
    summary = "Text", 
    stories = {
        {
            name = "Basic Text", 
            story = function(v5) --[[ Line: 8 ]] --[[ Name: Story ]]
                -- upvalues: v2 (copy), v3 (copy)
                return v2.createElement(v3, {
                    Text = v5.controls.text, 
                    fontStyle = {
                        FontSize = v5.controls.textSize
                    }, 
                    tag = "auto-xy content-default"
                });
            end
        }, 
        {
            name = "GUI State Use", 
            story = function(_) --[[ Line: 18 ]] --[[ Name: StoryGuiState ]]
                -- upvalues: v2 (copy), v4 (copy), v3 (copy)
                local v7, v8 = v2.useBinding(v4.Initialize);
                return v2.createElement(v3, {
                    Text = v7:map(function(v9) --[[ Line: 26 ]]
                        return "State: " .. v9;
                    end), 
                    fontStyle = {
                        FontSize = 20
                    }, 
                    backgroundStyle = {
                        Transparency = 0, 
                        Color3 = Color3.fromRGB(120, 0, 180)
                    }, 
                    tag = "col align-x-center align-y-center size-2800 content-default", 
                    onStateChanged = function(v10) --[[ Line: 21 ]] --[[ Name: onStateChanged ]]
                        -- upvalues: v8 (copy)
                        v8(v10);
                    end
                });
            end
        }
    }, 
    controls = {
        text = "Hello, world!", 
        textSize = 24
    }
};
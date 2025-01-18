local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Interactable);
local v4 = require(l_script_FirstAncestor_0.Components.Text);
local v5 = require(l_script_FirstAncestor_0.Enums.ControlState);
return {
    summary = "View", 
    stories = {
        BasicStory = {
            name = "GUI State Use", 
            story = function(_) --[[ Line: 9 ]] --[[ Name: Story ]]
                -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
                local v7, v8 = v2.useBinding(v5.Initialize);
                return v2.createElement(v3, {
                    Size = UDim2.new(0, 100, 0, 100), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = Color3.fromRGB(20, 110, 20), 
                    onStateChanged = function(v9) --[[ Line: 12 ]] --[[ Name: onStateChanged ]]
                        -- upvalues: v8 (copy)
                        v8(v9);
                    end
                }, {
                    v2.createElement(v4, {
                        Text = v7:map(function(v10) --[[ Line: 23 ]]
                            return (tostring(v10));
                        end), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        textStyle = {
                            Color3 = Color3.fromRGB(255, 255, 255)
                        }
                    })
                });
            end
        }
    }
};
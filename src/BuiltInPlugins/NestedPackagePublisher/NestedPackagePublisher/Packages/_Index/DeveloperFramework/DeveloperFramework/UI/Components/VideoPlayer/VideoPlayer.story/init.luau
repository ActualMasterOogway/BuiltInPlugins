local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.Immutable);
local v3 = require(l_Parent_0.Examples.renderStories);
local v4 = require(script.Parent.stories);
return function() --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), v2 (copy)
    return v3(v4, {
        storyRenderer = function(v5, v6) --[[ Line: 12 ]] --[[ Name: storyRenderer ]]
            -- upvalues: v1 (ref), v2 (ref)
            return v1.createElement("Frame", v2.JoinDictionaries({
                Size = UDim2.new(1, 0, 0, 400), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, v6), {
                Story = v5
            });
        end
    });
end;
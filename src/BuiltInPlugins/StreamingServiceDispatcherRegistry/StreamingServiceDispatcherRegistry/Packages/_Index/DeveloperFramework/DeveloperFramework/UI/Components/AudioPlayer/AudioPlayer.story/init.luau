local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.Immutable);
return require(l_Parent_0.Examples.renderStories)(require(script.Parent.stories), {
    storyRenderer = function(v3, v4) --[[ Line: 10 ]] --[[ Name: storyRenderer ]]
        -- upvalues: v1 (copy), v2 (copy)
        return v1.createElement("Frame", v2.JoinDictionaries({
            Size = UDim2.new(1, 0, 0, 242), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v4), {
            Story = v3
        });
    end
});
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Immutable_0 = require(l_Parent_0.Util).Immutable;
return require(l_Parent_0.Examples.renderStories)(require(script.Parent.stories), {
    storyRenderer = function(v3, v4) --[[ Line: 11 ]] --[[ Name: storyRenderer ]]
        -- upvalues: v1 (copy), l_Immutable_0 (copy)
        return v1.createElement("Frame", l_Immutable_0.JoinDictionaries({
            Size = UDim2.new(0, 20, 0, 20), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v4), {
            Story = v3
        });
    end
});
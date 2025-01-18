local l_Parent_0 = script.Parent;
local l_Parent_1 = script:FindFirstAncestor("Foundation").Parent;
local v2 = require(l_Parent_0.StoryMiddleware);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.GetStories);
return {
    name = "Private", 
    group = "Foundation", 
    roact = v3, 
    storyRoots = v4(false), 
    mapStory = v2
};
local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Framework).UI.Stories.getStoryMiddleware();
local v3 = require(l_Packages_0.Roact);
return {
    name = "Toolbox", 
    mapStory = v2, 
    storyRoots = {
        l_Parent_0.Stories, 
        l_Parent_0.Core.Components
    }, 
    roact = v3
};
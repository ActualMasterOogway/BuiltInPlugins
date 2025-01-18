local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Components.Home.NavigationContainer);
local v4 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
return {
    name = "NavigationContainer", 
    summary = "A container that hosts all of the navigation routes.", 
    story = function() --[[ Line: 12 ]] --[[ Name: story ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy)
        return v2.createElement(v4, {}, {
            Container = v2.createElement(v3)
        });
    end
};
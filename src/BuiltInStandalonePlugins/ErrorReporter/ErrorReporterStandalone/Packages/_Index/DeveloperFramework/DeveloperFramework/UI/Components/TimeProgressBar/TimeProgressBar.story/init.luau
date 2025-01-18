local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.TimeProgressBar);
return {
    stories = {
        {
            name = "Default", 
            story = v1.createElement(v2, {
                TotalTime = 10
            })
        }, 
        {
            name = "Fixed Width", 
            story = v1.createElement(v2, {
                TotalTime = 10, 
                Width = 200
            })
        }, 
        {
            name = "StartTime", 
            description = "Specify start time instead of starting at component mount", 
            story = v1.createElement(v2, {
                StartTime = tick() - 10, 
                TotalTime = 20, 
                Width = 200
            })
        }
    }
};
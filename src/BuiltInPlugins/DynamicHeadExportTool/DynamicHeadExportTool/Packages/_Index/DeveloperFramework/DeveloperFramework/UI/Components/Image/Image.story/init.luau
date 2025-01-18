local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.Components.Image);
return {
    stories = {
        {
            name = "Image", 
            story = function() --[[ Line: 9 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    Image = "rbxasset://textures/ui/common/robux_color@2x.png", 
                    Size = UDim2.fromOffset(100, 100)
                });
            end
        }, 
        {
            name = "Icon16", 
            story = function() --[[ Line: 18 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    Image = "rbxasset://textures/StudioSharedUI/search.png", 
                    [v1.Tag] = "Icon16"
                });
            end
        }, 
        {
            name = "Primary Icon16", 
            story = function() --[[ Line: 27 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    Image = "rbxasset://textures/StudioSharedUI/search.png", 
                    [v1.Tag] = "Icon16 Primary"
                });
            end
        }, 
        {
            name = "ArrowIcon", 
            story = function() --[[ Line: 36 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    [v1.Tag] = "ArrowIcon"
                });
            end
        }, 
        {
            name = "ErrorIcon", 
            story = function() --[[ Line: 44 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v2 (copy)
                return v1.createElement(v2, {
                    [v1.Tag] = "ErrorIcon"
                });
            end
        }
    }
};
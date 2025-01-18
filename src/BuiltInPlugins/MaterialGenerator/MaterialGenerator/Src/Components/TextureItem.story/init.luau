local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.React);
local v2 = require(script.Parent.TextureItem);
return {
    story = function(_) --[[ Line: 9 ]] --[[ Name: story ]]
        -- upvalues: v1 (copy), v2 (copy)
        return v1.createElement(v2, {
            Image = "rbxassetid://12799638751"
        });
    end
};
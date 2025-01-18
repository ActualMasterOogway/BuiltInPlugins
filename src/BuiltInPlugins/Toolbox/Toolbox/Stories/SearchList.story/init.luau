local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_Parent_0.Core.Components.Categorization.SearchList);
local function v6(v5) --[[ Line: 11 ]] --[[ Name: ToolboxWrapper ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, v5);
end;
local v7 = {
    "charmander", 
    "bulbasaur", 
    "squirtle", 
    "cyndaquil", 
    "totodile", 
    "chikorita", 
    "torchic", 
    "mudkip", 
    "treecko", 
    "chimchar", 
    "piplup", 
    "turtwig", 
    "tepig", 
    "oshawott", 
    "snivy", 
    "fennekin", 
    "froakie", 
    "chespin", 
    "litten", 
    "popplio", 
    "rowlet"
};
return {
    summary = "A generic search list.", 
    stories = {
        {
            name = "Full, no max count", 
            story = function() --[[ Line: 44 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v4 (copy), v7 (copy)
                return v2.createElement(v6, {}, {
                    v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        SearchList = v2.createElement(v4, {
                            Items = v7, 
                            ItemMinWidth = 28
                        })
                    })
                });
            end
        }, 
        {
            name = "Max row count of 2", 
            story = function() --[[ Line: 61 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v4 (copy), v7 (copy)
                return v2.createElement(v6, {}, {
                    v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        SearchList = v2.createElement(v4, {
                            Items = v7, 
                            ItemMinWidth = 28, 
                            MaxRowCount = 2
                        })
                    })
                });
            end
        }
    }
};
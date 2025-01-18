local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_Parent_0.Core.Components.Categorization.ExpandableTeaser);
local v5 = require(l_Parent_0.Core.Components.Categorization.SearchList);
local function v7(v6) --[[ Line: 10 ]] --[[ Name: ToolboxWrapper ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, v6);
end;
local function v8() --[[ Line: 14 ]] --[[ Name: makeChildren ]]
    -- upvalues: v2 (copy)
    return {
        v2.createElement("Frame", {
            BackgroundColor3 = Color3.new(1, 0, 0), 
            Size = UDim2.new(1, 0, 0, 100)
        })
    };
end;
local function v9() --[[ Line: 22 ]] --[[ Name: makeSearchListChildren ]]
    -- upvalues: v2 (copy), v5 (copy)
    return {
        SearchList = v2.createElement(v5, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Items = {
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
                "snivy"
            }, 
            ItemMinWidth = 28
        })
    };
end;
local function v11(v10) --[[ Line: 48 ]] --[[ Name: onExpand ]]
    print("isExpanded: ", v10);
end;
return {
    summary = "An expandable teaser.", 
    stories = {
        {
            name = "Expandable", 
            story = function() --[[ Line: 57 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v7 (copy), v4 (copy), v11 (copy), v8 (copy)
                return v2.createElement(v7, {}, {
                    v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        ExpandableTeaser = v2.createElement(v4, {
                            OnExpandChanged = v11, 
                            Title = "Expandable", 
                            TeaserSize = Vector2.new(0, 10)
                        }, (v8()))
                    })
                });
            end
        }, 
        {
            name = "Search Pills", 
            story = function() --[[ Line: 75 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v7 (copy), v4 (copy), v11 (copy), v9 (copy)
                return v2.createElement(v7, {}, {
                    v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0)
                    }, {
                        ExpandableTeaser = v2.createElement(v4, {
                            OnExpandChanged = v11, 
                            Title = "Top Searches", 
                            TeaserSize = Vector2.new(0, 28)
                        }, (v9()))
                    })
                });
            end
        }
    }
};
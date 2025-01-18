local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
local v4 = require(l_Parent_0.Core.Components.Categorization.SearchPill);
local function v6(v5) --[[ Line: 9 ]] --[[ Name: ToolboxWrapper ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, v5);
end;
return {
    summary = "A generic search pill.", 
    stories = {
        {
            name = "Clickable", 
            story = function() --[[ Line: 18 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v4 (copy)
                return v2.createElement(v6, {}, {
                    SearchPill = v2.createElement(v4, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "Clickable", 
                        OnClick = function() --[[ Line: 23 ]] --[[ Name: OnClick ]]
                            print("Clicked");
                        end
                    })
                });
            end
        }, 
        {
            name = "Constant Size", 
            story = function() --[[ Line: 32 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v4 (copy)
                return v2.createElement(v6, {}, {
                    SearchPill = v2.createElement(v4, {
                        Text = "Size 100x50", 
                        Size = UDim2.new(0, 100, 0, 50)
                    })
                });
            end
        }
    }
};
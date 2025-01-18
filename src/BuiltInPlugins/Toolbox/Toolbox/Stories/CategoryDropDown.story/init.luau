local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Core.Components.CategoryDropDown.CategoryDropDown);
local v4 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v5 = {
    "rock", 
    "pop", 
    "scores-orchestral", 
    "children", 
    "ethnic-folk", 
    "kitsch-retro", 
    "electronic", 
    "latin", 
    "classical", 
    "jazz", 
    "corporate", 
    "blues", 
    "atmosphere", 
    "easy-listening", 
    "religious", 
    "world-beat", 
    "hip-hop", 
    "folk-contemporary", 
    "dance-traditional", 
    "funk-soul-r-b", 
    "ethnic-pop", 
    "country", 
    "marches-military", 
    "electronica"
};
local function v7(v6) --[[ Line: 37 ]]
    print(v6);
end;
return {
    name = "Category drop down", 
    story = function() --[[ Line: 42 ]] --[[ Name: story ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v7 (copy), v5 (copy)
        return v2.createElement(v4, {}, {
            CategoryDropDown = v2.createElement(v3, {
                OnCategorySelect = v7, 
                Categories = v5
            })
        });
    end
};
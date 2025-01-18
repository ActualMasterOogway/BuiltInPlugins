local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = {
    equippableItems = {}, 
    addNewItem = function(_, _) --[[ Line: 16 ]] --[[ Name: addNewItem ]]
        error("Calling default addNewItem");
    end, 
    removeItem = function() --[[ Line: 19 ]] --[[ Name: removeItem ]]
        error("Calling default removeItem");
    end
};
return (v1.createContext(v5));
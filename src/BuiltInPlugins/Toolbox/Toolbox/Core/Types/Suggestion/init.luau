local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.Category);
return {
    SUGGESTIONS = {
        {
            name = "NPC", 
            search = "NPC"
        }, 
        {
            name = "Vehicle", 
            search = "Vehicle"
        }, 
        {
            name = "Weapon", 
            search = "Weapon"
        }, 
        {
            name = "Building", 
            search = "Building"
        }, 
        {
            name = "Light", 
            search = "Light"
        }
    }, 
    canHaveSuggestions = function(v2, v3) --[[ Line: 39 ]] --[[ Name: canHaveSuggestions ]]
        -- upvalues: v1 (copy)
        local v4 = false;
        if v2 == "" then
            v4 = v1.categoryIsFreeAsset(v3);
        end;
        return v4;
    end
};
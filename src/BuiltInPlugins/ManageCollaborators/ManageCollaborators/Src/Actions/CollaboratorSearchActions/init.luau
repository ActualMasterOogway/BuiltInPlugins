local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
return {
    LoadWebResults = l_Action_0("LoadWebResults", function(v2) --[[ Line: 6 ]]
        return {
            searchTerm = v2
        };
    end), 
    LoadedWebResults = l_Action_0("LoadedWebResults", function(v3, v4, v5) --[[ Line: 12 ]]
        return {
            success = v3, 
            key = v4, 
            results = v5
        };
    end), 
    SearchTextChanged = l_Action_0("SearchTextChanged", function(v6) --[[ Line: 20 ]]
        return {
            text = v6
        };
    end)
};
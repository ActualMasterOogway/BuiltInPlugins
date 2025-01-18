local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.Logger);
return v2.createContext({
    anchor = nil, 
    setAnchor = function(_) --[[ Line: 9 ]] --[[ Name: setAnchor ]]
        -- upvalues: v3 (copy)
        v3:warning("No PopoverProvider found for Popover");
    end, 
    isOpen = false
});
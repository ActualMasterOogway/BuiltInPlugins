local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.PopoverContext);
return v1.forwardRef(function(v3, _) --[[ Line: 14 ]] --[[ Name: Popover ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5, v6 = v1.useState(nil);
    return v1.createElement(v2.Provider, {
        value = {
            anchor = v5, 
            setAnchor = v6, 
            isOpen = v3.isOpen
        }
    }, v3.children);
end);
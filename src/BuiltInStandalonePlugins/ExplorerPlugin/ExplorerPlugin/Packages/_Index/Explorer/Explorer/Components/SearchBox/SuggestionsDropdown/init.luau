local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.SearchBox.Dropdown);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Util.mapValues);
local l_createElement_0 = v2.createElement;
return function(v5) --[[ Line: 9 ]] --[[ Name: SuggestionsDropdown ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy), v3 (copy)
    return l_createElement_0(v1, {
        dropdownRef = v5.dropdownRef, 
        onItemClicked = v5.onItemClicked, 
        itemData = v3(v5.suggestions, function(v6) --[[ Line: 17 ]]
            local v7 = nil;
            local v8 = string.find(v6, "=");
            if v8 then
                v7 = v6:sub(v8 + 1);
            end;
            if string.find(v6, "tag:") == 1 then
                v7 = v6:sub(5);
            end;
            return {
                displayText = v7, 
                text = v6
            };
        end)
    });
end;
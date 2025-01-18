local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.SearchBox.Dropdown);
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Util.mapValues);
local l_createElement_0 = v3.createElement;
return function(v6) --[[ Line: 10 ]] --[[ Name: HistoryDropdown ]]
    -- upvalues: v2 (copy), l_createElement_0 (copy), v1 (copy), v4 (copy)
    local v7 = v2.ContextServices.Localization:use();
    return l_createElement_0(v1, {
        dropdownRef = v6.dropdownRef, 
        headerInfo = {
            titleText = v7:getText("HistoryDropdown", "TitleText")
        }, 
        itemData = v4(v6.searchHistory, function(v8) --[[ Line: 22 ]]
            return {
                text = v8
            };
        end), 
        onItemClicked = v6.onItemClicked
    });
end;
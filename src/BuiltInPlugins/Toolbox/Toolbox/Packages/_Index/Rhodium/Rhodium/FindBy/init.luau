local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v1 = require(l_script_FirstAncestor_0.Parent.LuauTagUtils);
local v2 = require(l_script_FirstAncestor_0.XPath);
local v3 = require(l_script_FirstAncestor_0.By);
return function(v4, ...) --[[ Line: 8 ]] --[[ Name: FindBy ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    if v4 == v3.TAGS then
        return (v1.getUnique(...));
    elseif v4 == v3.TAGS_ANY then
        return (v1.getAny(...));
    elseif v4 == v3.TAGS_ALL then
        return (v1.getAll(...));
    elseif v4 == v3.XPATH then
        return (v2.new((...)):getFirstInstance());
    else
        error(string.format("Invalid locator type: %s", v4));
        return;
    end;
end;
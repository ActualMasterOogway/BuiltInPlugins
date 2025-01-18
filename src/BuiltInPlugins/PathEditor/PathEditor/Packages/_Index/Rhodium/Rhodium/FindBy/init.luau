local v0 = require(script.Parent.Parent.LuauTagUtils);
local v1 = require(script.Parent.XPath);
local v2 = require(script.Parent.By);
return function(v3, ...) --[[ Line: 5 ]] --[[ Name: FindBy ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    if v3 == v2.TAGS then
        return (v0.getUnique(...));
    elseif v3 == v2.TAGS_ANY then
        return (v0.getAny(...));
    elseif v3 == v2.TAGS_ALL then
        return (v0.getAll(...));
    elseif v3 == v2.XPATH then
        return (v1.new((...)):getFirstInstance());
    else
        error(string.format("Invalid locator type: %s", v3));
        return;
    end;
end;
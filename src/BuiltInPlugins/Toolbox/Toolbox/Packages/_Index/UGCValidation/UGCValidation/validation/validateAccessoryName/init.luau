local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: validateAccessoryName ]]
    -- upvalues: v1 (copy)
    if string.match(v3.Name, "Accessory %(.+%)$") then
        return true;
    else
        v1.reportFailure(v1.ErrorType.validateAccessoryName, nil, v4);
        return false, {
            "Accessory.Name must match pattern \"Accessory (Name)\""
        };
    end;
end;
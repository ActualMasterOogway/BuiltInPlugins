local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: validateTags ]]
    -- upvalues: l_CollectionService_0 (copy), v2 (copy)
    local l_v4_Descendants_0 = v4:GetDescendants();
    table.insert(l_v4_Descendants_0, v4);
    local v7 = {};
    for _, v9 in ipairs(l_v4_Descendants_0) do
        if #l_CollectionService_0:GetTags(v9) > 0 then
            table.insert(v7, v9);
        end;
    end;
    if #v7 > 0 then
        local v10 = {
            "Found the following instance tags which are not allowed:"
        };
        for _, v12 in ipairs(v7) do
            table.insert(v10, v12:GetFullName());
        end;
        v2.reportFailure(v2.ErrorType.validateTags, nil, v5);
        return false, v10;
    else
        return true;
    end;
end;
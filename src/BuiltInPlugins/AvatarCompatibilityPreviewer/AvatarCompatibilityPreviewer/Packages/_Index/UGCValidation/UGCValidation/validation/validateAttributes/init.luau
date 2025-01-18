local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.checkForProxyWrap);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local function v10(v6, v7) --[[ Line: 17 ]] --[[ Name: hasOnlyAllowedAttribute ]]
    -- upvalues: v2 (copy)
    for v8, v9 in v6 do
        if not v7 or v8 ~= v2.AlternateMeshIdAttributeName then
            if v8 ~= v2.GUIDAttributeName then
                return false;
            elseif typeof(v9) ~= "string" then
                return false;
            elseif string.len(v9) > v2.GUIDAttributeMaxLength then
                return false;
            end;
        end;
    end;
    return true;
end;
return function(v11, v12) --[[ Line: 39 ]] --[[ Name: validateAttributes ]]
    -- upvalues: v5 (copy), v10 (copy), v4 (copy), v2 (copy), v1 (copy)
    local v13 = if v5() then v12.allowEditableInstances else false;
    local v14 = {};
    if not v10(v11:GetAttributes(), v13) then
        table.insert(v14, v11:GetFullName());
    end;
    for _, v16 in ipairs(v11:GetDescendants()) do
        if (not v13 or not v4(v16) and not v16:GetAttribute(v2.AlternateMeshIdAttributeName)) and next(v16:GetAttributes()) ~= nil then
            table.insert(v14, v16:GetFullName());
        end;
    end;
    if #v14 > 0 then
        local v17 = {};
        table.insert(v17, string.format("'%s' contains attributes in its properties that are not allowed. You need to remove the following attributes: ", v11.Name));
        for _, v19 in pairs(v14) do
            table.insert(v17, v19);
        end;
        v1.reportFailure(v1.ErrorType.validateAttributes, nil, v12);
        return false, v17;
    else
        return true;
    end;
end;
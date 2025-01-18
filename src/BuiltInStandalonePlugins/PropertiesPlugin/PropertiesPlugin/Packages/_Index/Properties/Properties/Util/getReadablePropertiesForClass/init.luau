local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Util.APIService);
local v2 = {};
local function _(v3) --[[ Line: 15 ]] --[[ Name: visibleProperty ]]
    if v3 then
        return not table.find(v3, "NotScriptable") and not table.find(v3, "Deprecated");
    else
        return true;
    end;
end;
local function _(v5) --[[ Line: 23 ]] --[[ Name: isReadonly ]]
    if v5 then
        return table.find(v5, "ReadOnly") ~= nil;
    else
        return false;
    end;
end;
local function v7(v8) --[[ Line: 31 ]] --[[ Name: getReadablePropertiesForClass ]]
    -- upvalues: v2 (copy), v1 (copy), v7 (copy)
    local v9 = v2[v8];
    if v9 then
        return v9;
    else
        local v10 = {};
        local l_v1_RawClassData_0 = v1:GetRawClassData(v8);
        if l_v1_RawClassData_0 then
            if l_v1_RawClassData_0.Superclass ~= "<<<ROOT>>>" then
                for _, v13 in v7(l_v1_RawClassData_0.Superclass) do
                    table.insert(v10, v13);
                end;
            end;
            for _, v15 in l_v1_RawClassData_0.Members do
                if v15.MemberType == "Property" then
                    local l_Tags_0 = v15.Tags;
                    if not l_Tags_0 or not table.find(l_Tags_0, "NotScriptable") and not table.find(l_Tags_0, "Deprecated") then
                        local v17 = {
                            Name = v15.Name, 
                            Type = v15.ValueType.Name, 
                            Class = v8
                        };
                        local l_Tags_1 = v15.Tags;
                        v17.Readonly = if l_Tags_1 then table.find(l_Tags_1, "ReadOnly") ~= nil else false;
                        table.insert(v10, v17);
                    end;
                end;
            end;
        else
            warn("Missing APIService info for type " .. v8);
        end;
        v2[v8] = v10;
        return v10;
    end;
end;
return v7;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Util.APIService);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v3 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v4 = {};
local function v5(v6, v7) --[[ Line: 15 ]] --[[ Name: rawGetCategory ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_v1_RawClassData_0 = v1:GetRawClassData(v6);
    if l_v1_RawClassData_0 then
        for _, v10 in l_v1_RawClassData_0.Members do
            if v10.Name == v7 then
                return v10.Category;
            end;
        end;
        if l_v1_RawClassData_0.Superclass ~= "<<<ROOT>>>" then
            return v5(l_v1_RawClassData_0.Superclass, v7);
        else
            return "Missing Member Metadata";
        end;
    else
        return "Missing Class Metadata";
    end;
end;
local function v14(v11) --[[ Line: 33 ]] --[[ Name: getCategory ]]
    -- upvalues: v4 (copy), v5 (copy)
    if v11.id.isAttribute then
        return "Attributes";
    else
        local v12 = v4[v11.id.className];
        if not v12 then
            v12 = {};
            v4[v11.id.className] = v12;
        end;
        local v13 = v12[v11.id.propertyName];
        if not v13 then
            v13 = v5(v11.id.className, v11.id.propertyName);
            v12[v11.id.propertyName] = v13;
        end;
        return v13;
    end;
end;
local _ = function(_) --[[ Line: 51 ]] --[[ Name: getPropertyOrder ]]
    return 0;
end;
local v17 = v3();
local v18 = table.freeze({
    Appearance = v17(), 
    Data = v17(), 
    Transform = v17(), 
    Pivot = v17(), 
    Behavior = v17(), 
    Collision = v17(), 
    Part = v17(), 
    Default = v17(), 
    Tags = v17(), 
    Attributes = v17()
});
local function _(v19) --[[ Line: 69 ]] --[[ Name: getCategoryOrder ]]
    -- upvalues: v18 (copy)
    return v18[v19.categoryName] or v18.Default;
end;
local function v23(_, _) --[[ Line: 73 ]] --[[ Name: compareProperties ]]
    return 0 > 0;
end;
local function v28(v24, v25) --[[ Line: 77 ]] --[[ Name: compareCategories ]]
    -- upvalues: v18 (copy)
    local v26 = v18[v24.categoryName] or v18.Default;
    local v27 = v18[v25.categoryName] or v18.Default;
    if v26 == v27 then
        return v24.categoryName < v25.categoryName;
    else
        return v26 < v27;
    end;
end;
return function(v29) --[[ Line: 87 ]] --[[ Name: categorizeProperties ]]
    -- upvalues: v14 (copy), v23 (copy), v28 (copy)
    local v30 = {};
    local v31 = {};
    for _, v33 in v29 do
        local v34 = v14(v33);
        local v35 = v31[v34];
        if not v35 then
            local v36 = {
                categoryName = v34, 
                propertiesInOrder = {
                    v33
                }
            };
            table.insert(v30, v36);
            v31[v34] = v36;
        else
            table.insert(v35.propertiesInOrder, v33);
        end;
    end;
    for _, v38 in v31 do
        table.sort(v38.propertiesInOrder, v23);
        table.insert(v30, v38);
    end;
    table.sort(v30, v28);
    return v30;
end;
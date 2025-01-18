local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local _ = require(l_Util_0.ScriptAnalysis.Constants);
local v4 = {};
v4.__index = v4;
v4.__eq = function(v5, v6) --[[ Line: 11 ]]
    if #v5._list ~= #v6._list then
        return false;
    else
        for v7, v8 in v5._list do
            if v8 ~= v6._list[v7] then
                return false;
            end;
        end;
        return true;
    end;
end;
v4.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        _list = {}
    }, v4));
end;
v4.AddDiagnostic = function(v9, v10) --[[ Line: 31 ]] --[[ Name: AddDiagnostic ]]
    table.insert(v9._list, v10);
end;
v4.GetDataForLinter = function(v11) --[[ Line: 35 ]] --[[ Name: GetDataForLinter ]]
    local v12 = {};
    for _, v14 in v11._list do
        table.insert(v12, v14:GetDataForLinter());
    end;
    return v12;
end;
v4.Get = function(v15) --[[ Line: 45 ]] --[[ Name: Get ]]
    return v15._list;
end;
v4.GetSize = function(v16) --[[ Line: 49 ]] --[[ Name: GetSize ]]
    return #v16._list;
end;
v4.ErrorCount = function(v17, v18) --[[ Line: 53 ]] --[[ Name: ErrorCount ]]
    local v19 = 0;
    for _, v21 in v17._list do
        if (not v18 or v18 == v21.instanceName) and v21.severity == Enum.Severity.Error and not v21.resolution then
            v19 = v19 + 1;
        end;
    end;
    return v19;
end;
v4.WarningCount = function(v22, v23) --[[ Line: 68 ]] --[[ Name: WarningCount ]]
    local v24 = 0;
    for _, v26 in v22._list do
        if (not v23 or v23 == v26.instanceName) and v26.severity == Enum.Severity.Warning and not v26.resolution then
            v24 = v24 + 1;
        end;
    end;
    return v24;
end;
v4.HasErrors = function(v27) --[[ Line: 83 ]] --[[ Name: HasErrors ]]
    return v27:ErrorCount() > 0;
end;
v4.HasWarnings = function(v28) --[[ Line: 87 ]] --[[ Name: HasWarnings ]]
    return v28:WarningCount() > 0;
end;
v4.Merge = function(v29, v30) --[[ Line: 91 ]] --[[ Name: Merge ]]
    -- upvalues: v4 (copy), l_deepCopy_0 (copy)
    local v31 = v4.new();
    v31._list = l_deepCopy_0(v29._list);
    for _, v33 in v30._list do
        local v34 = false;
        for _, v36 in v31._list do
            if v33.range == v36.range and v33.instanceName == v36.instanceName and v33.issueType == v36.issueType then
                v34 = true;
                break;
            end;
        end;
        if not v34 then
            v31:AddDiagnostic(v33);
        end;
    end;
    table.sort(v31._list);
    return v31;
end;
return v4;
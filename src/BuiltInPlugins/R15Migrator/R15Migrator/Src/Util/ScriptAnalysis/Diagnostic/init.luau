local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_HttpService_0 = game:GetService("HttpService");
local l_ScriptAnalysis_0 = l_script_FirstAncestor_0.Src.Util.ScriptAnalysis;
local _ = require(l_ScriptAnalysis_0.Constants);
local v4 = {};
v4.__index = v4;
v4.__eq = function(v5, v6) --[[ Line: 9 ]]
    if v5.range ~= v6.range or v5.message ~= v6.message or #v5.suggestions ~= #v6.suggestions or v5.issueType ~= v6.issueType then
        return false;
    else
        for v7, v8 in v5.suggestions do
            if v8 ~= v6.suggestions[v7] then
                return false;
            end;
        end;
        return true;
    end;
end;
v4.__lt = function(v9, v10) --[[ Line: 28 ]]
    return v9.range < v10.range;
end;
v4.new = function(v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: l_HttpService_0 (copy), v4 (copy)
    return (setmetatable({
        diagnosticId = l_HttpService_0:GenerateGUID(true), 
        range = v11, 
        code = v12, 
        codeDescription = v17, 
        instanceName = v13, 
        message = v14, 
        severity = v15, 
        suggestions = v16, 
        issueType = v18
    }, v4));
end;
v4.GetDataForLinter = function(v19) --[[ Line: 46 ]] --[[ Name: GetDataForLinter ]]
    return {
        range = v19.range:GetDataForLinter(), 
        code = v19.code, 
        message = v19.message, 
        severity = v19.severity, 
        codeDescription = v19.codeDescription
    };
end;
return v4;
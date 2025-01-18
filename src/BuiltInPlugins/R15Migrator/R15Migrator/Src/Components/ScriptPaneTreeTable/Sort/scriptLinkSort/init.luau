local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Range);
return function(v2, v3, v4) --[[ Line: 20 ]]
    local l_Range_0 = v2.Range;
    local l_Range_1 = v3.Range;
    if v4 == Enum.SortDirection.Descending then
        if l_Range_0 and l_Range_1 then
            return l_Range_0:__lt(l_Range_1);
        else
            return v2.Script:GetFullName() < v3.Script:GetFullName();
        end;
    elseif l_Range_0 and l_Range_1 then
        return not l_Range_0:__le(l_Range_1);
    else
        return v2.Script:GetFullName() > v3.Script:GetFullName();
    end;
end;
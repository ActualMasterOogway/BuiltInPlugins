local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
return {
    addScriptIssue = function(v2, v3, v4, v5, v6) --[[ Line: 8 ]] --[[ Name: addScriptIssue ]]
        -- upvalues: l_deepCopy_0 (copy)
        if v3.scriptId and not v4[v3.scriptId] then
            v4[v3.scriptId] = {};
        end;
        if not v3.range then
            v4[v3.scriptId] = v2:sortDiagListForConversion(v5[v3.scriptId]);
            v6[v3.scriptId] = true;
            return;
        else
            if not v6[v3.scriptId] then
                table.insert(v4[v3.scriptId], l_deepCopy_0(v3));
            end;
            return;
        end;
    end, 
    sortSelectionForConversion = function(v7, v8, v9) --[[ Line: 22 ]] --[[ Name: sortSelectionForConversion ]]
        local v10 = {};
        local v11 = {};
        for _, v13 in v8 do
            v7:addScriptIssue(v13, v10, v9, v11);
        end;
        for v14, v15 in v10 do
            if not v11[v14] then
                v7:sortScriptItemsByRange(v15);
            end;
        end;
        return v10;
    end, 
    sortScriptItemsByRange = function(_, v17) --[[ Line: 40 ]] --[[ Name: sortScriptItemsByRange ]]
        table.sort(v17, function(v18, v19) --[[ Line: 41 ]]
            return v18.range > v19.range;
        end);
    end, 
    sortDiagListForConversion = function(v20, v21) --[[ Line: 46 ]] --[[ Name: sortDiagListForConversion ]]
        -- upvalues: l_deepCopy_0 (copy)
        if not v21 then
            return {};
        else
            local v22 = l_deepCopy_0(v21:Get());
            v20:sortScriptItemsByRange(v22);
            return v22;
        end;
    end
};
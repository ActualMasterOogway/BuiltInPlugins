local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetDiagnostics);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.ScriptAnalysis.Range);
return function(v6, v7, v8) --[[ Line: 33 ]]
    -- upvalues: l_deepCopy_0 (copy), v5 (copy), v3 (copy)
    return function(v9) --[[ Line: 34 ]]
        -- upvalues: v7 (copy), v6 (copy), l_deepCopy_0 (ref), v8 (copy), v5 (ref), v3 (ref)
        local l_diagnostics_0 = v9:getState().ScriptConversion.diagnostics;
        if not v7 then
            return;
        else
            local v11 = v6:addOrFindScript(v7);
            local v12 = l_diagnostics_0[v11];
            if not v12 then
                return;
            else
                local l__list_0 = l_deepCopy_0(v12)._list;
                local v14 = nil;
                local v15 = false;
                for _, v17 in v8 do
                    v17.range = v5.fromLinter(v17.range);
                    v14 = {};
                    for _, v19 in l__list_0 do
                        if v19.range:Overlaps(v17.range) then
                            v15 = true;
                        else
                            if v17.range.startLine < v19.range.startLine or v17.range.startLine == v19.range.startLine and v17.range.startCharacter < v19.range.startCharacter then
                                local _, v21 = v17.text:gsub("\n", "\n");
                                local v22 = v21 - (v17.range.endLine - v17.range.startLine);
                                local v23 = 0;
                                if v17.range.endLine == v19.range.startLine then
                                    local v24 = v17.text:find("\n[^\n]*$");
                                    v23 = #v17.text - (v24 or 0) + (v24 ~= nil and 1 or v17.range.startCharacter) - v17.range.endCharacter;
                                    local l_range_0 = v19.range;
                                    l_range_0.startCharacter = l_range_0.startCharacter + v23;
                                    if v19.range.endLine == v19.range.startLine then
                                        l_range_0 = v19.range;
                                        l_range_0.endCharacter = l_range_0.endCharacter + v23;
                                    end;
                                end;
                                local l_range_1 = v19.range;
                                l_range_1.startLine = l_range_1.startLine + v22;
                                l_range_1 = v19.range;
                                l_range_1.endLine = l_range_1.endLine + v22;
                                v15 = v15 or v22 ~= 0 or v23 ~= 0;
                            end;
                            table.insert(v14, v19);
                        end;
                    end;
                    l__list_0 = v14;
                end;
                if v15 then
                    local v27 = l_deepCopy_0(l_diagnostics_0);
                    v27[v11]._list = v14;
                    v9:dispatch(v3(v27));
                end;
                return;
            end;
        end;
    end;
end;
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_ScriptAnalysis_0 = script:FindFirstAncestor("R15Migrator").Src.Util.ScriptAnalysis;
local v2 = require(l_ScriptAnalysis_0.StringUtil);
local v3 = require(l_ScriptAnalysis_0.StatementParser);
local v4 = require(l_ScriptAnalysis_0.CodeBlock);
local v5 = require(l_ScriptAnalysis_0.BlockTree);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy), v4 (copy), l_ScriptEditorService_0 (copy)
    local v7 = v5.new();
    local l_v7_Root_0 = v7:GetRoot();
    local v9 = nil;
    local function v18(v10, v11) --[[ Line: 16 ]] --[[ Name: findVariables ]]
        -- upvalues: v3 (ref), v2 (ref), l_v7_Root_0 (ref)
        local l_v3_RightSide_0, v13 = v3:GetRightSide(v10, 1);
        if l_v3_RightSide_0 and v13 and v2.CharAt(v10, l_v3_RightSide_0) == "{" then
            return;
        else
            local v14 = string.find(v10, "=", nil, true);
            if v14 then
                v14 = v14 - 1;
            else
                v14 = string.len(v10);
            end;
            v10 = string.sub(v10, 1, v14);
            for _, v16 in (v10:split()) do
                local v17 = string.find(v10, v16, nil, true);
                l_v7_Root_0:AddVariable(v2.RemoveWhitespace(v16), "", v11, v17);
            end;
            return;
        end;
    end;
    local function v25(v19, v20, v21) --[[ Line: 39 ]] --[[ Name: startBlockHelper ]]
        -- upvalues: l_v7_Root_0 (ref), v4 (ref)
        local v22, v23 = string.find(v20, v19, l_v7_Root_0.StartIndex, true);
        table.insert(l_v7_Root_0.Lines, {
            LineNo = v21, 
            Text = string.sub(v20, l_v7_Root_0.StartIndex, v22 - 1), 
            Offset = l_v7_Root_0.StartIndex - 1
        });
        local v24 = v4.new(v23 + 1, v23 + 1);
        l_v7_Root_0:AddChild(v24);
        l_v7_Root_0 = v24;
        return true;
    end;
    local function _(v26, v27, v28) --[[ Line: 54 ]] --[[ Name: startFunctionBlock ]]
        -- upvalues: v2 (ref), v25 (copy)
        local v29, v30 = string.find(v26, "function");
        if v29 and v30 and v2.MatchBeforeAndAfter(v26, v29, v30, "[%s=,]", "[%s\r\n(]", true, true) then
            return (v25(v26, v27, v28));
        else
            return false;
        end;
    end;
    local function _(v32, v33, v34) --[[ Line: 76 ]] --[[ Name: startBlock ]]
        -- upvalues: v25 (copy)
        if v32 == "repeat" or v32 == "do" or v32 == "then" then
            return (v25(v32, v33, v34));
        else
            return false;
        end;
    end;
    local function v41(v36, v37, v38) --[[ Line: 84 ]] --[[ Name: endBlockHelper ]]
        -- upvalues: l_v7_Root_0 (ref)
        local v39, v40 = string.find(v37, v36, l_v7_Root_0.StartIndex, true);
        l_v7_Root_0.EndIndex = v39 - 1;
        table.insert(l_v7_Root_0.Lines, {
            LineNo = v38, 
            Text = string.sub(v37, l_v7_Root_0.StartIndex, l_v7_Root_0.EndIndex), 
            Offset = l_v7_Root_0.StartIndex - 1
        });
        if l_v7_Root_0.Parent then
            l_v7_Root_0 = l_v7_Root_0.Parent;
            l_v7_Root_0.StartIndex = v40;
            l_v7_Root_0.EndIndex = v40;
        end;
        return true;
    end;
    local function _(v42, v43, v44) --[[ Line: 102 ]] --[[ Name: endBlock ]]
        -- upvalues: v2 (ref), v41 (copy)
        local v45, v46 = string.find(v42, "end");
        if v45 and v46 and v2.MatchBeforeAndAfter(v42, v45, v46, "[%s]", "[)%s]", true, true) then
            return (v41(v42, v43, v44));
        else
            return false;
        end;
    end;
    local function v56(v48, v49, v50) --[[ Line: 113 ]] --[[ Name: checkForElse ]]
        -- upvalues: v2 (ref), l_v7_Root_0 (ref), v4 (ref)
        local v51, v52 = string.find(v48, "else");
        if v51 and v52 and v2.MatchBeforeAndAfter(v48, v51, v52, "[%s]", "[)%s]", true, true) then
            local v53, v54 = string.find(v49, v48, l_v7_Root_0.StartIndex, true);
            l_v7_Root_0.EndIndex = v53 - 1;
            table.insert(l_v7_Root_0.Lines, {
                LineNo = v50, 
                Text = string.sub(v49, l_v7_Root_0.StartIndex, l_v7_Root_0.EndIndex), 
                Offset = l_v7_Root_0.StartIndex - 1
            });
            if l_v7_Root_0.Parent then
                l_v7_Root_0 = l_v7_Root_0.Parent;
                l_v7_Root_0.StartIndex = v53;
                l_v7_Root_0.EndIndex = v54;
            end;
            table.insert(l_v7_Root_0.Lines, {
                LineNo = v50, 
                Text = string.sub(v49, l_v7_Root_0.StartIndex, v53 - 1), 
                Offset = l_v7_Root_0.StartIndex - 1
            });
            local v55 = v4.new(v54 + 1, v54 + 1);
            l_v7_Root_0:AddChild(v55);
            l_v7_Root_0 = v55;
            return true;
        else
            return false;
        end;
    end;
    local function _(v57, v58, v59) --[[ Line: 147 ]] --[[ Name: endBlockOnElseIf ]]
        -- upvalues: v2 (ref), v41 (copy)
        local v60, v61 = string.find(v57, "elseif");
        if v60 and v61 and v2.MatchBeforeAndAfter(v57, v60, v61, "[%s]", "[)%s]", true, true) then
            return (v41(v57, v58, v59));
        else
            return false;
        end;
    end;
    local function _(v63, v64, v65) --[[ Line: 158 ]] --[[ Name: endBlockOnUntil ]]
        -- upvalues: v2 (ref), v41 (copy)
        local v66, v67 = string.find(v63, "until");
        if v66 and v67 and v2.MatchBeforeAndAfter(v63, v66, v67, "", "[(]", true, false) then
            return (v41(v63, v64, v65));
        else
            return false;
        end;
    end;
    local function v75(v69, v70, v71) --[[ Line: 169 ]] --[[ Name: parseLocalVariable ]]
        -- upvalues: v2 (ref), v9 (ref), v18 (copy)
        if v69 ~= "local" then
            return false;
        else
            local v72, v73 = v2.FindFirstWholeWord(v70, v69, v9);
            if v72 and v73 then
                if string.sub(v70, v73 + 1, v73 + 10) == " function " then
                    v9 = v73 + 1;
                    return false;
                else
                    local v74 = string.sub(v70, v73 + 1, (string.len(v70)));
                    if string.len(v74) > 0 then
                        v18(v74, v71);
                    end;
                    v9 = v73 + 1;
                end;
            end;
            return true;
        end;
    end;
    local function v82(v76, v77) --[[ Line: 193 ]] --[[ Name: findBlock ]]
        -- upvalues: v9 (ref), l_v7_Root_0 (ref), v2 (ref), v25 (copy), v41 (copy), v56 (copy), v75 (copy)
        v9 = 1;
        l_v7_Root_0.StartIndex = 1;
        l_v7_Root_0.EndIndex = 1;
        for v78 in v76:gmatch("%S+") do
            local v79, v80 = string.find(v78, "function");
            if not (if v79 and v80 and v2.MatchBeforeAndAfter(v78, v79, v80, "[%s=,]", "[%s\r\n(]", true, true) then v25(v78, v76, v77) else false) and (v78 ~= "repeat" and v78 ~= "do" and v78 ~= "then" or not v25(v78, v76, v77)) then
                v79, v80 = string.find(v78, "end");
                if not if v79 and v80 and v2.MatchBeforeAndAfter(v78, v79, v80, "[%s]", "[)%s]", true, true) then v41(v78, v76, v77) else false then
                    v79, v80 = string.find(v78, "until");
                    if not (if v79 and v80 and v2.MatchBeforeAndAfter(v78, v79, v80, "", "[(]", true, false) then v41(v78, v76, v77) else false) and not v56(v78, v76, v77) then
                        v79, v80 = string.find(v78, "elseif");
                        if (if v79 and v80 and v2.MatchBeforeAndAfter(v78, v79, v80, "[%s]", "[)%s]", true, true) then v41(v78, v76, v77) else false) or not v75(v78, v76, v77) then

                        end;
                    end;
                end;
            end;
        end;
        local v81 = string.sub(v76, l_v7_Root_0.EndIndex, (string.len(v76)));
        v75("local", v81, v77);
        table.insert(l_v7_Root_0.Lines, {
            LineNo = v77, 
            Text = v81, 
            Offset = l_v7_Root_0.EndIndex - 1
        });
    end;
    local l_l_ScriptEditorService_0_EditorSource_0 = l_ScriptEditorService_0:GetEditorSource(v6);
    local v84 = l_ScriptEditorService_0:StripComments(l_l_ScriptEditorService_0_EditorSource_0);
    v2.ForEachLine(v84, function(v85, v86) --[[ Line: 229 ]]
        -- upvalues: v82 (copy)
        v82(v85, v86);
    end);
    return v7;
end;
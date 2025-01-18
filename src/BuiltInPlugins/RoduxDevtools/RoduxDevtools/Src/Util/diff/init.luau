local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.JestDiff);
local l_pretty_0 = require(l_Parent_0.Packages.Dash).pretty;
local v3 = {
    contextLines = 3
};
local function v5(v4) --[[ Line: 15 ]] --[[ Name: noColor ]]
    return v4;
end;
local function v7(v6) --[[ Line: 19 ]] --[[ Name: patchColor ]]
    return "<font color=\"#FFCE0B\">" .. v6 .. "</font>";
end;
local function v9(v8) --[[ Line: 23 ]] --[[ Name: changeColor ]]
    return "<font color=\"#008BDB\">" .. v8 .. "</font>";
end;
local function v11(v10) --[[ Line: 27 ]] --[[ Name: additionColor ]]
    return "<font color=\"#009E56\">" .. v10 .. "</font>";
end;
local function v13(v12) --[[ Line: 31 ]] --[[ Name: removalColor ]]
    return "<font color=\"#EF1E14\">" .. v12 .. "</font>";
end;
local function v24(v14, v15, v16) --[[ Line: 35 ]] --[[ Name: sharedPrefixLines ]]
    if #v14 == 0 or #v15 == 0 or string.byte(v14, 1) ~= string.byte(v15, 1) then
        return 0;
    else
        local v17 = 1;
        local v18 = math.min(#v14, #v15);
        local l_v18_0 = v18;
        local v20 = 1;
        while v17 < l_v18_0 do
            if string.sub(v14, v20, l_v18_0) == string.sub(v15, v20, l_v18_0) then
                v17 = l_v18_0;
                v20 = v17;
            else
                v18 = l_v18_0;
            end;
            l_v18_0 = math.floor(v17 + (v18 - v17) / 2);
        end;
        local v21 = (if v16 then v16.contextLines else 0) or 0;
        local v22 = -1;
        for v23 = l_v18_0, 0, -1 do
            l_v18_0 = v23;
            if string.byte(v14, v23) == 10 then
                v22 = v22 + 1;
                if v21 <= v22 then
                    break;
                end;
            end;
        end;
        return l_v18_0;
    end;
end;
local function v35(v25, v26, v27) --[[ Line: 76 ]] --[[ Name: sharedSuffixLines ]]
    if #v25 == 0 or #v26 == 0 or string.byte(v25, -1) ~= string.byte(v26, -1) then
        return 0;
    else
        local v28 = 1;
        local v29 = math.min(#v25, #v26);
        local l_v29_0 = v29;
        local v31 = 1;
        while v28 < l_v29_0 do
            if string.sub(v25, -l_v29_0, -v31) == string.sub(v26, -l_v29_0, -v31) then
                v28 = l_v29_0;
                v31 = v28;
            else
                v29 = l_v29_0;
            end;
            l_v29_0 = math.floor(v28 + (v29 - v28) / 2);
        end;
        local v32 = (if v27 then v27.contextLines else 0) or 0;
        local v33 = -1;
        for v34 = l_v29_0, 0, -1 do
            l_v29_0 = v34;
            if string.byte(v25, -v34) == 10 then
                v33 = v33 + 1;
                if v32 <= v33 then
                    break;
                end;
            end;
        end;
        return l_v29_0;
    end;
end;
return function(v36, v37, v38) --[[ Line: 117 ]]
    -- upvalues: v3 (copy), l_pretty_0 (copy), v24 (copy), v35 (copy), v1 (copy), v13 (copy), v11 (copy), v7 (copy), v9 (copy), v5 (copy)
    if v38 == nil then
        v38 = v3;
    end;
    local l_contextLines_0 = v38.contextLines;
    local v40 = l_pretty_0(v36, {
        depth = 100, 
        multiline = true, 
        maxLineLength = 100, 
        indent = "  "
    });
    local v41 = l_pretty_0(v37, {
        depth = 100, 
        multiline = true, 
        maxLineLength = 100, 
        indent = "  "
    });
    if v40 == v41 then
        return "Compared values have no visual difference.";
    else
        local v42 = v24(v40, v41, {
            contextLines = l_contextLines_0
        });
        if v42 > 0 then
            v40 = string.sub(v40, v42 + 1);
            v41 = string.sub(v41, v42 + 1);
        end;
        local v43 = v35(v40, v41, {
            contextLines = l_contextLines_0
        });
        if v43 > 0 then
            v40 = string.sub(v40, 1, -v43 - 1);
            v41 = string.sub(v41, 1, -v43 - 1);
        end;
        return (v1.diff(v40, v41, {
            contextLines = l_contextLines_0, 
            expand = false, 
            omitAnnotationLines = true, 
            aColor = v13, 
            bColor = v11, 
            patchColor = v7, 
            changeColor = v9, 
            commonColor = v5
        }));
    end;
end;
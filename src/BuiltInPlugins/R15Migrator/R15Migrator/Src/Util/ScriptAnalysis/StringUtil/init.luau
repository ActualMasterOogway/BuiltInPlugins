local v2 = {
    CharAt = function(v0, v1) --[[ Line: 3 ]] --[[ Name: CharAt ]]
        return (string.sub(v0, v1, v1));
    end
};
v2.MatchBefore = function(v3, v4, v5, v6) --[[ Line: 7 ]] --[[ Name: MatchBefore ]]
    -- upvalues: v2 (copy)
    if v6 and v4 - 1 < 1 then
        return true;
    elseif v4 - 1 >= 1 and string.match(v2.CharAt(v3, v4 - 1), v5) then
        return true;
    else
        return false;
    end;
end;
v2.MatchAfter = function(v7, v8, v9, v10) --[[ Line: 18 ]] --[[ Name: MatchAfter ]]
    -- upvalues: v2 (copy)
    if v10 and v8 + 1 > string.len(v7) then
        return true;
    elseif v8 + 1 <= string.len(v7) and string.match(v2.CharAt(v7, v8 + 1), v9) then
        return true;
    else
        return false;
    end;
end;
v2.MatchBeforeAndAfter = function(v11, v12, v13, v14, v15, v16, v17) --[[ Line: 29 ]] --[[ Name: MatchBeforeAndAfter ]]
    -- upvalues: v2 (copy)
    if v2.MatchBefore(v11, v12, v14, v16) then
        return v2.MatchAfter(v11, v13, v15, v17);
    else
        return false;
    end;
end;
v2.MatchBeforeOrAfter = function(v18, v19, v20, v21, v22, v23, v24) --[[ Line: 36 ]] --[[ Name: MatchBeforeOrAfter ]]
    -- upvalues: v2 (copy)
    return v2.MatchBefore(v18, v19, v21, v23) or v2.MatchAfter(v18, v20, v22, v24);
end;
v2.SkipLeadingWhitespace = function(v25) --[[ Line: 41 ]] --[[ Name: SkipLeadingWhitespace ]]
    -- upvalues: v2 (copy)
    for v26 = 1, string.len(v25) do
        if v2.CharAt(v25, v26) ~= " " and v2.CharAt(v25, v26) ~= "\t" then
            return v26;
        end;
    end;
    return nil;
end;
v2.RemoveWhitespace = function(v27) --[[ Line: 51 ]] --[[ Name: RemoveWhitespace ]]
    return string.gsub(v27, "%s", "");
end;
v2.ForEachLine = function(v28, v29) --[[ Line: 55 ]] --[[ Name: ForEachLine ]]
    local v30 = 1;
    for v31, v32 in v28:gmatch("([^\r\n]*)([\r\n]*)") do
        v29(v31, v30);
        v30 = v30 + #v32:gsub("\n+", "\000%0\000"):gsub(".%z.", "."):gsub("%z", "");
    end;
end;
v2.FindFirstWholeWord = function(v33, v34, v35) --[[ Line: 63 ]] --[[ Name: FindFirstWholeWord ]]
    local v36 = v35 or 1;
    local v37 = #v33;
    local _ = {};
    while v36 <= v37 do
        local v39, v40 = v33:find(v34, v36, true);
        if v39 then
            local v41 = v33:sub(v39 - 1, v39 - 1);
            local v42 = v33:sub(v40 + 1, v40 + 1);
            if (v39 == 1 or v41 == " " or v41 == "\t") and (v40 == v37 or v42 == " " or v42 == "\t") then
                return v39, v40;
            else
                v36 = v40 + 1;
            end;
        else
            break;
        end;
    end;
end;
return v2;
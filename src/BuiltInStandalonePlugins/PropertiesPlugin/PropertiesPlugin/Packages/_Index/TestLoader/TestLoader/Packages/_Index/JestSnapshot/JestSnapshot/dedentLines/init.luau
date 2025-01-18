local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local _ = nil;
v2 = function(v9) --[[ Line: 16 ]] --[[ Name: getIndentationLength ]]
    local v10 = string.match(v9, "^[ ]+");
    if v10 == nil then
        return 0;
    else
        return v10:len() - v10:len() % 2;
    end;
end;
v3 = function(v11) --[[ Line: 26 ]] --[[ Name: dedentLine ]]
    -- upvalues: v2 (ref)
    return v11:sub(v2(v11) + 1);
end;
v4 = function(v12) --[[ Line: 33 ]] --[[ Name: hasUnmatchedDoubleQuoteMarks ]]
    local v13 = 0;
    local v14 = string.find(v12, "\"");
    while v14 do
        if v14 == 1 or string.sub(v12, v14 - 1, v14 - 1) ~= "\\" then
            v13 = v13 + 1;
        end;
        v14 = string.find(v12, "\"", v14 + 1);
    end;
    return v13 % 2 ~= 0;
end;
v5 = function(v15) --[[ Line: 49 ]] --[[ Name: isFirstLineOfTag ]]
    return string.find(v15, "^[ ]*<") ~= nil;
end;
v6 = function(v16, v17) --[[ Line: 59 ]] --[[ Name: dedentStartTag ]]
    -- upvalues: v3 (ref), v4 (ref), v5 (ref), v7 (ref)
    local v18 = v16[#v17 + 1];
    table.insert(v17, v3(v18));
    if string.find(v18, ">") then
        return true;
    else
        while true do
            if #v17 < #v16 then
                v18 = v16[#v17 + 1];
                if v4(v18) then
                    return false;
                elseif v5(v18) then
                    if not v7(v16, v17) then
                        return false;
                    end;
                else
                    table.insert(v17, v3(v18));
                    if string.find(v18, ">") then
                        return true;
                    end;
                end;
            else
                return false;
            end;
        end;
    end;
end;
v7 = function(v19, v20) --[[ Line: 94 ]] --[[ Name: dedentMarkup ]]
    -- upvalues: v6 (ref), v2 (ref), v5 (ref), v3 (ref)
    local v21 = v19[#v20 + 1];
    if not v6(v19, v20) then
        return false;
    elseif string.find(v19[#v20], "/>") then
        return true;
    else
        local v22 = false;
        local v23 = {};
        table.insert(v23, v2(v21));
        while true do
            if #v23 > 0 and #v20 < #v19 then
                v21 = v19[#v20 + 1];
                if v5(v21) then
                    if string.find(v21, "</") then
                        table.insert(v20, v3(v21));
                        table.remove(v23);
                    elseif not v6(v19, v20) then
                        return false;
                    elseif not string.find(v19[#v20], "/>") then
                        table.insert(v23, v2(v21));
                    end;
                    v22 = false;
                elseif v22 then
                    return false;
                else
                    table.insert(v20, v21:sub(v23[#v23] + 3));
                    v22 = true;
                end;
            else
                return #v23 == 0;
            end;
        end;
    end;
end;
return function(v24) --[[ Line: 145 ]] --[[ Name: dedentLines ]]
    -- upvalues: v4 (ref), v5 (ref), v7 (ref), v3 (ref)
    local v25 = {};
    while true do
        if #v25 < #v24 then
            local v26 = v24[#v25 + 1];
            if v4(v26) then
                return nil;
            elseif v5(v26) then
                if not v7(v24, v25) then
                    return nil;
                end;
            else
                table.insert(v25, v3(v26));
            end;
        else
            return v25;
        end;
    end;
end;
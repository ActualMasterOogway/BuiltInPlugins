local v0 = nil;
local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local _ = nil;
v0 = function(v7) --[[ Line: 14 ]] --[[ Name: getIndentationLength ]]
    local v8 = string.match(v7, "^[ ]+");
    if v8 == nil then
        return 0;
    else
        return v8:len() - v8:len() % 2;
    end;
end;
v1 = function(v9) --[[ Line: 24 ]] --[[ Name: dedentLine ]]
    -- upvalues: v0 (ref)
    return v9:sub(v0(v9) + 1);
end;
v2 = function(v10) --[[ Line: 31 ]] --[[ Name: hasUnmatchedDoubleQuoteMarks ]]
    local v11 = 0;
    local v12 = string.find(v10, "\"");
    while v12 do
        if v12 == 1 or string.sub(v10, v12 - 1, v12 - 1) ~= "\\" then
            v11 = v11 + 1;
        end;
        v12 = string.find(v10, "\"", v12 + 1);
    end;
    return v11 % 2 ~= 0;
end;
v3 = function(v13) --[[ Line: 47 ]] --[[ Name: isFirstLineOfTag ]]
    return string.find(v13, "^[ ]*<") ~= nil;
end;
v4 = function(v14, v15) --[[ Line: 57 ]] --[[ Name: dedentStartTag ]]
    -- upvalues: v1 (ref), v2 (ref), v3 (ref), v5 (ref)
    local v16 = v14[#v15 + 1];
    table.insert(v15, v1(v16));
    if string.find(v16, ">") then
        return true;
    else
        while true do
            if #v15 < #v14 then
                v16 = v14[#v15 + 1];
                if v2(v16) then
                    return false;
                elseif v3(v16) then
                    if not v5(v14, v15) then
                        return false;
                    end;
                else
                    table.insert(v15, v1(v16));
                    if string.find(v16, ">") then
                        return true;
                    end;
                end;
            else
                return false;
            end;
        end;
    end;
end;
v5 = function(v17, v18) --[[ Line: 95 ]] --[[ Name: dedentMarkup ]]
    -- upvalues: v4 (ref), v0 (ref), v3 (ref), v1 (ref)
    local v19 = v17[#v18 + 1];
    if not v4(v17, v18) then
        return false;
    elseif string.find(v17[#v18], "/>") then
        return true;
    else
        local v20 = false;
        local v21 = {};
        table.insert(v21, v0(v19));
        while true do
            if #v21 > 0 and #v18 < #v17 then
                v19 = v17[#v18 + 1];
                if v3(v19) then
                    if string.find(v19, "</") then
                        table.insert(v18, v1(v19));
                        table.remove(v21);
                    elseif not v4(v17, v18) then
                        return false;
                    elseif not string.find(v17[#v18], "/>") then
                        table.insert(v21, v0(v19));
                    end;
                    v20 = false;
                elseif v20 then
                    return false;
                else
                    table.insert(v18, v19:sub(v21[#v21] + 3));
                    v20 = true;
                end;
            else
                return #v21 == 0;
            end;
        end;
    end;
end;
return function(v22) --[[ Line: 146 ]] --[[ Name: dedentLines ]]
    -- upvalues: v2 (ref), v3 (ref), v5 (ref), v1 (ref)
    local v23 = {};
    while true do
        if #v23 < #v22 then
            local v24 = v22[#v23 + 1];
            if v2(v24) then
                return nil;
            elseif v3(v24) then
                if not v5(v22, v23) then
                    return nil;
                end;
            else
                table.insert(v23, v1(v24));
            end;
        else
            return v23;
        end;
    end;
end;
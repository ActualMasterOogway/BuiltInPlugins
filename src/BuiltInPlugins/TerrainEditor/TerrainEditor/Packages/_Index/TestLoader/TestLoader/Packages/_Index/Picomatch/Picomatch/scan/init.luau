local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_String_0 = v2.String;
local v5 = require(l_Parent_0.utils);
local v6 = require(l_Parent_0.constants);
local l_CHAR_ASTERISK_0 = v6.CHAR_ASTERISK;
local l_CHAR_AT_0 = v6.CHAR_AT;
local l_CHAR_BACKWARD_SLASH_0 = v6.CHAR_BACKWARD_SLASH;
local l_CHAR_COMMA_0 = v6.CHAR_COMMA;
local l_CHAR_DOT_0 = v6.CHAR_DOT;
local l_CHAR_EXCLAMATION_MARK_0 = v6.CHAR_EXCLAMATION_MARK;
local l_CHAR_FORWARD_SLASH_0 = v6.CHAR_FORWARD_SLASH;
local l_CHAR_LEFT_CURLY_BRACE_0 = v6.CHAR_LEFT_CURLY_BRACE;
local l_CHAR_LEFT_PARENTHESES_0 = v6.CHAR_LEFT_PARENTHESES;
local l_CHAR_LEFT_SQUARE_BRACKET_0 = v6.CHAR_LEFT_SQUARE_BRACKET;
local l_CHAR_PLUS_0 = v6.CHAR_PLUS;
local l_CHAR_QUESTION_MARK_0 = v6.CHAR_QUESTION_MARK;
local l_CHAR_RIGHT_CURLY_BRACE_0 = v6.CHAR_RIGHT_CURLY_BRACE;
local l_CHAR_RIGHT_PARENTHESES_0 = v6.CHAR_RIGHT_PARENTHESES;
local l_CHAR_RIGHT_SQUARE_BRACKET_0 = v6.CHAR_RIGHT_SQUARE_BRACKET;
local function _(v22) --[[ Line: 30 ]] --[[ Name: isPathSeparator ]]
    -- upvalues: l_CHAR_FORWARD_SLASH_0 (copy), l_CHAR_BACKWARD_SLASH_0 (copy)
    local v23 = true;
    if v22 ~= l_CHAR_FORWARD_SLASH_0 then
        v23 = v22 == l_CHAR_BACKWARD_SLASH_0;
    end;
    return v23;
end;
local function _(v25) --[[ Line: 34 ]] --[[ Name: depth ]]
    -- upvalues: l_Boolean_0 (copy)
    if v25.isPrefix ~= true then
        v25.depth = l_Boolean_0.toJSBoolean(v25.isGlobstar) and 1e999 or 1;
    end;
end;
return function(v27, v28) --[[ Line: 57 ]] --[[ Name: scan ]]
    -- upvalues: l_String_0 (copy), l_CHAR_BACKWARD_SLASH_0 (copy), l_CHAR_LEFT_CURLY_BRACE_0 (copy), l_Boolean_0 (copy), l_CHAR_DOT_0 (copy), l_CHAR_COMMA_0 (copy), l_CHAR_RIGHT_CURLY_BRACE_0 (copy), l_CHAR_FORWARD_SLASH_0 (copy), l_CHAR_PLUS_0 (copy), l_CHAR_AT_0 (copy), l_CHAR_ASTERISK_0 (copy), l_CHAR_QUESTION_MARK_0 (copy), l_CHAR_EXCLAMATION_MARK_0 (copy), l_CHAR_LEFT_PARENTHESES_0 (copy), l_CHAR_RIGHT_PARENTHESES_0 (copy), l_CHAR_LEFT_SQUARE_BRACKET_0 (copy), l_CHAR_RIGHT_SQUARE_BRACKET_0 (copy), v5 (copy)
    local v29 = v28 or {};
    local v30 = #v27 + 1;
    local v31 = true;
    if v29.parts ~= true then
        v31 = v29.scanToEnd == true;
    end;
    local v32 = {};
    local v33 = {};
    local v34 = {};
    local l_v27_0 = v27;
    local v36 = 0;
    local v37 = 1;
    local v38 = 1;
    local v39 = false;
    local v40 = false;
    local v41 = false;
    local v42 = false;
    local v43 = false;
    local v44 = false;
    local v45 = false;
    local v46 = false;
    local v47 = false;
    local v48 = false;
    local v49 = 0;
    local v50 = nil;
    local v51 = nil;
    local v52 = {
        value = "", 
        depth = 0, 
        isGlob = false
    };
    local function _() --[[ Line: 86 ]] --[[ Name: eos ]]
        -- upvalues: v36 (ref), v30 (copy)
        return v30 <= v36;
    end;
    local function _() --[[ Line: 89 ]] --[[ Name: peek ]]
        -- upvalues: l_String_0 (ref), l_v27_0 (ref), v36 (ref)
        return l_String_0.charCodeAt(l_v27_0, v36 + 1);
    end;
    local function _() --[[ Line: 92 ]] --[[ Name: advance ]]
        -- upvalues: v50 (ref), v51 (ref), v36 (ref), l_String_0 (ref), l_v27_0 (ref)
        v50 = v51;
        v36 = v36 + 1;
        return l_String_0.charCodeAt(l_v27_0, v36);
    end;
    while v36 < v30 do
        v50 = v51;
        v36 = v36 + 1;
        v51 = l_String_0.charCodeAt(l_v27_0, v36);
        local v56 = nil;
        if v51 == l_CHAR_BACKWARD_SLASH_0 then
            v52.backslashes = true;
            v45 = v52.backslashes;
            v50 = v51;
            v36 = v36 + 1;
            v51 = l_String_0.charCodeAt(l_v27_0, v36);
            if v51 == l_CHAR_LEFT_CURLY_BRACE_0 then
                v44 = true;
            end;
            --[[ close >= 29 ]]
        elseif v44 == true or v51 == l_CHAR_LEFT_CURLY_BRACE_0 then
            v49 = v49 + 1;
            while v30 <= v36 ~= true do
                local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                v50 = v51;
                v36 = v36 + 1;
                v51 = l_String_0.charCodeAt(l_v27_0, v36);
                if l_toJSBoolean_0(v51) then
                    if v51 == l_CHAR_BACKWARD_SLASH_0 then
                        v52.backslashes = true;
                        v45 = v52.backslashes;
                        v50 = v51;
                        v36 = v36 + 1;
                        l_toJSBoolean_0 = l_String_0.charCodeAt(l_v27_0, v36);
                    elseif v51 == l_CHAR_LEFT_CURLY_BRACE_0 then
                        v49 = v49 + 1;
                    else
                        if v44 ~= true and v51 == l_CHAR_DOT_0 then
                            v50 = v51;
                            v36 = v36 + 1;
                            v51 = l_String_0.charCodeAt(l_v27_0, v36);
                            if v51 == l_CHAR_DOT_0 then
                                v52.isBrace = true;
                                v39 = v52.isBrace;
                                v52.isGlob = true;
                                v41 = v52.isGlob;
                                v48 = true;
                                if v31 == true then
                                    continue;
                                else
                                    break;
                                end;
                            end;
                        end;
                        if v44 ~= true and v51 == l_CHAR_COMMA_0 then
                            v52.isBrace = true;
                            v39 = v52.isBrace;
                            v52.isGlob = true;
                            v41 = v52.isGlob;
                            v48 = true;
                            if v31 ~= true then
                                break;
                            end;
                        elseif v51 == l_CHAR_RIGHT_CURLY_BRACE_0 then
                            v49 = v49 - 1;
                            if v49 == 0 then
                                v44 = false;
                                v52.isBrace = true;
                                v39 = v52.isBrace;
                                v48 = true;
                                break;
                            end;
                        end;
                    end;
                else
                    break;
                end;
            end;
            if v31 == true then
                --[[ close >= 29 ]]
            else
                --[[ close >= 29 ]]
                break;
            end;
        elseif v51 == l_CHAR_FORWARD_SLASH_0 then
            table.insert(v32, v36);
            table.insert(v33, v52);
            v52 = {
                value = "", 
                depth = 0, 
                isGlob = false
            };
            if v48 == true then
                --[[ close >= 29 ]]
            elseif v50 == l_CHAR_DOT_0 and v36 == v37 + 1 then
                v37 = v37 + 2;
                --[[ close >= 29 ]]
            else
                v38 = v36 + 1;
                --[[ close >= 29 ]]
            end;
        else
            if v29.noext ~= true then
                local v58 = true;
                if v51 ~= l_CHAR_PLUS_0 then
                    v58 = true;
                    if v51 ~= l_CHAR_AT_0 then
                        v58 = true;
                        if v51 ~= l_CHAR_ASTERISK_0 then
                            v58 = true;
                            if v51 ~= l_CHAR_QUESTION_MARK_0 then
                                v58 = v51 == l_CHAR_EXCLAMATION_MARK_0;
                            end;
                        end;
                    end;
                end;
                if v58 == true and l_String_0.charCodeAt(l_v27_0, v36 + 1) == l_CHAR_LEFT_PARENTHESES_0 then
                    v52.isGlob = true;
                    v41 = v52.isGlob;
                    v52.isExtglob = true;
                    v42 = v52.isExtglob;
                    v48 = true;
                    if v51 == l_CHAR_EXCLAMATION_MARK_0 and v36 == v37 then
                        v47 = true;
                    end;
                    if v31 == true then
                        while v30 <= v36 ~= true do
                            local l_toJSBoolean_1 = l_Boolean_0.toJSBoolean;
                            v50 = v51;
                            v36 = v36 + 1;
                            v51 = l_String_0.charCodeAt(l_v27_0, v36);
                            if l_toJSBoolean_1(v51) then
                                if v51 == l_CHAR_BACKWARD_SLASH_0 then
                                    v52.backslashes = true;
                                    v45 = v52.backslashes;
                                    v50 = v51;
                                    v36 = v36 + 1;
                                    v51 = l_String_0.charCodeAt(l_v27_0, v36);
                                elseif v51 == l_CHAR_RIGHT_PARENTHESES_0 then
                                    v52.isGlob = true;
                                    v41 = v52.isGlob;
                                    v48 = true;
                                    break;
                                end;
                            else
                                break;
                            end;
                        end;
                        --[[ close >= 29 ]]
                        continue;
                    else
                        --[[ close >= 29 ]]
                        break;
                    end;
                end;
            end;
            if v51 == l_CHAR_ASTERISK_0 then
                if v50 == l_CHAR_ASTERISK_0 then
                    v52.isGlobstar = true;
                    v43 = v52.isGlobstar;
                end;
                v52.isGlob = true;
                v41 = v52.isGlob;
                v48 = true;
                if v31 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif v51 == l_CHAR_QUESTION_MARK_0 then
                v52.isGlob = true;
                v41 = v52.isGlob;
                v48 = true;
                if v31 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif v51 == l_CHAR_LEFT_SQUARE_BRACKET_0 then
                while v30 <= v36 ~= true do
                    local l_toJSBoolean_2 = l_Boolean_0.toJSBoolean;
                    v50 = v51;
                    v36 = v36 + 1;
                    v56 = l_String_0.charCodeAt(l_v27_0, v36);
                    if l_toJSBoolean_2(v56) then
                        if v56 == l_CHAR_BACKWARD_SLASH_0 then
                            v52.backslashes = true;
                            v45 = v52.backslashes;
                            v50 = v51;
                            v36 = v36 + 1;
                            l_toJSBoolean_2 = l_String_0.charCodeAt(l_v27_0, v36);
                        elseif v56 == l_CHAR_RIGHT_SQUARE_BRACKET_0 then
                            v52.isBracket = true;
                            v40 = v52.isBracket;
                            v52.isGlob = true;
                            v41 = v52.isGlob;
                            v48 = true;
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                if v31 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif v29.nonegate ~= true and v51 == l_CHAR_EXCLAMATION_MARK_0 and v36 == v37 then
                v52.negated = true;
                v46 = v52.negated;
                v37 = v37 + 1;
                --[[ close >= 29 ]]
            elseif v29.noparen ~= true and v51 == l_CHAR_LEFT_PARENTHESES_0 then
                v52.isGlob = true;
                v41 = v52.isGlob;
                if v31 == true then
                    while v30 <= v36 ~= true do
                        local l_toJSBoolean_3 = l_Boolean_0.toJSBoolean;
                        v50 = v51;
                        v36 = v36 + 1;
                        v51 = l_String_0.charCodeAt(l_v27_0, v36);
                        if l_toJSBoolean_3(v51) then
                            if v51 == l_CHAR_LEFT_PARENTHESES_0 then
                                v52.backslashes = true;
                                v45 = v52.backslashes;
                                v50 = v51;
                                v36 = v36 + 1;
                                v51 = l_String_0.charCodeAt(l_v27_0, v36);
                            elseif v51 == l_CHAR_RIGHT_PARENTHESES_0 then
                                v48 = true;
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            elseif v41 == true then
                v48 = true;
                if v31 == true then
                    --[[ close >= 29 ]]
                else
                    --[[ close >= 29 ]]
                    break;
                end;
            else
                --[[ close >= 29 ]]
            end;
        end;
    end;
    if v29.noext == true then
        v42 = false;
        v41 = false;
    end;
    local l_l_v27_0_0 = l_v27_0;
    local v63 = "";
    local v64 = "";
    if v37 > 1 then
        v63 = l_String_0.slice(l_v27_0, 1, v37);
        l_v27_0 = l_String_0.slice(l_v27_0, v37);
        v38 = v38 - v37;
    end;
    if l_Boolean_0.toJSBoolean(l_l_v27_0_0) and v41 == true and v38 > 1 then
        l_l_v27_0_0 = l_String_0.slice(l_v27_0, 1, v38);
        v64 = l_String_0.slice(l_v27_0, v38);
    elseif v41 == true then
        l_l_v27_0_0 = "";
        v64 = l_v27_0;
    else
        l_l_v27_0_0 = l_v27_0;
    end;
    if l_Boolean_0.toJSBoolean(l_l_v27_0_0) and l_l_v27_0_0 ~= "" and l_l_v27_0_0 ~= "/" and l_l_v27_0_0 ~= l_v27_0 then
        local v65 = l_String_0.charCodeAt(l_l_v27_0_0, #l_l_v27_0_0);
        local v66 = true;
        if v65 ~= l_CHAR_FORWARD_SLASH_0 then
            v66 = v65 == l_CHAR_BACKWARD_SLASH_0;
        end;
        if v66 then
            l_l_v27_0_0 = l_String_0.slice(l_l_v27_0_0, 1, -1);
        end;
    end;
    if v29.unescape == true then
        if l_Boolean_0.toJSBoolean(v64) then
            v64 = v5.removeBackslashes(v64);
        end;
        if l_Boolean_0.toJSBoolean(l_l_v27_0_0) and v45 == true then
            l_l_v27_0_0 = v5.removeBackslashes(l_l_v27_0_0);
        end;
    end;
    local v67 = {
        prefix = v63, 
        input = v27, 
        start = v37, 
        base = l_l_v27_0_0, 
        glob = v64, 
        isBrace = v39, 
        isBracket = v40, 
        isGlob = v41, 
        isExtglob = v42, 
        isGlobstar = v43, 
        negated = v46, 
        negatedExtglob = v47
    };
    if v29.tokens == true then
        v67.maxDepth = 0;
        local l_v51_0 = v51;
        local v69 = true;
        if l_v51_0 ~= l_CHAR_FORWARD_SLASH_0 then
            v69 = l_v51_0 == l_CHAR_BACKWARD_SLASH_0;
        end;
        if not v69 then
            table.insert(v33, v52);
        end;
        v67.tokens = v33;
    end;
    if v29.parts == true or v29.tokens == true then
        local v70 = nil;
        for v71 = 1, #v32 do
            local v72 = if l_Boolean_0.toJSBoolean(v70) then v70 + 1 else v37;
            local v73 = v32[v71];
            local v74 = l_String_0.slice(v27, v72, v73);
            if l_Boolean_0.toJSBoolean(v29.tokens) then
                if v71 == 1 and v37 ~= 1 then
                    v33[v71].isPrefix = true;
                    v33[v71].value = v63;
                else
                    v33[v71].value = v74;
                end;
                local v75 = v33[v71];
                if v75.isPrefix ~= true then
                    v75.depth = l_Boolean_0.toJSBoolean(v75.isGlobstar) and 1e999 or 1;
                end;
                v67.maxDepth = v67.maxDepth + v33[v71].depth;
            end;
            if v71 ~= 1 or v74 ~= "" then
                table.insert(v34, v74);
            end;
            v70 = v73;
        end;
        if l_Boolean_0.toJSBoolean(v70) and v70 + 1 < #v27 then
            local v76 = l_String_0.slice(v27, v70 + 1);
            table.insert(v34, v76);
            if l_Boolean_0.toJSBoolean(v29.tokens) then
                v33[#v33].value = v76;
                local v77 = v33[#v33];
                if v77.isPrefix ~= true then
                    v77.depth = l_Boolean_0.toJSBoolean(v77.isGlobstar) and 1e999 or 1;
                end;
                v67.maxDepth = v67.maxDepth + v33[#v33].depth;
            end;
        end;
        v67.slashes = v32;
        v67.parts = v34;
    end;
    return v67;
end;
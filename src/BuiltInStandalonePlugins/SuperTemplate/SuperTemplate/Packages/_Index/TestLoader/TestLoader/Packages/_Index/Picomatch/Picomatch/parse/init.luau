local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_String_0 = v2.String;
local l_stringReplace_0 = require(l_Parent_0.stringUtils).stringReplace;
local v9 = require(l_Parent_1.RegExp);
local v10 = require(l_Parent_0.constants);
local v11 = require(l_Parent_0.utils);
local l_MAX_LENGTH_0 = v10.MAX_LENGTH;
local l_POSIX_REGEX_SOURCE_0 = v10.POSIX_REGEX_SOURCE;
local l_REGEX_NON_SPECIAL_CHARS_0 = v10.REGEX_NON_SPECIAL_CHARS;
local l_REGEX_SPECIAL_CHARS_BACKREF_0 = v10.REGEX_SPECIAL_CHARS_BACKREF;
local l_REPLACEMENTS_0 = v10.REPLACEMENTS;
local function v21(v17, v18) --[[ Line: 35 ]] --[[ Name: expandRange ]]
    -- upvalues: l_Array_0 (copy), v9 (copy), v11 (copy)
    if typeof(v18.expandRange) == "function" then
        return v18.expandRange(table.unpack(v17), v18);
    else
        l_Array_0.sort(v17);
        local v19 = ("[%s]"):format(l_Array_0.join(v17, "-"));
        if not pcall(function() --[[ Line: 43 ]]
            -- upvalues: v9 (ref), v19 (copy)
            v9(v19);
        end) then
            return l_Array_0.join(l_Array_0.map(v17, function(v20) --[[ Line: 49 ]]
                -- upvalues: v11 (ref)
                return v11.escapeRegex(v20);
            end), "..");
        else
            return v19;
        end;
    end;
end;
local function _(v22, v23) --[[ Line: 63 ]] --[[ Name: syntaxError ]]
    return ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format(v22, v23, v23);
end;
local v25 = nil;
local v29 = setmetatable({}, {
    __call = function(_, v27, v28) --[[ Line: 77 ]] --[[ Name: __call ]]
        -- upvalues: v25 (ref)
        return v25(v27, v28);
    end
});
v25 = function(v30, v31) --[[ Line: 82 ]] --[[ Name: parse_ ]]
    -- upvalues: l_Error_0 (copy), l_REPLACEMENTS_0 (copy), l_Object_0 (copy), l_MAX_LENGTH_0 (copy), l_Boolean_0 (copy), v11 (copy), v10 (copy), l_String_0 (copy), v9 (copy), v29 (copy), l_stringReplace_0 (copy), l_REGEX_SPECIAL_CHARS_BACKREF_0 (copy), l_POSIX_REGEX_SOURCE_0 (copy), l_Array_0 (copy), v21 (copy), l_REGEX_NON_SPECIAL_CHARS_0 (copy)
    local v32 = false;
    local v33 = false;
    if typeof(v30) ~= "string" then
        error(l_Error_0.new("TypeError: Expected a string"));
    end;
    v30 = l_REPLACEMENTS_0[v30] or v30;
    local v34 = l_Object_0.assign({}, v31);
    local v35 = if typeof(v34.maxLength) == "number" then math.min(l_MAX_LENGTH_0, v34.maxLength) else l_MAX_LENGTH_0;
    local v36 = #v30;
    if v35 < v36 then
        error(l_Error_0.new(("SyntaxError: Input length: %s, exceeds maximum allowed length: %s"):format(tostring(v36), (tostring(v35)))));
    end;
    local v37 = {
        type = "bos", 
        value = "", 
        output = v34.prepend or ""
    };
    local v38 = {
        v37
    };
    local v39 = l_Boolean_0.toJSBoolean(v34.capture) and "" or "?:";
    local v40 = v11.isWindows(v31);
    local v41 = v10.globChars(v40);
    local v42 = v10.extglobChars(v41);
    local l_DOT_LITERAL_0 = v41.DOT_LITERAL;
    local l_PLUS_LITERAL_0 = v41.PLUS_LITERAL;
    local l_SLASH_LITERAL_0 = v41.SLASH_LITERAL;
    local l_ONE_CHAR_0 = v41.ONE_CHAR;
    local l_DOTS_SLASH_0 = v41.DOTS_SLASH;
    local l_NO_DOT_0 = v41.NO_DOT;
    local l_NO_DOT_SLASH_0 = v41.NO_DOT_SLASH;
    local l_NO_DOTS_SLASH_0 = v41.NO_DOTS_SLASH;
    local l_QMARK_0 = v41.QMARK;
    local l_QMARK_NO_DOT_0 = v41.QMARK_NO_DOT;
    local l_STAR_0 = v41.STAR;
    local l_START_ANCHOR_0 = v41.START_ANCHOR;
    local function _(v55) --[[ Line: 128 ]] --[[ Name: globstar ]]
        -- upvalues: v39 (copy), l_START_ANCHOR_0 (copy), l_Boolean_0 (ref), l_DOTS_SLASH_0 (copy), l_DOT_LITERAL_0 (copy)
        return ("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(v55.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0);
    end;
    local v57 = l_Boolean_0.toJSBoolean(v34.dot) and "" or l_NO_DOT_0;
    local v58 = if l_Boolean_0.toJSBoolean(v34.dot) then l_QMARK_0 else l_QMARK_NO_DOT_0;
    local v59 = if v34.bash == true then ("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(v34.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0) else l_STAR_0;
    if l_Boolean_0.toJSBoolean(v34.capture) then
        v59 = ("(%s)"):format(v59);
    end;
    if typeof(v34.noext) == "boolean" then
        v34.noextglob = v34.noext;
    end;
    local v60 = {
        input = v30, 
        index = 0, 
        start = 1, 
        dot = v34.dot == true, 
        consumed = "", 
        output = "", 
        prefix = "", 
        backtrack = false, 
        negated = false, 
        brackets = 0, 
        braces = 0, 
        parens = 0, 
        quotes = 0, 
        globstar = false, 
        tokens = v38
    };
    v30 = v11.removePrefix(v30, v60);
    v36 = #v30;
    local v61 = {};
    local v62 = {};
    local v63 = {};
    local l_v37_0 = v37;
    local v65 = nil;
    local function _() --[[ Line: 180 ]] --[[ Name: eos ]]
        -- upvalues: v60 (copy), v36 (ref)
        return v60.index == v36;
    end;
    v60.peek = function(v67) --[[ Line: 183 ]]
        -- upvalues: v30 (ref), v60 (copy)
        local v68 = if v67 ~= nil then v67 else 1;
        return (string.sub(v30, v60.index + v68, v60.index + v68));
    end;
    local l_peek_0 = v60.peek;
    v60.advance = function() --[[ Line: 188 ]]
        -- upvalues: v60 (copy), v30 (ref)
        local l_v60_0 = v60;
        l_v60_0.index = l_v60_0.index + 1;
        return string.sub(v30, v60.index, v60.index) or "";
    end;
    local l_advance_0 = v60.advance;
    local function _() --[[ Line: 193 ]] --[[ Name: remaining ]]
        -- upvalues: v30 (ref), v60 (copy)
        return (string.sub(v30, v60.index + 1));
    end;
    local function _(v73, v74) --[[ Line: 196 ]] --[[ Name: consume ]]
        -- upvalues: v60 (copy)
        local v75 = v73 or "";
        local v76 = v74 or 0;
        local l_v60_1 = v60;
        l_v60_1.consumed = l_v60_1.consumed .. v75;
        l_v60_1 = v60;
        l_v60_1.index = l_v60_1.index + v76;
    end;
    local function _(v79) --[[ Line: 203 ]] --[[ Name: append ]]
        -- upvalues: v60 (copy)
        local l_v60_2 = v60;
        l_v60_2.output = l_v60_2.output .. if v79.output ~= nil then v79.output else v79.value;
        local v81 = v79.value or "";
        local l_v60_3 = v60;
        l_v60_3.consumed = l_v60_3.consumed .. v81;
        l_v60_3 = v60;
        l_v60_3.index = l_v60_3.index + 0;
    end;
    local function v87() --[[ Line: 208 ]] --[[ Name: negate ]]
        -- upvalues: l_peek_0 (copy), l_advance_0 (copy), v60 (copy)
        local v84 = 1;
        while l_peek_0() == "!" and (l_peek_0(2) ~= "(" or l_peek_0(3) == "?") do
            l_advance_0();
            local l_v60_4 = v60;
            l_v60_4.start = l_v60_4.start + 1;
            v84 = v84 + 1;
        end;
        if v84 % 2 == 0 then
            return false;
        else
            v60.negated = true;
            local l_v60_5 = v60;
            l_v60_5.start = l_v60_5.start + 1;
            return true;
        end;
    end;
    local function _(v88) --[[ Line: 226 ]] --[[ Name: increment ]]
        -- upvalues: v60 (copy), v63 (copy)
        local l_v60_6 = v60;
        l_v60_6[v88] = l_v60_6[v88] + 1;
        table.insert(v63, v88);
    end;
    local function _(v91) --[[ Line: 231 ]] --[[ Name: decrement ]]
        -- upvalues: v60 (copy), v63 (copy)
        local l_v60_7 = v60;
        l_v60_7[v91] = l_v60_7[v91] - 1;
        table.remove(v63);
    end;
    local function v103(v94) --[[ Line: 244 ]] --[[ Name: push ]]
        -- upvalues: l_v37_0 (ref), v60 (copy), v61 (copy), l_String_0 (ref), v59 (ref), l_Boolean_0 (ref), v38 (copy)
        if l_v37_0.type == "globstar" then
            local v95 = false;
            if v60.braces > 0 then
                v95 = true;
                if v94.type ~= "comma" then
                    v95 = v94.type == "brace";
                end;
            end;
            local v96 = true;
            if v94.extglob ~= true then
                v96 = if #v61 ~= 0 then v94.type == "pipe" or v94.type == "paren" else #v61;
            end;
            if v94.type ~= "slash" and v94.type ~= "paren" and not v95 and not v96 then
                v60.output = l_String_0.slice(v60.output, 0, -#l_v37_0.output);
                l_v37_0.type = "star";
                l_v37_0.value = "*";
                l_v37_0.output = v59;
                local l_v60_8 = v60;
                l_v60_8.output = l_v60_8.output .. l_v37_0.output;
            end;
        end;
        if #v61 ~= 0 and v94.type ~= "paren" then
            local v98 = v61[#v61];
            v98.inner = v98.inner .. v94.value;
        end;
        if l_Boolean_0.toJSBoolean(v94.value) or l_Boolean_0.toJSBoolean(v94.output) then
            local l_v60_9 = v60;
            l_v60_9.output = l_v60_9.output .. if v94.output ~= nil then v94.output else v94.value;
            local v100 = v94.value or "";
            local l_v60_10 = v60;
            l_v60_10.consumed = l_v60_10.consumed .. v100;
            l_v60_10 = v60;
            l_v60_10.index = l_v60_10.index + 0;
        end;
        if l_v37_0 ~= nil and l_v37_0.type == "text" and v94.type == "text" then
            local l_l_v37_0_0 = l_v37_0;
            l_l_v37_0_0.value = l_l_v37_0_0.value .. v94.value;
            l_v37_0.output = (l_v37_0.output or "") .. v94.value;
            return;
        else
            v94.prev = l_v37_0;
            table.insert(v38, v94);
            l_v37_0 = v94;
            return;
        end;
    end;
    local function v109(v104, v105) --[[ Line: 277 ]] --[[ Name: extglobOpen ]]
        -- upvalues: l_Object_0 (ref), v42 (copy), l_v37_0 (ref), v60 (copy), l_Boolean_0 (ref), v34 (copy), v63 (copy), v103 (copy), l_ONE_CHAR_0 (copy), l_advance_0 (copy), v61 (copy)
        local v106 = l_Object_0.assign({}, v42[v105], {
            conditions = 1, 
            inner = ""
        });
        v106.prev = l_v37_0;
        v106.parens = v60.parens;
        v106.output = v60.output;
        local v107 = (l_Boolean_0.toJSBoolean(v34.capture) and "(" or "") .. v106.open;
        local l_v60_11 = v60;
        l_v60_11.parens = l_v60_11.parens + 1;
        table.insert(v63, "parens");
        v103({
            type = v104, 
            value = v105, 
            output = l_Boolean_0.toJSBoolean(v60.output) and "" or l_ONE_CHAR_0
        });
        v103({
            type = "paren", 
            extglob = true, 
            value = l_advance_0(), 
            output = v107
        });
        table.insert(v61, v106);
    end;
    local function v116(v110) --[[ Line: 295 ]] --[[ Name: extglobClose ]]
        -- upvalues: l_Boolean_0 (ref), v34 (copy), v59 (ref), v39 (copy), l_START_ANCHOR_0 (copy), l_DOTS_SLASH_0 (copy), l_DOT_LITERAL_0 (copy), v60 (copy), v36 (ref), v9 (ref), v30 (ref), v29 (ref), l_Object_0 (ref), v31 (copy), v103 (copy), v65 (ref), v63 (copy)
        local v111 = v110.close .. (l_Boolean_0.toJSBoolean(v34.capture) and ")" or "");
        local v112 = nil;
        if v110.type == "negate" then
            local l_v59_0 = v59;
            if v110.inner ~= nil and #v110.inner > 1 and v110.inner:find("/", 1, true) ~= nil then
                local l_v34_0 = v34;
                l_v59_0 = ("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(l_v34_0.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0);
            end;
            if l_v59_0 ~= v59 or v60.index == v36 or v9("^\\)+$"):test((string.sub(v30, v60.index + 1))) then
                v110.close = (")$))%s"):format(l_v59_0);
                v111 = v110.close;
            end;
            if v110.inner:find("*", 1, true) ~= nil then
                v112 = string.sub(v30, v60.index + 1);
                if v112 and v9("^\\.[^\\\\/.]+$"):test(v112) then
                    v110.close = (")%s)%s)"):format(v29(v112, l_Object_0.assign({}, v31, {
                        fastpaths = false
                    })).output, l_v59_0);
                    v111 = v110.close;
                end;
            end;
            if v110.prev.type == "bos" then
                v60.negatedExtglob = true;
            end;
        end;
        v103({
            type = "paren", 
            extglob = true, 
            value = v65, 
            output = v111
        });
        local l_v60_12 = v60;
        l_v60_12.parens = l_v60_12.parens - 1;
        table.remove(v63);
    end;
    if v34.fastpaths ~= false and not v9("(^[*!]|[/()[\\]{}\"])"):test(v30) then
        local v117 = false;
        local v124 = l_stringReplace_0(v30, l_REGEX_SPECIAL_CHARS_BACKREF_0, function(v118, v119, v120, v121, v122, v123) --[[ Line: 347 ]]
            -- upvalues: v117 (ref), l_Boolean_0 (ref), l_QMARK_0 (copy), v58 (copy), l_DOT_LITERAL_0 (copy), v59 (ref)
            if v121 == "\\" then
                v117 = true;
                return v118;
            elseif v121 == "?" then
                if l_Boolean_0.toJSBoolean(v119) then
                    return v119 .. v121 .. if v122 ~= nil then string.rep(l_QMARK_0, #v122) else "";
                elseif v123 == 0 then
                    return v58 .. if v122 ~= nil then string.rep(l_QMARK_0, #v122) else "";
                else
                    return string.rep(l_QMARK_0, #v120);
                end;
            elseif v121 == "." then
                return string.rep(l_DOT_LITERAL_0, #v120);
            elseif v121 == "*" then
                if l_Boolean_0.toJSBoolean(v119) then
                    return v119 .. v121 .. if v122 ~= nil then v59 else "";
                else
                    return v59;
                end;
            elseif l_Boolean_0.toJSBoolean(v119) then
                return v118;
            else
                return (("\\%s"):format(v118));
            end;
        end);
        if v117 == true then
            if v34.unescape == true then
                error("not implemented");
            else
                error("not implemented");
            end;
        end;
        if v124 == v30 and v34.contains == true then
            v60.output = v30;
            return v60;
        else
            v60.output = v11.wrapOutput(v124, v60, v31);
            return v60;
        end;
    else
        while not (v60.index == v36) do
            v65 = l_advance_0();
            if v65 ~= "\000" then
                if v65 == "\\" then
                    local v125 = l_peek_0();
                    if (v125 ~= "/" or v34.bash == true) and v125 ~= "." and v125 ~= ";" then
                        if not l_Boolean_0.toJSBoolean(v125) then
                            v65 = v65 .. "\\";
                            v103({
                                type = "text", 
                                value = v65
                            });
                            continue;
                        else
                            local v126 = v9("^\\\\+");
                            local v127 = v60.index + 1;
                            v126 = v126:exec((string.sub(v30, v127)));
                            local v128 = 0;
                            if v126 ~= nil and #v126[1] > 2 then
                                v128 = #v126[1];
                                v60.index = v60.index + v128;
                                if v128 % 2 ~= 0 then
                                    v65 = v65 .. "\\";
                                end;
                            end;
                            v65 = if v34.unescape == true then l_advance_0() else v65 .. l_advance_0();
                            if v60.brackets == 0 then
                                v103({
                                    type = "text", 
                                    value = v65
                                });
                                continue;
                            end;
                        end;
                    else
                        continue;
                    end;
                end;
                if v60.brackets > 0 and (v65 ~= "]" or l_v37_0.value == "[" or l_v37_0.value == "[^") then
                    if v34.posix ~= false and v65 == ":" then
                        local v129 = l_String_0.slice(l_v37_0.value, 1);
                        if v129:find("[", 1, true) ~= nil then
                            l_v37_0.posix = true;
                            if v129:find(":", 1, true) ~= nil then
                                local v130 = l_String_0.lastIndexOf(l_v37_0.value, "[");
                                local v131 = l_String_0.slice(l_v37_0.value, 1, v130);
                                local v132 = l_POSIX_REGEX_SOURCE_0[l_String_0.slice(l_v37_0.value, v130 + 2)];
                                if v132 then
                                    local v133 = v131 .. v132;
                                    l_v37_0.value = v133;
                                    v60.backtrack = true;
                                    l_advance_0();
                                    if not l_Boolean_0.toJSBoolean(v37.output) and l_Array_0.indexOf(v38, l_v37_0) == 2 then
                                        v37.output = l_ONE_CHAR_0;
                                        continue;
                                    else
                                        continue;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v65 == "[" and l_peek_0() ~= ":" or v65 == "-" and l_peek_0() == "]" then
                        v65 = ("\\%s"):format(v65);
                    end;
                    if v65 == "]" and (l_v37_0.value == "[" or l_v37_0.value == "[^") then
                        v65 = ("\\%s"):format(v65);
                    end;
                    if v34.posix == true and v65 == "!" and l_v37_0.value == "[" then
                        v65 = "^";
                    end;
                    local v134 = l_v37_0.value .. v65;
                    l_v37_0.value = v134;
                    v134 = {
                        value = v65
                    };
                    v60.output = v60.output .. if v134.output ~= nil then v134.output else v134.value;
                    local v135 = v134.value or "";
                    v60.consumed = v60.consumed .. v135;
                    v60.index = v60.index + 0;
                elseif v60.quotes == 1 and v65 ~= "\"" then
                    v65 = v11.escapeRegex(v65);
                    local v136 = l_v37_0.value .. v65;
                    l_v37_0.value = v136;
                    v136 = {
                        value = v65
                    };
                    v60.output = v60.output .. if v136.output ~= nil then v136.output else v136.value;
                    local v137 = v136.value or "";
                    v60.consumed = v60.consumed .. v137;
                    v60.index = v60.index + 0;
                elseif v65 == "\"" then
                    v60.quotes = v60.quotes == 1 and 0 or 1;
                    if v34.keepQuotes == true then
                        v103({
                            type = "text", 
                            value = v65
                        });
                    end;
                elseif v65 == "(" then
                    v60.parens = v60.parens + 1;
                    table.insert(v63, "parens");
                    v103({
                        type = "paren", 
                        value = v65
                    });
                elseif v65 == ")" then
                    if v60.parens == 0 and v34.strictBrackets == true then
                        error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("opening", "(", "(")));
                    end;
                    local v138 = v61[#v61];
                    if v138 ~= nil and v60.parens == v138.parens + 1 then
                        v116((table.remove(v61)));
                    else
                        v103({
                            type = "paren", 
                            value = v65, 
                            output = l_Boolean_0.toJSBoolean(v60.parens) and ")" or "\\)"
                        });
                        v60.parens = v60.parens - 1;
                        table.remove(v63);
                    end;
                elseif v65 == "[" then
                    if v34.nobracket ~= true then
                        local v139 = v60.index + 1;
                        if string.sub(v30, v139):find("]", 1, true) ~= nil then
                            v60.brackets = v60.brackets + 1;
                            table.insert(v63, "brackets");
                            v32 = true;
                        end;
                    end;
                    if not v32 then
                        if v34.nobracket ~= true and v34.strictBrackets == true then
                            error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", "]", "]")));
                        end;
                        v65 = ("\\%s"):format(v65);
                    end;
                    v32 = false;
                    v103({
                        type = "bracket", 
                        value = v65
                    });
                elseif v65 == "]" then
                    if v34.nobracket == true or l_v37_0 ~= nil and l_v37_0.type == "bracket" and #l_v37_0.value == 1 then
                        v103({
                            type = "text", 
                            value = v65, 
                            output = ("\\%s"):format(v65)
                        });
                    elseif v60.brackets == 0 then
                        if v34.strictBrackets == true then
                            error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("opening", "[", "[")));
                        end;
                        v103({
                            type = "text", 
                            value = v65, 
                            output = ("\\%s"):format(v65)
                        });
                    else
                        v60.brackets = v60.brackets - 1;
                        table.remove(v63);
                        local v140 = l_String_0.slice(l_v37_0.value, 2);
                        if l_v37_0.posix ~= true and v140:sub(1, 1) == "^" and v140:find("/", 1, true) == nil then
                            v65 = ("/%s"):format(v65);
                        end;
                        local v141 = l_v37_0.value .. v65;
                        l_v37_0.value = v141;
                        v141 = {
                            value = v65
                        };
                        v60.output = v60.output .. if v141.output ~= nil then v141.output else v141.value;
                        local v142 = v141.value or "";
                        v60.consumed = v60.consumed .. v142;
                        v60.index = v60.index + 0;
                        if v34.literalBrackets ~= false and not v11.hasRegexChars(v140) then
                            v141 = v11.escapeRegex(l_v37_0.value);
                            v60.output = l_String_0.slice(v60.output, 1, -#l_v37_0.value);
                            if v34.literalBrackets == true then
                                v60.output = v60.output .. v141;
                                l_v37_0.value = v141;
                            else
                                local v143 = ("(%s%s|%s)"):format(v39, v141, l_v37_0.value);
                                l_v37_0.value = v143;
                                v60.output = v60.output .. l_v37_0.value;
                            end;
                        end;
                    end;
                elseif v65 == "{" and v34.nobrace ~= true then
                    v60.braces = v60.braces + 1;
                    table.insert(v63, "braces");
                    local v144 = {
                        type = "brace", 
                        value = v65, 
                        output = "(", 
                        outputIndex = #v60.output, 
                        tokensIndex = #v60.tokens
                    };
                    table.insert(v62, v144);
                    v103(v144);
                elseif v65 == "}" then
                    local v145 = v62[#v62];
                    if v34.nobrace == true or not l_Boolean_0.toJSBoolean(v145) then
                        v103({
                            type = "text", 
                            value = v65, 
                            output = v65
                        });
                    else
                        local v146 = ")";
                        if v145.dots == true then
                            local v147 = l_Array_0.slice(v38);
                            local v148 = {};
                            for v149 = #v147, 1, -1 do
                                table.remove(v38);
                                if v147[v149].type ~= "brace" then
                                    if v147[v149].type ~= "dots" then
                                        table.insert(v148, 1, v147[v149].value);
                                    end;
                                else
                                    break;
                                end;
                            end;
                            v146 = v21(v148, v34);
                            v60.backtrack = true;
                        end;
                        if v145.comma ~= true and v145.dots ~= true then
                            local v150 = l_String_0.slice(v60.output, 1, v145.outputIndex);
                            local v151 = l_Array_0.slice(v60.tokens, v145.tokensIndex);
                            v145.output = "\\{";
                            v145.value = v145.output;
                            v146 = "\\}";
                            v65 = v146;
                            v60.output = v150;
                            for _, v153 in ipairs(v151) do
                                v60.output = v60.output .. if l_Boolean_0.toJSBoolean(v153.output) then v153.output else v153.value;
                            end;
                        end;
                        v103({
                            type = "brace", 
                            value = v65, 
                            output = v146
                        });
                        v60.braces = v60.braces - 1;
                        table.remove(v63);
                        table.remove(v62);
                    end;
                elseif v65 == "|" then
                    if #v61 > 0 then
                        local v154 = v61[#v61];
                        v154.conditions = v154.conditions + 1;
                    end;
                    v103({
                        type = "text", 
                        value = v65
                    });
                elseif v65 == "," then
                    local l_v65_0 = v65;
                    local v156 = v62[#v62];
                    if l_Boolean_0.toJSBoolean(v156) and v63[#v63] == "braces" then
                        v156.comma = true;
                        l_v65_0 = "|";
                    end;
                    v103({
                        type = "comma", 
                        value = v65, 
                        output = l_v65_0
                    });
                elseif v65 == "/" then
                    if l_v37_0.type == "dot" and v60.index == v60.start + 1 then
                        v60.start = v60.index + 1;
                        v60.consumed = "";
                        v60.output = "";
                        table.remove(v38);
                        l_v37_0 = v37;
                    else
                        v103({
                            type = "slash", 
                            value = v65, 
                            output = l_SLASH_LITERAL_0
                        });
                    end;
                elseif v65 == "." then
                    if v60.braces > 0 and l_v37_0.type == "dot" then
                        if l_v37_0.value == "." then
                            l_v37_0.output = l_DOT_LITERAL_0;
                        end;
                        local v157 = v62[#v62];
                        l_v37_0.type = "dots";
                        local v158 = l_v37_0.output .. v65;
                        l_v37_0.output = v158;
                        v158 = l_v37_0.value .. v65;
                        l_v37_0.value = v158;
                        v157.dots = true;
                    elseif v60.braces + v60.parens == 0 and l_v37_0.type ~= "bos" and l_v37_0.type ~= "slash" then
                        v103({
                            type = "text", 
                            value = v65, 
                            output = l_DOT_LITERAL_0
                        });
                    else
                        v103({
                            type = "dot", 
                            value = v65, 
                            output = l_DOT_LITERAL_0
                        });
                    end;
                elseif v65 == "?" then
                    if not (l_Boolean_0.toJSBoolean(l_v37_0) and l_v37_0.value == "(") and v34.noextglob ~= true and l_peek_0() == "(" and l_peek_0(2) ~= "?" then
                        v109("qmark", v65);
                    elseif l_Boolean_0.toJSBoolean(l_v37_0) and l_v37_0.type == "paren" then
                        local v159 = l_peek_0();
                        local l_v65_1 = v65;
                        if v159 == "<" and not v11.supportsLookbehinds() then
                            error(l_Error_0.new("Node.js v10 or higher is required for regex lookbehinds"));
                        end;
                        if l_v37_0.value ~= "(" or v9("[!=<:]"):test(v159) then
                            if v159 == "<" then
                                local v161 = v9("<([!=]|\\w+>)");
                                local v162 = v60.index + 1;
                                v33 = v161:test((string.sub(v30, v162)));
                            else
                                v33 = true;
                            end;
                        end;
                        if not v33 then
                            if not v33 then
                                l_v65_1 = ("\\%s"):format(v65);
                            end;
                        end;
                        v33 = false;
                        v103({
                            type = "text", 
                            value = v65, 
                            output = l_v65_1
                        });
                    elseif v34.dot ~= true and (l_v37_0.type == "slash" or l_v37_0.type == "bos") then
                        v103({
                            type = "qmark", 
                            value = v65, 
                            output = l_QMARK_NO_DOT_0
                        });
                    else
                        v103({
                            type = "qmark", 
                            value = v65, 
                            output = l_QMARK_0
                        });
                    end;
                else
                    if v65 == "!" then
                        if v34.noextglob ~= true and l_peek_0() == "(" and (l_peek_0(2) ~= "?" or not v9("[!=<:]"):test(l_peek_0(3))) then
                            v109("negate", v65);
                            continue;
                        elseif v34.nonegate ~= true and v60.index == 1 then
                            v87();
                            continue;
                        end;
                    end;
                    if v65 == "+" then
                        if v34.noextglob ~= true and l_peek_0() == "(" and l_peek_0(2) ~= "?" then
                            v109("plus", v65);
                        elseif l_v37_0 ~= nil and l_v37_0.value == "(" or v34.regex == false then
                            v103({
                                type = "plus", 
                                value = v65, 
                                output = l_PLUS_LITERAL_0
                            });
                        elseif l_v37_0 ~= nil and (l_v37_0.type == "bracket" or l_v37_0.type == "paren" or l_v37_0.type == "brace") or v60.parens > 0 then
                            v103({
                                type = "plus", 
                                value = v65
                            });
                        else
                            v103({
                                type = "plus", 
                                value = l_PLUS_LITERAL_0
                            });
                        end;
                    elseif v65 == "@" then
                        if v34.noextglob ~= true and l_peek_0() == "(" and l_peek_0(2) ~= "?" then
                            v103({
                                type = "at", 
                                extglob = true, 
                                value = v65, 
                                output = ""
                            });
                        else
                            v103({
                                type = "text", 
                                value = v65
                            });
                        end;
                    elseif v65 ~= "*" then
                        if v65 == "$" or v65 == "^" then
                            v65 = ("\\%s"):format(v65);
                        end;
                        local l_match_0 = string.match;
                        local v164 = v60.index + 1;
                        l_match_0 = l_match_0(string.sub(v30, v164), l_REGEX_NON_SPECIAL_CHARS_0);
                        if l_match_0 ~= nil then
                            v65 = v65 .. l_match_0;
                            v60.index = v60.index + #l_match_0;
                        end;
                        v103({
                            type = "text", 
                            value = v65
                        });
                    elseif l_v37_0 ~= nil and (l_v37_0.type == "globstar" or l_v37_0.star == true) then
                        l_v37_0.type = "star";
                        l_v37_0.star = true;
                        local v165 = l_v37_0.value .. v65;
                        l_v37_0.value = v165;
                        l_v37_0.output = v59;
                        v60.backtrack = true;
                        v60.globstar = true;
                        local v166 = v65 or "";
                        v60.consumed = v60.consumed .. v166;
                        v60.index = v60.index + 0;
                    else
                        local v167 = v60.index + 1;
                        local v168 = string.sub(v30, v167);
                        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                        v167 = false;
                        if v34.noextglob ~= true then
                            v167 = v9("^\\([^?]"):test(v168);
                        end;
                        if l_toJSBoolean_0(v167) then
                            v109("star", v65);
                        elseif l_v37_0.type == "star" then
                            if v34.noglobstar == true then
                                v167 = v65 or "";
                                v60.consumed = v60.consumed .. v167;
                                v60.index = v60.index + 0;
                            else
                                l_toJSBoolean_0 = l_v37_0.prev;
                                v167 = l_toJSBoolean_0.prev;
                                local v170 = true;
                                if l_toJSBoolean_0.type ~= "slash" then
                                    v170 = l_toJSBoolean_0.type == "bos";
                                end;
                                local v171 = if l_Boolean_0.toJSBoolean(v167) then v167.type == "star" or v167.type == "globstar" else v167;
                                if v34.bash == true and (not v170 or v168:sub(1, 1) ~= nil and v168:sub(1, 1) ~= "/") then
                                    v103({
                                        type = "star", 
                                        value = v65, 
                                        output = ""
                                    });
                                else
                                    local v172 = false;
                                    if v60.braces > 0 then
                                        v172 = true;
                                        if l_toJSBoolean_0.type ~= "comma" then
                                            v172 = l_toJSBoolean_0.type == "brace";
                                        end;
                                    end;
                                    local v173 = false;
                                    if #v61 > 0 then
                                        v173 = true;
                                        if l_toJSBoolean_0.type ~= "pipe" then
                                            v173 = l_toJSBoolean_0.type == "paren";
                                        end;
                                    end;
                                    if not v170 and l_toJSBoolean_0.type ~= "paren" and not v172 and not v173 then
                                        v103({
                                            type = "star", 
                                            value = v65, 
                                            output = ""
                                        });
                                    else
                                        while l_String_0.slice(v168, 1, 4) == "/**" do
                                            local v174 = v60.index + 4;
                                            local v175 = v60.index + 4;
                                            local v176 = v30:sub(v174, v175);
                                            if not l_Boolean_0.toJSBoolean(v176) or v176 == "/" then
                                                v168 = l_String_0.slice(v168, 4);
                                                v60.consumed = v60.consumed .. "/**";
                                                v60.index = v60.index + 3;
                                            else
                                                break;
                                            end;
                                        end;
                                        if l_toJSBoolean_0.type == "bos" and v60.index == v36 then
                                            l_v37_0.type = "globstar";
                                            local v177 = l_v37_0.value .. v65;
                                            l_v37_0.value = v177;
                                            v177 = ("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(v34.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0);
                                            l_v37_0.output = v177;
                                            v60.output = l_v37_0.output;
                                            v60.globstar = true;
                                            local v178 = v65 or "";
                                            v60.consumed = v60.consumed .. v178;
                                            v60.index = v60.index + 0;
                                        elseif l_toJSBoolean_0.type == "slash" and l_toJSBoolean_0.prev.type ~= "bos" and not l_Boolean_0.toJSBoolean(v171) and v60.index == v36 then
                                            v60.output = l_String_0.slice(v60.output, 1, -#(l_toJSBoolean_0.output .. l_v37_0.output));
                                            l_toJSBoolean_0.output = ("(?:%s"):format(l_toJSBoolean_0.output);
                                            l_v37_0.type = "globstar";
                                            local v179 = ("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(v34.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0) .. (v34.strictSlashes and ")" or "|$)");
                                            l_v37_0.output = v179;
                                            v179 = l_v37_0.value .. v65;
                                            l_v37_0.value = v179;
                                            v60.globstar = true;
                                            v60.output = v60.output .. l_toJSBoolean_0.output .. l_v37_0.output;
                                            local v180 = v65 or "";
                                            v60.consumed = v60.consumed .. v180;
                                            v60.index = v60.index + 0;
                                        elseif l_toJSBoolean_0.type == "slash" and l_toJSBoolean_0.prev.type ~= "bos" and v168:sub(1, 1) == "/" then
                                            local v181 = v168:sub(2, 2) ~= nil and "|$" or "";
                                            v60.output = l_String_0.slice(v60.output, 1, -#(l_toJSBoolean_0.output .. l_v37_0.output));
                                            l_toJSBoolean_0.output = ("(?:%s"):format(l_toJSBoolean_0.output);
                                            l_v37_0.type = "globstar";
                                            local v182 = ("%s%s|%s%s)"):format(("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(v34.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0), l_SLASH_LITERAL_0, l_SLASH_LITERAL_0, v181);
                                            l_v37_0.output = v182;
                                            v182 = l_v37_0.value .. v65;
                                            l_v37_0.value = v182;
                                            v60.output = v60.output .. l_toJSBoolean_0.output .. l_v37_0.output;
                                            v60.globstar = true;
                                            local v183 = v65 .. l_advance_0() or "";
                                            v60.consumed = v60.consumed .. v183;
                                            v60.index = v60.index + 0;
                                            v103({
                                                type = "slash", 
                                                value = "/", 
                                                output = ""
                                            });
                                        elseif l_toJSBoolean_0.type == "bos" and v168:sub(1, 1) == "/" then
                                            l_v37_0.type = "globstar";
                                            local v184 = l_v37_0.value .. v65;
                                            l_v37_0.value = v184;
                                            v184 = ("(?:^|%s|%s%s)"):format(l_SLASH_LITERAL_0, ("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(v34.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0), l_SLASH_LITERAL_0);
                                            l_v37_0.output = v184;
                                            v60.output = l_v37_0.output;
                                            v60.globstar = true;
                                            local v185 = v65 .. l_advance_0() or "";
                                            v60.consumed = v60.consumed .. v185;
                                            v60.index = v60.index + 0;
                                            v103({
                                                type = "slash", 
                                                value = "/", 
                                                output = ""
                                            });
                                        else
                                            v60.output = l_String_0.slice(v60.output, 1, -#l_v37_0.output);
                                            l_v37_0.type = "globstar";
                                            local v186 = ("(%s(?:(?!%s%s).)*?)"):format(v39, l_START_ANCHOR_0, if l_Boolean_0.toJSBoolean(v34.dot) then l_DOTS_SLASH_0 else l_DOT_LITERAL_0);
                                            l_v37_0.output = v186;
                                            v186 = l_v37_0.value .. v65;
                                            l_v37_0.value = v186;
                                            v60.output = v60.output .. l_v37_0.output;
                                            v60.globstar = true;
                                            local v187 = v65 or "";
                                            v60.consumed = v60.consumed .. v187;
                                            v60.index = v60.index + 0;
                                        end;
                                    end;
                                end;
                            end;
                        else
                            l_toJSBoolean_0 = {
                                type = "star", 
                                value = v65, 
                                output = v59
                            };
                            if v34.bash == true then
                                l_toJSBoolean_0.output = ".*?";
                                if l_v37_0.type == "bos" or l_v37_0.type == "slash" then
                                    l_toJSBoolean_0.output = v57 .. l_toJSBoolean_0.output;
                                end;
                                v103(l_toJSBoolean_0);
                            elseif l_v37_0 ~= nil and (l_v37_0.type == "bracket" or l_v37_0.type == "paren") and v34.regex == true then
                                l_toJSBoolean_0.output = v65;
                                v103(l_toJSBoolean_0);
                            else
                                if v60.index == v60.start or l_v37_0.type == "slash" or l_v37_0.type == "dot" then
                                    if l_v37_0.type == "dot" then
                                        v60.output = v60.output .. l_NO_DOT_SLASH_0;
                                        v167 = l_v37_0.output .. l_NO_DOT_SLASH_0;
                                        l_v37_0.output = v167;
                                    elseif v34.dot == true then
                                        v60.output = v60.output .. l_NO_DOTS_SLASH_0;
                                        v167 = l_v37_0.output .. l_NO_DOTS_SLASH_0;
                                        l_v37_0.output = v167;
                                    else
                                        v60.output = v60.output .. v57;
                                        v167 = l_v37_0.output .. v57;
                                        l_v37_0.output = v167;
                                    end;
                                    if l_peek_0() ~= "*" then
                                        v60.output = v60.output .. l_ONE_CHAR_0;
                                        v167 = l_v37_0.output .. l_ONE_CHAR_0;
                                        l_v37_0.output = v167;
                                    end;
                                end;
                                v103(l_toJSBoolean_0);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        while v60.brackets > 0 do
            if v34.strictBrackets == true then
                error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", "]", "]")));
            end;
            v60.output = v11.escapeLast(v60.output, "[");
            v60.brackets = v60.brackets - 1;
            table.remove(v63);
        end;
        while v60.parens > 0 do
            if v34.strictBrackets == true then
                error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", ")", ")")));
            end;
            v60.output = v11.escapeLast(v60.output, "(");
            v60.parens = v60.parens - 1;
            table.remove(v63);
        end;
        while v60.braces > 0 do
            if v34.strictBrackets == true then
                error(l_Error_0.new("SyntaxError: " .. ("Missing %s: \"%s\" - use \"\\%s\" to match literal characters"):format("closing", "}", "}")));
            end;
            v60.output = v11.escapeLast(v60.output, "{");
            v60.braces = v60.braces - 1;
            table.remove(v63);
        end;
        if v34.strictSlashes ~= true and (l_v37_0.type == "star" or l_v37_0.type == "bracket") then
            v103({
                type = "maybe_slash", 
                value = "", 
                output = ("%s?"):format(l_SLASH_LITERAL_0)
            });
        end;
        if v60.backtrack == true then
            v60.output = "";
            for _, v189 in ipairs(v60.tokens) do
                v60.output = v60.output .. if v189.output ~= nil then v189.output else v189.value;
                if v189.suffix then
                    v60.output = v60.output .. v189.suffix;
                end;
            end;
        end;
        return v60;
    end;
end;
v29.fastpaths = function(v190, v191) --[[ Line: 1103 ]]
    -- upvalues: l_Object_0 (copy), l_MAX_LENGTH_0 (copy), l_Error_0 (copy), l_Boolean_0 (copy), l_REPLACEMENTS_0 (copy), v11 (copy), v10 (copy), v9 (copy)
    local v192 = l_Object_0.assign({}, v191);
    local v193 = if typeof(v192.maxLength) == "number" then math.min(l_MAX_LENGTH_0, v192.maxLength) else l_MAX_LENGTH_0;
    local v194 = #v190;
    if v193 < v194 then
        error(l_Error_0.new(("SyntaxError: Input length: %s, exceeds maximum allowed length: %s"):format(tostring(v194), (tostring(v193)))));
    end;
    v190 = l_Boolean_0.toJSBoolean(l_REPLACEMENTS_0[v190]) and l_REPLACEMENTS_0[v190] or v190;
    local v195 = v11.isWindows(v191);
    local v196 = v10.globChars(v195);
    local l_DOT_LITERAL_1 = v196.DOT_LITERAL;
    local l_SLASH_LITERAL_1 = v196.SLASH_LITERAL;
    local l_ONE_CHAR_1 = v196.ONE_CHAR;
    local l_DOTS_SLASH_1 = v196.DOTS_SLASH;
    local l_NO_DOT_1 = v196.NO_DOT;
    local l_NO_DOTS_0 = v196.NO_DOTS;
    local l_NO_DOTS_SLASH_1 = v196.NO_DOTS_SLASH;
    local l_STAR_1 = v196.STAR;
    local l_START_ANCHOR_1 = v196.START_ANCHOR;
    local v206 = if l_Boolean_0.toJSBoolean(v192.dot) then l_NO_DOTS_0 else l_NO_DOT_1;
    local v207 = if l_Boolean_0.toJSBoolean(v192.dot) then l_NO_DOTS_SLASH_1 else l_NO_DOT_1;
    local v208 = l_Boolean_0.toJSBoolean(v192.capture) and "" or "?:";
    local v209 = {
        negated = false, 
        prefix = ""
    };
    local v210 = v192.bash == true and ".*?" or l_STAR_1;
    if l_Boolean_0.toJSBoolean(v192.capture) then
        v210 = ("(%s)"):format(v210);
    end;
    local function _(v211) --[[ Line: 1145 ]] --[[ Name: globstar ]]
        -- upvalues: v210 (ref), v208 (copy), l_START_ANCHOR_1 (copy), l_Boolean_0 (ref), l_DOTS_SLASH_1 (copy), l_DOT_LITERAL_1 (copy)
        if v211.noglobstar == true then
            return v210;
        else
            return ("(%s(?:(?!%s%s).)*?)"):format(v208, l_START_ANCHOR_1, if l_Boolean_0.toJSBoolean(v211.dot) then l_DOTS_SLASH_1 else l_DOT_LITERAL_1);
        end;
    end;
    local function v213(v214) --[[ Line: 1156 ]] --[[ Name: create ]]
        -- upvalues: v206 (copy), l_ONE_CHAR_1 (copy), v210 (ref), l_DOT_LITERAL_1 (copy), l_SLASH_LITERAL_1 (copy), v207 (copy), v192 (copy), v208 (copy), l_START_ANCHOR_1 (copy), l_Boolean_0 (ref), l_DOTS_SLASH_1 (copy), v9 (ref), v213 (copy)
        if v214 == "*" then
            return ("%s%s%s"):format(v206, l_ONE_CHAR_1, v210);
        elseif v214 == ".*" then
            return ("%s%s%s"):format(l_DOT_LITERAL_1, l_ONE_CHAR_1, v210);
        elseif v214 == "*.*" then
            return ("%s%s%s%s%s"):format(v206, v210, l_DOT_LITERAL_1, l_ONE_CHAR_1, v210);
        elseif v214 == "*/*" then
            return ("%s%s%s%s%s%s"):format(v206, v210, l_SLASH_LITERAL_1, l_ONE_CHAR_1, v207, v210);
        elseif v214 == "**" then
            local l_v206_0 = v206;
            local l_v192_0 = v192;
            return l_v206_0 .. if l_v192_0.noglobstar == true then v210 else ("(%s(?:(?!%s%s).)*?)"):format(v208, l_START_ANCHOR_1, if l_Boolean_0.toJSBoolean(l_v192_0.dot) then l_DOTS_SLASH_1 else l_DOT_LITERAL_1);
        elseif v214 == "**/*" then
            local v217 = "(?:%s%s%s)?%s%s%s";
            local l_v206_1 = v206;
            local l_v192_1 = v192;
            return v217:format(l_v206_1, if l_v192_1.noglobstar == true then v210 else ("(%s(?:(?!%s%s).)*?)"):format(v208, l_START_ANCHOR_1, if l_Boolean_0.toJSBoolean(l_v192_1.dot) then l_DOTS_SLASH_1 else l_DOT_LITERAL_1), l_SLASH_LITERAL_1, v207, l_ONE_CHAR_1, v210);
        elseif v214 == "**/*.*" then
            local v220 = "(?:%s%s%s)?%s%s%s%s%s";
            local l_v206_2 = v206;
            local l_v192_2 = v192;
            return v220:format(l_v206_2, if l_v192_2.noglobstar == true then v210 else ("(%s(?:(?!%s%s).)*?)"):format(v208, l_START_ANCHOR_1, if l_Boolean_0.toJSBoolean(l_v192_2.dot) then l_DOTS_SLASH_1 else l_DOT_LITERAL_1), l_SLASH_LITERAL_1, v207, v210, l_DOT_LITERAL_1, l_ONE_CHAR_1, v210);
        elseif v214 == "**/.*" then
            local v223 = "(?:%s%s%s)?%s%s%s";
            local l_v206_3 = v206;
            local l_v192_3 = v192;
            return v223:format(l_v206_3, if l_v192_3.noglobstar == true then v210 else ("(%s(?:(?!%s%s).)*?)"):format(v208, l_START_ANCHOR_1, if l_Boolean_0.toJSBoolean(l_v192_3.dot) then l_DOTS_SLASH_1 else l_DOT_LITERAL_1), l_SLASH_LITERAL_1, l_DOT_LITERAL_1, l_ONE_CHAR_1, v210);
        else
            local v226 = v9("^(.*?)\\.(\\w+)$"):exec(v214);
            if not l_Boolean_0.toJSBoolean(v226) then
                return nil;
            else
                local v227 = v213(v226[2]);
                if not l_Boolean_0.toJSBoolean(v227) then
                    return nil;
                else
                    return v227 .. l_DOT_LITERAL_1 .. v226[3];
                end;
            end;
        end;
    end;
    local v228 = v213((v11.removePrefix(v190, v209)));
    if v228 ~= nil and l_Boolean_0.toJSBoolean(v228) and v192.strictSlashes ~= true then
        v228 = v228 .. ("%s?"):format(l_SLASH_LITERAL_1);
    end;
    return v228;
end;
return v29;
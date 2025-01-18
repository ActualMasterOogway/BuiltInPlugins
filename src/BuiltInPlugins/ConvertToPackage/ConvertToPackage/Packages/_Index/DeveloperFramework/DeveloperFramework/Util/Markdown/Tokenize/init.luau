local _ = require(script.Parent.Types);
local l_insert_0 = table.insert;
return function(v2) --[[ Line: 9 ]] --[[ Name: tokenize ]]
    -- upvalues: l_insert_0 (copy)
    local v3 = {
        ["\n"] = {
            {
                "LINE_BREAK", 
                "^\n", 
                "^\n", 
                1
            }, 
            {
                "HEADING", 
                "^[#]+", 
                "^([#]+)"
            }, 
            {
                "DIVIDER", 
                "^[-]+[ \t]*\n", 
                "^([-]+)[ \t]*\n", 
                1
            }, 
            {
                "DIVIDER_2", 
                "^[=]+[ \t]*\n", 
                "^([=]+)[ \t]*\n", 
                1
            }, 
            {
                "BULLET_LIST_ITEM", 
                "^%s*%*", 
                "^(%s*)(%*)"
            }, 
            {
                "BULLET_LIST_ITEM_2", 
                "^%s*-", 
                "^(%s*)(-)"
            }, 
            {
                "CODE_BLOCK", 
                "^```[%w]*", 
                "^```([%w]*)"
            }, 
            {
                "QUOTE", 
                "^%s*>"
            }, 
            {
                "ORDERED_LIST_ITEM", 
                "^%s*[0-9A-Za-z]+%.", 
                "^(%s*)([0-9A-Za-z]+)%."
            }, 
            {
                "TABLE_ROW", 
                "^|"
            }
        }, 
        ["\\"] = {
            {
                "ESCAPE", 
                "^\\.", 
                "^\\(.)"
            }
        }, 
        ["-"] = {
            {
                "TABLE_HEADER", 
                "^[-]+"
            }
        }, 
        ["="] = {
            {
                "TABLE_HEADER_2", 
                "^[=]+"
            }
        }, 
        ["!"] = {
            {
                "IMAGE", 
                "^!%[[^%]]+%]%([^%)]+%)", 
                "^!%[([^%]]+)%]%(([^%)]+)%)"
            }
        }, 
        ["|"] = {
            {
                "TABLE_DIVIDER", 
                "^|"
            }
        }, 
        ["<"] = {
            {
                "OPEN_CLOSE", 
                "^<[^>]*/>", 
                "^<([%w-]+)%s?([^>]*)/>"
            }, 
            {
                "CLOSE", 
                "^</[^>]*>", 
                "^</([%w-]+)%s?([^>]*)>"
            }, 
            {
                "OPEN", 
                "^<[^>]*>", 
                "^<([%w-]+)%s?([^>]*)>"
            }
        }, 
        ["*"] = {
            {
                "BOLD_2", 
                "^%*%*"
            }, 
            {
                "BOLD", 
                "^%*"
            }
        }, 
        _ = {
            {
                "ITALIC_2", 
                "^__"
            }, 
            {
                "ITALIC", 
                "^_"
            }
        }, 
        ["~"] = {
            {
                "STRIKE", 
                "^~"
            }
        }, 
        ["["] = {
            {
                "LINK", 
                "^%[[^%]]+%]%([^%)]+%)", 
                "^%[([^%]]+)%]%(([^%)]+)%)"
            }, 
            {
                "ACTION", 
                "^%[%[[^%]]+%]%]", 
                "^%[%[([^%]]+)%]%]"
            }
        }, 
        ["`"] = {
            {
                "INLINE_CODE", 
                "^`"
            }
        }
    };
    local v4 = 0;
    local v5 = 0;
    local v6 = {};
    while v4 <= #v2 do
        local v7 = v4 == 0 and "\n" or v2:sub(v4, v4);
        local v8 = v3[v7];
        local v9 = false;
        if v8 then
            local v10 = v7 == "\n" and 1 or 0;
            local v11 = v2:sub(v4 + v10);
            for _, v13 in v8 do
                local v14 = v11:match(v13[2]);
                if v14 then
                    local v15 = v13[1];
                    local v16 = v13[3];
                    local v17 = v13[4] or 0;
                    local v18 = #v14 - v17;
                    if v4 ~= v5 then
                        l_insert_0(v6, {
                            name = "TEXT", 
                            text = v2:sub(v5, v4 - 1), 
                            offset = v5
                        });
                    end;
                    l_insert_0(v6, {
                        name = v15, 
                        text = v14, 
                        capture = if v16 then {
                            v11:match(v16)
                        } else nil, 
                        isBlock = v7 == "\n", 
                        offset = v4
                    });
                    v4 = v4 + (v10 + v18);
                    v5 = v4;
                    v9 = true;
                    break;
                end;
            end;
        end;
        if not v9 then
            v4 = v4 + 1;
        end;
    end;
    if v4 ~= v5 then
        l_insert_0(v6, {
            name = "TEXT", 
            text = v2:sub(v5, v4 - 1), 
            offset = v5
        });
    end;
    return v6;
end;
local v0 = {
    create = "create", 
    devforum = "devforum", 
    talenthub = "talent", 
    www = "www"
};
local v1 = "(h*t*p*s?:*/*%a*)(.?)(roblox.com)([/+%w|%" .. table.concat({
    "/", 
    "?", 
    "=", 
    "_", 
    "-", 
    "~", 
    "%", 
    "+", 
    "&"
}, "|%") .. "]*)";
local function _(v2) --[[ Line: 41 ]] --[[ Name: createPlainTextLinkifyItem ]]
    return {
        IsLink = false, 
        Text = v2
    };
end;
local function _(v4, v5) --[[ Line: 49 ]] --[[ Name: addToTableOrAppendTextToPreviousTextInTable ]]
    if #v4 > 0 then
        local v6 = v4[#v4];
        if v6.IsLink then
            table.insert(v4, {
                IsLink = false, 
                Text = v5
            });
            return;
        else
            v4[#v4].Text = v6.Text .. v5;
            return;
        end;
    else
        table.insert(v4, {
            IsLink = false, 
            Text = v5
        });
        return;
    end;
end;
return function(v8, v9) --[[ Line: 63 ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v10 = v9 or v0;
    local v11 = {};
    local v12 = 1;
    local v13 = 1;
    local l_v8_0 = v8;
    while v12 do
        local _ = nil;
        local v16 = nil;
        local _ = nil;
        local v18 = nil;
        local v19 = nil;
        local v20, v21, v22, v23, v24, v25 = l_v8_0:find(v1);
        v12 = v20;
        v13 = v21;
        v16 = v22;
        v18 = v23;
        v18 = v24;
        v19 = v25;
        if v12 and v13 then
            if v12 ~= 1 then
                v20 = l_v8_0:sub(1, v12 - 1);
                if #v11 > 0 then
                    v21 = v11[#v11];
                    if v21.IsLink then
                        table.insert(v11, {
                            IsLink = false, 
                            Text = v20
                        });
                    else
                        v11[#v11].Text = v21.Text .. v20;
                    end;
                else
                    table.insert(v11, {
                        IsLink = false, 
                        Text = v20
                    });
                end;
            end;
            v20 = nil;
            v21 = nil;
            if v16 and v16 ~= "" then
                v22 = nil;
                v23 = nil;
                v24 = nil;
                local v26, v27, v28;
                v25, v26, v27, v28 = v16:find("(https?://)(%a*)");
                v22 = v25;
                v23 = v26;
                v21 = v27;
                v24 = v28;
                if not v22 or not v23 then
                    v24 = v16;
                end;
                v20 = if v24 ~= "" and v24 then v10[string.lower(v24)] else v10.www;
            else
                v20 = v10.www;
            end;
            v22 = l_v8_0:sub(v12, v13);
            v23 = if v21 then v22 else "https://" .. v22;
            if v20 then
                table.insert(v11, {
                    IsLink = true, 
                    Text = v22, 
                    UrlInfo = {
                        Link = v23, 
                        Slug = v19, 
                        SubDomain = v20
                    }
                });
            elseif #v11 > 0 then
                v24 = v11[#v11];
                if v24.IsLink then
                    table.insert(v11, {
                        IsLink = false, 
                        Text = v22
                    });
                else
                    v11[#v11].Text = v24.Text .. v22;
                end;
            else
                table.insert(v11, {
                    IsLink = false, 
                    Text = v22
                });
            end;
            v24 = string.len(l_v8_0);
            if v13 == v24 then
                l_v8_0 = "";
                break;
            else
                l_v8_0 = l_v8_0:sub((v13 or 0) + 1, v24);
            end;
        else
            break;
        end;
    end;
    if string.len(l_v8_0) > 0 then
        local l_l_v8_0_0 = l_v8_0;
        if #v11 > 0 then
            local v30 = v11[#v11];
            if v30.IsLink then
                table.insert(v11, {
                    IsLink = false, 
                    Text = l_l_v8_0_0
                });
                return v11;
            else
                v11[#v11].Text = v30.Text .. l_l_v8_0_0;
                return v11;
            end;
        else
            table.insert(v11, {
                IsLink = false, 
                Text = l_l_v8_0_0
            });
        end;
    end;
    return v11;
end;
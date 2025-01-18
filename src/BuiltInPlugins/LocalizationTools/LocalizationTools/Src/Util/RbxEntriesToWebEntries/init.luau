local function _(v0) --[[ Line: 4 ]] --[[ Name: SetToList ]]
    local v1 = {};
    for v2 in pairs(v0) do
        table.insert(v1, v2);
    end;
    return v1;
end;
local function _(v4) --[[ Line: 12 ]] --[[ Name: SetToSortedList ]]
    local v5 = {};
    for v6 in pairs(v4) do
        table.insert(v5, v6);
    end;
    local l_v5_0 = v5;
    table.sort(l_v5_0);
    return l_v5_0;
end;
return function(v9, v10, v11, v12) --[[ Line: 31 ]]
    local v13 = {};
    local v14 = 0;
    local v15 = 0;
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local function _(v19) --[[ Line: 48 ]] --[[ Name: IsLanguageSupported ]]
        -- upvalues: v10 (copy), v11 (copy)
        return v10[v19] or v11 ~= nil and v11[v19] ~= nil;
    end;
    local function v27(v21) --[[ Line: 52 ]] --[[ Name: RbxEntriesToTranslationEntries ]]
        -- upvalues: v10 (copy), v11 (copy), v16 (copy), v15 (ref), v12 (copy), v18 (copy), v17 (copy)
        local v22 = {};
        for v23, v24 in pairs(v21) do
            local v25 = v23:lower();
            if v10[v25] or v11 ~= nil and v11[v25] ~= nil then
                table.insert(v22, {
                    locale = v25, 
                    translationText = v24
                });
                v16[v25] = true;
                v15 = v15 + 1;
                if v12 ~= nil then
                    local v26 = v11[v25] or v25;
                    if not v12[v26] then
                        v18[v26] = true;
                    end;
                end;
            else
                v17[v23] = true;
            end;
        end;
        return v22;
    end;
    for _, v29 in ipairs(v9) do
        local v30 = v27(v29.Values);
        table.insert(v13, {
            identifier = {
                key = v29.Key or "", 
                context = v29.Context or "", 
                source = v29.Source or ""
            }, 
            metadata = {
                example = v29.Example or ""
            }, 
            translations = v30, 
            delete = false
        });
        v14 = v14 + 1;
    end;
    local v31 = {
        entries = v13, 
        totalRows = v14, 
        totalTranslations = v15
    };
    local l_concat_0 = table.concat;
    local v33 = {};
    for v34 in pairs(v16) do
        table.insert(v33, v34);
    end;
    local l_v33_0 = v33;
    table.sort(l_v33_0);
    v31.supportedLocales = l_concat_0(l_v33_0, ", ");
    l_concat_0 = table.concat;
    v33 = {};
    for v36 in pairs(v17) do
        table.insert(v33, v36);
    end;
    l_v33_0 = v33;
    table.sort(l_v33_0);
    v31.unsupportedLocales = l_concat_0(l_v33_0, ", ");
    l_concat_0 = table.concat;
    v33 = {};
    for v37 in pairs(v18) do
        table.insert(v33, v37);
    end;
    l_v33_0 = v33;
    table.sort(l_v33_0);
    v31.newLanguages = l_concat_0(l_v33_0, ", ");
    v31.newLanguagesSet = v18;
    return v31;
end;
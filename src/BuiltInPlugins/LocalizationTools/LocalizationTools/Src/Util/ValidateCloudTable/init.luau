local function v1(v0) --[[ Line: 15 ]] --[[ Name: isTableEmpty ]]
    return #v0 == 0;
end;
local function _(v2) --[[ Line: 19 ]] --[[ Name: isEmpty ]]
    local v3 = true;
    if v2 ~= nil then
        v3 = v2 == "";
    end;
    return v3;
end;
local function v12(v5, v6, v7, v8, v9, v10, v11) --[[ Line: 23 ]] --[[ Name: appendCloudTableUploadError ]]
    table.insert(v5, v7:getText("UploadTable", v6, {
        key = "\"" .. v8 .. "\"", 
        source = "\"" .. v9 .. "\"", 
        context = "\"" .. v10 .. "\"", 
        example = "\"" .. v11 .. "\""
    }));
end;
local function _(v13) --[[ Line: 44 ]] --[[ Name: normalizeString ]]
    local v14 = true;
    if v13 ~= nil then
        v14 = v13 == "";
    end;
    if v14 then
        return "";
    elseif v13 ~= nil then
        return v13;
    else
        return "";
    end;
end;
local function v30(v16, v17, v18, v19, v20, v21) --[[ Line: 56 ]] --[[ Name: normalizeStrings ]]
    -- upvalues: v12 (copy)
    local v22 = true;
    if v20 ~= nil then
        v22 = v20 == "";
    end;
    local v23 = v22 and "" or if v20 ~= nil then v20 else "";
    local v24 = true;
    if v18 ~= nil then
        v24 = v18 == "";
    end;
    v22 = v24 and "" or if v18 ~= nil then v18 else "";
    local v25 = true;
    if v21 ~= nil then
        v25 = v21 == "";
    end;
    v24 = v25 and "" or if v21 ~= nil then v21 else "";
    local v26 = true;
    if v19 ~= nil then
        v26 = v19 == "";
    end;
    v25 = v26 and "" or if v19 ~= nil then v19 else "";
    v26 = utf8.len(v23);
    local v27 = utf8.len(v22);
    local v28 = utf8.len(v24);
    local v29 = utf8.len(v25);
    if type(v26) ~= "number" or game:GetFastInt("LocalizationToolsCloudTableContextLength") < v26 then
        v12(v16, "ContextTooLong", v17, v22, v25, v23, v24);
    end;
    if type(v27) ~= "number" or game:GetFastInt("LocalizationToolsCloudTableKeyLength") < v27 then
        v12(v16, "KeyTooLong", v17, v22, v25, v23, v24);
    end;
    if type(v28) ~= "number" or game:GetFastInt("LocalizationToolsCloudTableExampleLength") < v28 then
        v12(v16, "ExampleTooLong", v17, v22, v25, v23, v24);
    end;
    if type(v29) ~= "number" or game:GetFastInt("LocalizationToolsCloudTableSourceLength") < v29 then
        v12(v16, "SourceTooLong", v17, v22, v25, v23, v24);
    end;
    return v22, v25, v23, v24;
end;
return {
    isTableEmpty = v1, 
    tableContainsInvalidEntries = function(v31, v32) --[[ Line: 101 ]] --[[ Name: tableContainsInvalidEntries ]]
        -- upvalues: v30 (copy)
        local v33 = {};
        local v34 = {};
        for _, v36 in ipairs(v31) do
            if v36.Values ~= nil then
                for v37, v38 in pairs(v36.Values) do
                    local v39 = utf8.len(v37);
                    if type(v39) ~= "number" or game:GetFastInt("LocalizationToolsCloudTableLocaleLength") < v39 then
                        table.insert(v34, v32:getText("UploadTable", "LocaleTooLong", {
                            locale = "\"" .. v37 .. "\"", 
                            translation = "\"" .. v38 .. "\""
                        }));
                    end;
                    local v40 = utf8.len(v38);
                    if type(v40) ~= "number" or game:GetFastInt("LocalizationToolsCloudTableTranslationLength") < v40 then
                        table.insert(v34, v32:getText("UploadTable", "TranslationTooLong", {
                            locale = "\"" .. v37 .. "\"", 
                            translation = "\"" .. v38 .. "\""
                        }));
                    end;
                end;
            end;
            local v41, v42, v43, _ = v30(v34, v32, v36.Key, v36.Source, v36.Context, v36.Example);
            local v45 = true;
            if v42 ~= nil then
                v45 = v42 == "";
            end;
            if v45 then
                table.insert(v34, v32:getText("UploadTable", "EmptySourceError", {
                    key = "\"" .. v41 .. "\"", 
                    source = "\"" .. v42 .. "\"", 
                    context = "\"" .. v43 .. "\""
                }));
            elseif v33[v42] ~= nil and v33[v42][v43] ~= nil then
                table.insert(v34, v32:getText("UploadTable", "DuplicateSourceContextError", {
                    key = "\"" .. v41 .. "\"", 
                    source = "\"" .. v42 .. "\"", 
                    context = "\"" .. v43 .. "\""
                }));
            else
                if v33[v42] == nil then
                    v33[v42] = {};
                end;
                v33[v42][v43] = true;
            end;
        end;
        return #v34 ~= 0, v34;
    end
};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_document_0 = require(l_Parent_0.DomTestingLibrary).document;
return {
    toBeInTheDocument = function(v2, v3, _) --[[ Line: 11 ]] --[[ Name: toBeInTheDocument ]]
        -- upvalues: l_document_0 (copy)
        local v5 = {
            isNot = v2.isNot, 
            promise = v2.promise
        };
        local v6 = v3:IsDescendantOf(l_document_0);
        return {
            message = function() --[[ Line: 18 ]]
                -- upvalues: v2 (copy), v5 (copy)
                return v2.utils.matcherHint("toBeInTheDocument", nil, nil, v5) .. "\n\n" .. (v2.isNot and "element was found in the document" or "element could not be found in the document");
            end, 
            pass = v6
        };
    end, 
    toBeEmptyDOMElement = function(v7, v8, _) --[[ Line: 29 ]] --[[ Name: toBeEmptyDOMElement ]]
        local v10 = {
            isNot = v7.isNot, 
            promise = v7.promise
        };
        local v11 = #v8:GetChildren() == 0;
        return {
            message = function() --[[ Line: 36 ]]
                -- upvalues: v7 (copy), v10 (copy)
                return v7.utils.matcherHint("toBeEmptyDOMElement", nil, nil, v10) .. "\n\n" .. (v7.isNot and "element is empty" or "element is not empty");
            end, 
            pass = v11
        };
    end, 
    toHaveTextContent = function(v12, v13, v14) --[[ Line: 45 ]] --[[ Name: toHaveTextContent ]]
        if v13:IsA("TextBox") then
            error("toHaveTextContent is not meant to be used with TextBox");
        end;
        local l_Text_0 = v13.Text;
        local v16 = not v14 or v14 == "" or l_Text_0 == "";
        local v17 = nil;
        if typeof(v14) == "string" then
            v17 = string.find(l_Text_0, v14, 1, true);
        elseif typeof(v14) == "table" and typeof(v14.test) == "function" then
            v17 = v14:test(l_Text_0);
        else
            error("Unhandled expected value type: string or regex is required");
        end;
        local v18 = {
            isNot = v12.isNot, 
            promise = v12.promise
        };
        local v19 = not v16 and not not v17;
        return {
            message = function() --[[ Line: 69 ]]
                -- upvalues: v12 (copy), v18 (copy), v16 (copy)
                return v12.utils.matcherHint("toHaveTextContent", nil, nil, v18) .. "\n\n" .. (v16 and "Checking with empty string will always match, use .toBeEmptyDOMElement() instead" or "Expected element " .. (v12.isNot and "not to" or "to") .. " have text content");
            end, 
            pass = v19
        };
    end, 
    toHaveValue = function(v20, v21, v22) --[[ Line: 82 ]] --[[ Name: toHaveValue ]]
        if not v21:IsA("TextBox") then
            error("toHaveValue is meant to be used only with TextBox");
        end;
        local l_Text_1 = v21.Text;
        local v24 = nil;
        if typeof(v22) == "string" then
            v24 = string.find(l_Text_1, v22, 1, true);
        elseif typeof(v22) == "table" and typeof(v22.test) == "function" then
            v24 = v22:test(l_Text_1);
        else
            error("Unhandled expected value type: string or regex is required");
        end;
        local v25 = {
            isNot = v20.isNot, 
            promise = v20.promise
        };
        local v26 = not not v24;
        return {
            message = function() --[[ Line: 105 ]]
                -- upvalues: v20 (copy), v25 (copy)
                return v20.utils.matcherHint("toHaveValue", nil, nil, v25) .. "\n\n" .. "Expected element " .. (v20.isNot and "not to" or "to") .. " have value";
            end, 
            pass = v26
        };
    end
};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Src.Enum.GenerationErrorType);
local v2 = game:DefineFastFlag("MaterialGeneratorFixErrorParsing", false);
return function(v3) --[[ Line: 8 ]] --[[ Name: parseGenerationError ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v2 then
        if type(v3) == "table" then
            if string.find(v3.error, "429") then
                return v1.TooManyRequests;
            elseif string.find(v3.error, "500") then
                return v1.ServerError500;
            elseif string.find(v3.error, "504") then
                return v1.ServerError504;
            elseif string.find(v3.error, "TextFullyFiltered") then
                return v1.TextFullyFiltered;
            elseif string.find(v3.error, "AccountingFailed") and string.find(v3.error, "Decrementing account failed") then
                return v1.AccountingFailedDecrement;
            else
                return v1.CustomMessage, v3.error;
            end;
        else
            return v1.Unknown, nil;
        end;
    elseif type(v3) == "string" then
        if string.find(v3, "got network error status: 429") then
            return v1.TooManyRequests;
        elseif string.find(v3, "got network error status: 500") then
            return v1.ServerError500;
        elseif string.find(v3, "got network error status: 504") then
            return v1.ServerError504;
        elseif string.find(v3, "TextFullyFiltered") then
            return v1.TextFullyFiltered;
        elseif string.find(v3, "AccountingFailed") and string.find(v3, "Decrementing account failed") then
            return v1.AccountingFailedDecrement;
        else
            return v1.CustomMessage, v3;
        end;
    else
        return v1.Unknown, nil;
    end;
end;
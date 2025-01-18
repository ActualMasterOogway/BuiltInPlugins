return function(v0) --[[ Line: 3 ]]
    return v0:gsub(".", function(v1) --[[ Line: 4 ]]
        if v1 == "<" then
            return "&lt;";
        elseif v1 == ">" then
            return "&gt;";
        elseif v1 == "\"" then
            return "&quot;";
        elseif v1 == "'" then
            return "&apos;";
        elseif v1 == "&" then
            return "&amp;";
        else
            return v1;
        end;
    end);
end;
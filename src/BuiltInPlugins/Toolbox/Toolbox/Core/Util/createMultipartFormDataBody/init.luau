local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.AssetConfigConstants);
return function(v2) --[[ Line: 16 ]] --[[ Name: createMultipartFormDataBody ]]
    -- upvalues: v1 (copy)
    local v3 = "";
    for _, v5 in ipairs(v2) do
        v3 = v3 .. "--" .. v1.MULTIPART_FORM_BOUNDARY .. "\r\n";
        if v5.type then
            v3 = v3 .. "Content-Type: " .. v5.type .. "\r\n";
        end;
        if v5.disposition then
            v3 = v3 .. "Content-Disposition: form-data; ";
            local v6 = true;
            for v7, v8 in pairs(v5.disposition) do
                if not v6 then
                    v3 = v3 .. "; ";
                end;
                v6 = false;
                v3 = v3 .. v7 .. "=\"" .. v8 .. "\"";
            end;
            v3 = v3 .. "\r\n";
        end;
        v3 = (v3 .. "\r\n") .. v5.value .. "\r\n";
    end;
    return v3 .. "--" .. v1.MULTIPART_FORM_BOUNDARY .. "--" .. "\r\n";
end;
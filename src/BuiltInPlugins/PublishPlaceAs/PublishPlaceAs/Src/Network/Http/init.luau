local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
if l_BaseUrl_0:find("https://www.") == 1 then
    l_BaseUrl_0 = l_BaseUrl_0:sub(13);
elseif l_BaseUrl_0:find("http://www.") == 1 then
    l_BaseUrl_0 = l_BaseUrl_0:sub(12);
end;
local function v11(v6) --[[ Line: 17 ]] --[[ Name: applyParamsToUrl ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_Params_0 = v6.Params;
    v6.Params = nil;
    if l_Params_0 then
        local v8 = {};
        for v9, v10 in pairs(l_Params_0) do
            table.insert(v8, l_HttpService_0:UrlEncode(v9) .. "=" .. l_HttpService_0:UrlEncode(v10));
        end;
        v6.Url = v6.Url .. "?" .. table.concat(v8, "&");
    end;
end;
return {
    BuildRobloxUrl = function(v12, v13, ...) --[[ Line: 35 ]] --[[ Name: BuildRobloxUrl ]]
        -- upvalues: l_BaseUrl_0 (ref)
        return "https://" .. v12 .. "." .. l_BaseUrl_0 .. (string.format(v13, ...) or "");
    end, 
    Request = function(v14) --[[ Line: 39 ]] --[[ Name: Request ]]
        -- upvalues: v11 (copy), l_Promise_0 (copy), l_HttpRbxApiService_0 (copy)
        v11(v14);
        return l_Promise_0.new(function(v15, v16) --[[ Line: 42 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v14 (copy)
            spawn(function() --[[ Line: 44 ]]
                -- upvalues: l_HttpRbxApiService_0 (ref), v14 (ref), v15 (copy), v16 (copy)
                local l_status_0, l_result_0 = pcall(l_HttpRbxApiService_0.RequestAsync, l_HttpRbxApiService_0, v14);
                if l_status_0 then
                    v15(l_result_0);
                    return;
                else
                    v16(l_result_0);
                    return;
                end;
            end);
        end);
    end, 
    RequestInternal = function(v19) --[[ Line: 55 ]] --[[ Name: RequestInternal ]]
        -- upvalues: v11 (copy), l_Promise_0 (copy), l_HttpService_0 (copy)
        v11(v19);
        return l_Promise_0.new(function(v20, v21) --[[ Line: 58 ]]
            -- upvalues: l_HttpService_0 (ref), v19 (copy)
            spawn(function() --[[ Line: 60 ]]
                -- upvalues: l_HttpService_0 (ref), v19 (ref), v21 (copy), v20 (copy)
                l_HttpService_0:RequestInternal(v19):Start(function(v22, v23) --[[ Line: 61 ]]
                    -- upvalues: v21 (ref), v20 (ref)
                    if v22 then
                        if v23.StatusCode >= 400 then
                            v21("HTTP error: " .. tostring(v23.StatusCode));
                            return;
                        else
                            v20(v23.Body);
                            return;
                        end;
                    else
                        v21("HTTP error: " .. tostring(v23.HttpError));
                        return;
                    end;
                end);
            end);
        end);
    end
};
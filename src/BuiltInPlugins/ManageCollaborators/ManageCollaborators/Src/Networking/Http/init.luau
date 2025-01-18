local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v5 = require(l_Parent_0.Src.Util.Constants);
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
if l_BaseUrl_0:find("https://www.") then
    l_BaseUrl_0 = l_BaseUrl_0:sub(13);
elseif l_BaseUrl_0:find("http://www.") then
    l_BaseUrl_0 = l_BaseUrl_0:sub(12);
end;
local function v12(v7) --[[ Line: 18 ]] --[[ Name: applyParamsToUrl ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_Params_0 = v7.Params;
    v7.Params = nil;
    if l_Params_0 then
        local v9 = {};
        for v10, v11 in pairs(l_Params_0) do
            table.insert(v9, l_HttpService_0:UrlEncode(v10) .. "=" .. l_HttpService_0:UrlEncode(v11));
        end;
        v7.Url = v7.Url .. "?" .. table.concat(v9, "&");
    end;
end;
return {
    BuildRobloxUrl = function(v13, v14, ...) --[[ Line: 36 ]] --[[ Name: BuildRobloxUrl ]]
        -- upvalues: l_BaseUrl_0 (ref)
        return "https://" .. v13 .. "." .. l_BaseUrl_0 .. (string.format(v14, ...) or "");
    end, 
    Request = function(v15) --[[ Line: 40 ]] --[[ Name: Request ]]
        -- upvalues: v12 (copy), l_Promise_0 (copy), l_HttpRbxApiService_0 (copy)
        v12(v15);
        return l_Promise_0.new(function(v16, v17) --[[ Line: 43 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v15 (copy)
            spawn(function() --[[ Line: 45 ]]
                -- upvalues: l_HttpRbxApiService_0 (ref), v15 (ref), v16 (copy), v17 (copy)
                local l_status_0, l_result_0 = pcall(l_HttpRbxApiService_0.RequestAsync, l_HttpRbxApiService_0, v15);
                if l_status_0 then
                    v16(l_result_0);
                    return;
                else
                    v17(l_result_0);
                    return;
                end;
            end);
        end);
    end, 
    RequestInternal = function(v20) --[[ Line: 57 ]] --[[ Name: RequestInternal ]]
        -- upvalues: v12 (copy), l_Promise_0 (copy), l_HttpService_0 (copy), v5 (copy)
        v12(v20);
        return l_Promise_0.new(function(v21, v22) --[[ Line: 60 ]]
            -- upvalues: l_HttpService_0 (ref), v20 (copy), v5 (ref)
            spawn(function() --[[ Line: 62 ]]
                -- upvalues: l_HttpService_0 (ref), v20 (ref), v5 (ref), v22 (copy), v21 (copy)
                l_HttpService_0:RequestInternal(v20):Start(function(v23, v24) --[[ Line: 63 ]]
                    -- upvalues: v5 (ref), v22 (ref), v21 (ref)
                    if v23 then
                        if v24.StatusCode >= v5.BAD_REQUEST then
                            v22("HTTP error: " .. tostring(v24.StatusCode));
                            return;
                        else
                            v21(v24.Body);
                            return;
                        end;
                    else
                        v22("HTTP error: " .. tostring(v24.HttpError));
                        return;
                    end;
                end);
            end);
        end);
    end
};
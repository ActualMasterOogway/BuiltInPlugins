local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Http_0 = require(l_Parent_0.Packages.Framework).Http;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_Url_0 = require(l_Parent_0.Packages.Framework).RobloxAPI.Url;
local v5 = require(l_Parent_0.Src.Util.tablesDeepEqual);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local v8 = {
    "GET", 
    "POST", 
    "PUT", 
    "PATCH", 
    "DELETE"
};
local _, _, v18 = (function(v9) --[[ Line: 46 ]] --[[ Name: parseBaseUrlInformation ]]
    if v9:sub(#v9) ~= "/" then
        v9 = v9 .. "/";
    end;
    local _, v11 = v9:find("://");
    local v12, v13 = v9:find("%.", v11 + 1);
    local v14 = v9:sub(v11 + 1, v12 - 1);
    local v15 = v9:sub(v13 + 1);
    if v15[#v15] == "/" then
        v15 = v15:sub(1, #v15 - 1);
    end;
    return v9, v14, v15;
end)(l_ContentProvider_0.BaseUrl);
local function _(v19, v20, v21) --[[ Line: 71 ]] --[[ Name: constructUrl ]]
    -- upvalues: l_Url_0 (copy), v18 (copy)
    assert(v20:sub(1, 1) == "/", "Path must begin with '/'");
    return (l_Url_0.composeUrl("https://" .. v19 .. "." .. v18, v20:sub(2, -1), v21));
end;
local function _(v23) --[[ Line: 83 ]] --[[ Name: canBeCoalesced ]]
    local v24 = true;
    if v23 ~= "GET" then
        v24 = v23 == "PATCH";
    end;
    return v24;
end;
local function v26(v27, v28) --[[ Line: 87 ]] --[[ Name: deepJoin ]]
    -- upvalues: v26 (copy), v1 (copy)
    local v29 = {};
    for v30, v31 in pairs(v28) do
        if typeof(v31) == "table" and typeof(v27[v30]) == "table" then
            v29[v30] = v26(v27[v30], v31);
        else
            v29[v30] = v31;
        end;
    end;
    return v1.Dictionary.join(v27, v29);
end;
local v32 = {};
v32.__index = v32;
v32.new = function(v33) --[[ Line: 103 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), l_Http_0 (copy), v8 (copy), v32 (copy)
    v33 = v1.Dictionary.join({
        isInternal = true, 
        retryAmount = 3
    }, v33 or {});
    local v34 = {
        __retryAmount = v33.retryAmount, 
        __baseImpl = l_Http_0.Networking.new(v33), 
        __coalescedRequests = {}
    };
    for _, v36 in ipairs(v8) do
        v34.__coalescedRequests[v36] = {};
    end;
    return (setmetatable(v34, v32));
end;
v32.request = function(v37, v38, v39, v40) --[[ Line: 124 ]] --[[ Name: request ]]
    -- upvalues: l_Url_0 (copy), v18 (copy), v1 (copy)
    local l_Params_0 = v40.Params;
    assert(v39:sub(1, 1) == "/", "Path must begin with '/'");
    local v42 = l_Url_0.composeUrl("https://" .. v38 .. "." .. v18, v39:sub(2, -1), l_Params_0);
    v40 = v1.Dictionary.join(v40, {
        Params = v1.None, 
        Url = v42
    });
    l_Params_0 = v40.Method;
    local v43 = true;
    if l_Params_0 ~= "GET" then
        v43 = l_Params_0 == "PATCH";
    end;
    if v43 then
        return v37:__requestWithCoalesce(v40);
    else
        return v37:__requestWithoutCoalesce(v40);
    end;
end;
for _, v45 in pairs(v8) do
    v32[v45:lower()] = function(v46, v47, v48, v49) --[[ Line: 141 ]]
        -- upvalues: v1 (copy), v45 (copy)
        return v46:request(v47, v48, v1.Dictionary.join(v49 or {}, {
            Method = v45
        }));
    end;
end;
v32.__requestWithoutCoalesce = function(v50, v51) --[[ Line: 152 ]] --[[ Name: __requestWithoutCoalesce ]]
    -- upvalues: l_HttpService_0 (copy), v1 (copy)
    if v51.Body ~= nil then
        local v52 = nil;
        local v53 = true;
        local l_Headers_0 = v51.Headers;
        if typeof(l_Headers_0) == "table" then
            local v55 = l_Headers_0["Content-Type"];
            if v55 and string.find(v55, "multipart/form") then
                v53 = false;
            end;
        end;
        v52 = v53 and l_HttpService_0:JSONEncode(v51.Body) or v51.Body;
        v51 = v1.Dictionary.join(v51, {
            Body = v52, 
            Headers = v1.Dictionary.join({
                ["Content-Type"] = "application/json"
            }, v51.Headers or {})
        });
    end;
    local v56 = v50.__baseImpl:request(v51);
    return v50.__baseImpl:parseJson(v50.__baseImpl:handleRetry(v56, v50.__retryAmount));
end;
v32.__requestWithCoalesce = function(v57, v58) --[[ Line: 183 ]] --[[ Name: __requestWithCoalesce ]]
    -- upvalues: v26 (copy), l_HttpService_0 (copy), l_Promise_0 (copy), v1 (copy)
    local l_Method_0 = v58.Method;
    local l_Url_1 = v58.Url;
    local v61 = v57:__getExistingRequest(v58);
    if v61 then
        if l_Method_0 == "PATCH" then
            v61.options = v26(v61.options, {
                Body = v58.Body
            });
        end;
        return v61.promise;
    else
        local v62 = l_HttpService_0:GenerateGUID();
        local v63 = nil;
        local function v64() --[[ Line: 203 ]] --[[ Name: removeFromExistingRequests ]]
            -- upvalues: v57 (copy), l_Method_0 (copy), l_Url_1 (copy), v62 (copy)
            v57.__coalescedRequests[l_Method_0][l_Url_1][v62] = nil;
        end;
        if l_Method_0 == "GET" then
            v63 = v57:__requestWithoutCoalesce(v58);
            v63:andThen(v64, v64);
        elseif l_Method_0 == "PATCH" then
            v63 = l_Promise_0.new(function(v65, v66) --[[ Line: 214 ]]
                -- upvalues: v57 (copy), l_Method_0 (copy), l_Url_1 (copy), v62 (copy), v1 (ref), v58 (copy)
                spawn(function() --[[ Line: 215 ]]
                    -- upvalues: v57 (ref), l_Method_0 (ref), l_Url_1 (ref), v62 (ref), v1 (ref), v58 (ref), v65 (copy), v66 (copy)
                    local l_Body_0 = v57.__coalescedRequests[l_Method_0][l_Url_1][v62].options.Body;
                    v57:__requestWithoutCoalesce(v1.Dictionary.join(v58, {
                        Body = l_Body_0
                    })):andThen(v65, v66);
                    v57.__coalescedRequests[l_Method_0][l_Url_1][v62] = nil;
                end);
            end);
        else
            assert(false);
        end;
        v57.__coalescedRequests[l_Method_0][l_Url_1] = v57.__coalescedRequests[l_Method_0][l_Url_1] or {};
        v57.__coalescedRequests[l_Method_0][l_Url_1][v62] = {
            promise = v63, 
            options = v58
        };
        return v63;
    end;
end;
v32.__getExistingRequest = function(v68, v69) --[[ Line: 236 ]] --[[ Name: __getExistingRequest ]]
    -- upvalues: v1 (copy), v5 (copy)
    local l_Method_1 = v69.Method;
    local l_Url_2 = v69.Url;
    local v72 = v68.__coalescedRequests[l_Method_1][l_Url_2];
    if not v72 then
        return nil;
    else
        local v73 = v1.Dictionary.join(v69, {
            Body = v1.None
        });
        local v74 = nil;
        for _, v76 in pairs(v72) do
            local v77 = v1.Dictionary.join(v76.options, {
                Body = v1.None
            });
            if v5(v73, v77) then
                v74 = v76;
                break;
            end;
        end;
        if not v74 then
            return nil;
        else
            return v74;
        end;
    end;
end;
return v32;
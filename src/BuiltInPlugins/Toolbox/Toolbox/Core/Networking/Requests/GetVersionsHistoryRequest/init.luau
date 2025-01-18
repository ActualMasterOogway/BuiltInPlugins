local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.SetVersionHistoryData);
local v4 = require(l_Parent_0.Core.Actions.SetPackageDescriptions);
local v5 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
return function(v6, v7) --[[ Line: 28 ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v4 (copy), v3 (copy), v2 (copy)
    return function(v8) --[[ Line: 29 ]]
        -- upvalues: v5 (ref), v6 (copy), v7 (copy), l_HttpService_0 (ref), v4 (ref), v3 (ref), v2 (ref)
        if v5() then
            return v6:getVersionsHistory(v7, 50):andThen(function(v9) --[[ Line: 31 ]]
                -- upvalues: l_HttpService_0 (ref), v7 (ref), v6 (ref), v8 (copy), v4 (ref), v3 (ref)
                local l_responseBody_0 = v9.responseBody;
                local v11 = l_HttpService_0:JSONDecode(l_responseBody_0);
                local v12 = {};
                for _, v14 in pairs(v11.data) do
                    table.insert(v12, {
                        assetId = v7, 
                        assetVersionNumber = v14.assetVersionNumber
                    });
                end;
                v6:getVersionDescriptions(v12):andThen(function(v15) --[[ Line: 61 ]]
                    -- upvalues: v11 (copy), v8 (ref), v4 (ref)
                    local l_responseBody_1 = v15.responseBody;
                    local v17 = {};
                    for _, v19 in pairs(l_responseBody_1.data) do
                        if v19.message:gsub("%s+", "") ~= "" then
                            v17[v19.assetVersionNumber] = v19.message;
                        else
                            v17[v19.assetVersionNumber] = "";
                        end;
                    end;
                    for _, v21 in pairs(v11.data) do
                        if not v17[v21.assetVersionNumber] then
                            v17[v21.assetVersionNumber] = "";
                        end;
                    end;
                    if not l_responseBody_1.data or #l_responseBody_1.data == 0 then
                        for _, v23 in pairs(v11.data) do
                            v17[v23.assetVersionNumber] = "";
                        end;
                    end;
                    v8:dispatch(v4(v17));
                end);
                v8:dispatch(v3(v11.data));
            end, function(v24) --[[ Line: 84 ]]
                -- upvalues: v8 (copy), v2 (ref)
                v8:dispatch(v2(v24));
            end);
        else
            return v6:getVersionsHistory(v7):andThen(function(v25) --[[ Line: 88 ]]
                -- upvalues: l_HttpService_0 (ref), v8 (copy), v3 (ref)
                local l_responseBody_2 = v25.responseBody;
                local v27 = l_HttpService_0:JSONDecode(l_responseBody_2);
                v8:dispatch(v3(v27.data));
            end, function(v28) --[[ Line: 112 ]]
                -- upvalues: v8 (copy), v2 (ref)
                v8:dispatch(v2(v28));
            end);
        end;
    end;
end;
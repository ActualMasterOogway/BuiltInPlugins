local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.Screens);
return function(v3, v4, _, v6, v7) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v8 = v3.index and v3.index + 1 or 1;
    return function(v9) --[[ Line: 10 ]]
        -- upvalues: v7 (copy), v6 (copy), v3 (copy), v2 (ref), v4 (copy), v8 (ref), v1 (ref)
        local l_responseBody_0 = v9.responseBody;
        if not l_responseBody_0 then
            return;
        else
            if v7 and v6 then
                if not l_responseBody_0.FinalPage then
                    v3.pageNumber = v6 + 1;
                else
                    v3.pageNumber = nil;
                end;
            else
                v3.previousPageCursor = l_responseBody_0.previousPageCursor;
                v3.nextPageCursor = l_responseBody_0.nextPageCursor;
            end;
            local v11 = {};
            local v12 = v7 ~= nil and l_responseBody_0.Aliases or l_responseBody_0.data;
            for _, v14 in pairs(v12) do
                local v15 = {};
                if v7 then
                    v15.asset = v14.Asset;
                    v15.id = v14.TargetId;
                else
                    v15 = v14;
                end;
                v15.assetType = v2[v4].AssetType;
                v15.layoutOrder = v8;
                v8 = v8 + 1;
                local v16 = false;
                if v7 then
                    for v17, v18 in pairs(v7) do
                        if v18 and string.find(v14.Name, v17) then
                            v15.name = string.gsub(v14.Name, v17, "");
                            v16 = true;
                        elseif v16 then
                            break;
                        end;
                    end;
                    if not v16 then
                        continue;
                    end;
                end;
                v11 = v1.Dictionary.join(v11, {
                    [v7 ~= nil and v15.id or tostring(v14.id)] = v15
                });
            end;
            v3.assets = v1.Dictionary.join(v3.assets, v11);
            return v3, v8, l_responseBody_0.FinalPage;
        end;
    end;
end;
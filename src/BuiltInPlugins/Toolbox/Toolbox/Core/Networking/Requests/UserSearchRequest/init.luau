local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Parent_0.Core.Util.Urls);
local v4 = require(l_Parent_0.Core.Actions.SetLiveSearch);
local _ = function(v5, v6, _) --[[ Line: 10 ]] --[[ Name: searchUsers ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v5:getUsers(v6):andThen(function(v8) --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v3 (ref)
        local v9 = {};
        for _, v11 in ipairs(v8) do
            v9 = v2.List.join(v9, {
                {
                    Name = v11.Name, 
                    Id = v11.UserId, 
                    Thumbnail = v3.constructUserThumbnailUrl(v11.UserId)
                }
            });
        end;
        return v9;
    end);
end;
return function(v13, v14) --[[ Line: 26 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    return function(v15) --[[ Line: 27 ]]
        -- upvalues: v14 (copy), v4 (ref), v13 (copy), v2 (ref), v3 (ref)
        if #v14 < 3 then
            v15:dispatch(v4(v14, {}));
            return;
        else
            v13:getUsers(v14):andThen(function(v16) --[[ Line: 11 ]]
                -- upvalues: v2 (ref), v3 (ref)
                local v17 = {};
                for _, v19 in ipairs(v16) do
                    v17 = v2.List.join(v17, {
                        {
                            Name = v19.Name, 
                            Id = v19.UserId, 
                            Thumbnail = v3.constructUserThumbnailUrl(v19.UserId)
                        }
                    });
                end;
                return v17;
            end):andThen(function(v20) --[[ Line: 33 ]]
                -- upvalues: v15 (copy), v4 (ref), v14 (ref)
                v15:dispatch(v4(v14, v20));
            end);
            return;
        end;
    end;
end;
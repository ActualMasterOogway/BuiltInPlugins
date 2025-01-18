local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local v5 = require(l_script_FirstAncestor_0.Core.Actions.SetLiveSearch);
local v6 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local _ = require(l_script_FirstAncestor_0.Core.Types.CreatorTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.GroupTypes);
local v9 = require(l_script_FirstAncestor_0.Core.Types.ThumbnailTypes);
local function v17(v10, v11) --[[ Line: 18 ]] --[[ Name: getSearchedGroups ]]
    -- upvalues: v3 (copy), v4 (copy), v9 (copy)
    local v12 = {};
    if v11 then
        for _, v14 in pairs(v11) do
            local v15 = string.find(v14.name:lower(), v10:lower());
            local v16 = tonumber(v14.id);
            if not v16 and v3.shouldDebugWarnings() then
                warn("Toolbox: Group Id (" .. v14.id .. ") could not be converted to number. Using 0 instead.");
            end;
            if v15 then
                table.insert(v12, {
                    Name = v14.name, 
                    Id = v16 or 0, 
                    Thumbnail = v4.constructRBXThumbUrl(v9.Icon.GroupIcon, v14.id, 150), 
                    Type = Enum.CreatorType.Group
                });
            end;
        end;
    end;
    return v12;
end;
local function v28(v18, v19, v20, v21) --[[ Line: 42 ]] --[[ Name: getUsers ]]
    -- upvalues: v4 (copy), v17 (copy), v2 (copy), v3 (copy), v6 (copy)
    return v19:getUsers(v20):andThen(function(v22) --[[ Line: 48 ]]
        -- upvalues: v4 (ref), v17 (ref), v20 (copy), v21 (copy), v2 (ref)
        local v23 = {};
        for _, v25 in v22 do
            table.insert(v23, {
                Name = v25.Name, 
                Id = v25.UserId, 
                Thumbnail = v4.constructUserThumbnailUrl(v25.UserId), 
                Type = Enum.CreatorType.User
            });
        end;
        local v26 = v17(v20, v21);
        if #v26 > 0 then
            return (v2.List.join(v23, v26));
        else
            return v23;
        end;
    end, function(v27) --[[ Line: 62 ]]
        -- upvalues: v3 (ref), v18 (copy), v6 (ref)
        if v3.shouldDebugWarnings() then
            warn("Toolbox: Error in user endpoint");
        end;
        v18:dispatch(v6(v27));
        return {};
    end);
end;
return function(v29, v30, v31) --[[ Line: 71 ]]
    -- upvalues: v5 (copy), v28 (copy)
    return function(v32) --[[ Line: 72 ]]
        -- upvalues: v30 (copy), v5 (ref), v28 (ref), v29 (copy), v31 (copy)
        if #v30 < 3 then
            v32:dispatch(v5(v30, {}));
            return;
        else
            v28(v32, v29, v30, v31):andThen(function(v33) --[[ Line: 78 ]]
                -- upvalues: v32 (copy), v5 (ref), v30 (ref)
                if v33 and next(v33) then
                    v32:dispatch(v5(v30, v33));
                end;
            end);
            return;
        end;
    end;
end;
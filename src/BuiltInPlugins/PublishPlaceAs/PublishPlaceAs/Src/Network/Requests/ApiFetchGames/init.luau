local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Models.GameToPublish);
local v3 = require(l_Parent_0.Src.Network.Http);
local v4 = require(l_Parent_0.Src.Resources.Constants);
return function(v5) --[[ Line: 15 ]]
    -- upvalues: v4 (copy), v3 (copy), l_HttpService_0 (copy), v2 (copy)
    local _ = nil;
    local v7 = v5.type == v4.SUBJECT_TYPE.GROUP and "Group" or "User";
    local l_id_0 = v5.id;
    local l_cursor_0 = v5.cursor;
    local v10 = v5.limit or 10;
    local v11 = v5.search or "";
    local v12 = v5.sortOrder or "Desc";
    local v13 = v5.sort or "LastUpdated";
    local v14 = {
        Url = v3.BuildRobloxUrl("apis", "universes/v1/search"), 
        Method = "GET", 
        Params = {
            creatorType = v7, 
            creatorTargetId = l_id_0, 
            isArchived = "false", 
            pageIndex = l_cursor_0, 
            pageSize = v10, 
            search = v11, 
            sortOrder = v12, 
            sortParam = v13
        }
    };
    return v3.Request(v14):andThen(function(v15) --[[ Line: 42 ]]
        -- upvalues: l_HttpService_0 (ref), v5 (copy), v2 (ref)
        local v16 = l_HttpService_0:JSONDecode(v15);
        local v17 = v5.limit or 10;
        local v18 = {};
        if v16.nextResultIndex then
            v18.nextPageCursor = tostring((tonumber(v16.nextResultIndex / v17)));
        end;
        v18.games = {};
        for _, v20 in pairs(v16.data) do
            local v21, v22 = v2.fromJsonData(v20);
            if v21 then
                table.insert(v18.games, v22);
            else
                error("Parsing error for ApiFetchGamesByUserId: " .. v22);
            end;
        end;
        return v18;
    end);
end;
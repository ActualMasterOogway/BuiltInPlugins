local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local v2 = require(l_Parent_0.Util.React);
local l_Components_0 = l_Parent_0.UI.Components;
local v4 = require(l_Components_0.IconButton);
local v5 = require(l_Components_0.PaginatedTable);
local v6 = require(l_Parent_0.Util.DialogAction);
local v7 = require(script.Parent);
local v8 = {
    {
        Name = "Asset Name", 
        Key = "name"
    }, 
    {
        Name = "Owner", 
        Key = "owner"
    }, 
    {
        Name = "Asset ID", 
        Key = "id"
    }, 
    {
        Name = "Asset Type", 
        Key = "type"
    }
};
local v9 = {
    "Audio", 
    "Video", 
    "Image", 
    "Mesh"
};
local function v16(v10, v11, v12) --[[ Line: 47 ]] --[[ Name: generateRandomString ]]
    local v13 = "";
    for _ = 1, math.random(v10, v11) do
        local v15 = math.random(1, #v12);
        v13 = v13 .. v12:sub(v15, v15);
    end;
    return v13;
end;
local function v32(v17) --[[ Line: 60 ]] --[[ Name: PaginatedTableWrapper ]]
    -- upvalues: v2 (copy), v8 (copy), v1 (copy), v5 (copy)
    local v18, v19 = v2.useState(1);
    local v20, v21 = v2.useState({
        index = 1, 
        order = Enum.SortDirection.Descending
    });
    local v28 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v17 (copy), v8 (ref), v20 (copy)
        local v22 = table.clone(v17.Rows);
        table.sort(v22, function(v23, v24) --[[ Line: 69 ]]
            -- upvalues: v8 (ref), v20 (ref)
            local l_Key_0 = v8[v20.index].Key;
            local v26 = v23[l_Key_0];
            local v27 = v24[l_Key_0];
            if typeof(v26) == "string" then
                v26 = string.upper(v26);
                v27 = string.upper(v27);
            end;
            if v20.order == Enum.SortDirection.Ascending then
                return v27 < v26;
            else
                return v26 < v27;
            end;
        end);
        return v22;
    end, {
        v17.Rows, 
        v20
    });
    local v29 = v2.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v1 (ref), v28 (copy), v18 (copy)
        return v1.slice(v28, (v18 - 1) * 4 + 1, v18 * 4);
    end, {
        v28, 
        v18
    });
    return v2.createElement(v5, {
        Rows = v29, 
        Columns = v8, 
        PageIndex = v18, 
        PageCount = math.floor((#v17.Rows + 4 - 1) / 4), 
        PageSize = 4, 
        SortIndex = v20.index, 
        SortOrder = v20.order, 
        OnPageChange = v19, 
        OnSortChange = function(v30, v31) --[[ Line: 101 ]] --[[ Name: OnSortChange ]]
            -- upvalues: v21 (copy)
            v21({
                index = v30, 
                order = v31
            });
        end, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
end;
return {
    story = v2.createElement(function() --[[ Line: 112 ]] --[[ Name: TableDialogStory ]]
        -- upvalues: v2 (copy), v16 (copy), v9 (copy), v7 (copy), v32 (copy), v6 (copy), v4 (copy)
        local v35 = v2.useMemo(function() --[[ Line: 113 ]]
            -- upvalues: v16 (ref), v9 (ref)
            local v33 = {};
            for _ = 1, 20 do
                table.insert(v33, {
                    name = v16(10, 20, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"), 
                    owner = v16(6, 10, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"), 
                    id = tonumber((v16(8, 10, "1234567890"))), 
                    type = v9[math.random(1, #v9)]
                });
            end;
            return v33;
        end, {});
        local v39 = v2.useMemo(function() --[[ Line: 128 ]]
            -- upvalues: v35 (copy)
            local v36 = {};
            for _, v38 in v35 do
                if math.random() < 0.5 then
                    table.insert(v36, v38);
                end;
            end;
            return v36;
        end, {
            v35
        });
        local v40 = v7({
            Intent = "Error", 
            Heading = "Can't share access to assets", 
            Body = "You don't have access to share the listed assets. Please get access from the asset " .. "owners. The listed assets will not be available if you proceed without sharing " .. "access to this experience.", 
            Contents = v2.createElement(v32, {
                Rows = v39
            }), 
            ActionPrimary = v6.OK, 
            Width = 727
        });
        local v41 = v7({
            Intent = "Warning", 
            Heading = "Experience needs access to assets", 
            Body = "This experience needs access to the listed assets. You can only share access to " .. "assets that you have access to. The listed assets will not be available in this " .. "experience if you proceed without sharing access to this experience.", 
            Contents = v2.createElement(v32, {
                Rows = v35
            }), 
            ActionPrimary = {
                Label = "Share access", 
                HidesDialog = true, 
                OnActivated = v40
            }, 
            ActionSecondary = v6.CLOSE, 
            Width = 727
        });
        return v2.createElement(v4, {
            OnClick = v41, 
            Text = "Show Table Dialog"
        });
    end)
};
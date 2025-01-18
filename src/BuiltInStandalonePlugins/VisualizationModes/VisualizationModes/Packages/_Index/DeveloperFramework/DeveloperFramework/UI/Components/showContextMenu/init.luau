local l_HttpService_0 = game:GetService("HttpService");
local function _() --[[ Line: 46 ]] --[[ Name: newId ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:GenerateGUID();
end;
local v2 = nil;
local function v13(v3, v4, v5, v6) --[[ Line: 52 ]] --[[ Name: createPluginMenu ]]
    -- upvalues: l_HttpService_0 (copy), v2 (ref)
    local l_v3_PluginMenu_0 = v3:CreatePluginMenu(l_HttpService_0:GenerateGUID(), v4.Text, v4.Icon);
    if v5 then
        for _, v9 in ipairs(v5) do
            local v10 = v4[v9];
            v2(v3, l_v3_PluginMenu_0, v10, v6);
        end;
        return l_v3_PluginMenu_0;
    else
        for _, v12 in ipairs(v4) do
            v2(v3, l_v3_PluginMenu_0, v12, v6);
        end;
        return l_v3_PluginMenu_0;
    end;
end;
v2 = function(v14, v15, v16, v17) --[[ Line: 69 ]] --[[ Name: addActionToMenu ]]
    -- upvalues: v13 (copy), l_HttpService_0 (copy)
    if typeof(v16) == "table" then
        if #v16 > 0 then
            local v18 = v13(v14, v16, nil, v17);
            table.insert(v17, v18);
            v15:AddMenu(v18);
            return;
        elseif v16.ShowSeparator then
            v15:AddSeparator();
            return;
        else
            if v16.Id == nil then
                v16.Id = l_HttpService_0:GenerateGUID();
            end;
            local v19 = v15:AddNewAction(v16.Id, v16.Text, v16.Icon);
            v19.Enabled = v16.Enabled == nil or v16.Enabled;
            v19.Checked = v16.Checked;
            v19.Triggered:connect(function() --[[ Line: 86 ]]
                -- upvalues: v16 (copy)
                v16.OnItemClicked(v16);
            end);
            return;
        end;
    elseif typeof(v16) == "Instance" and v16:IsA("PluginAction") then
        v15:AddAction(v16);
        return;
    else
        if v16 then
            error("Unsupported action " .. tostring(v16));
        end;
        return;
    end;
end;
return function(v20, v21, v22) --[[ Line: 97 ]]
    -- upvalues: v13 (copy)
    local v23 = {};
    local v24 = v13(v20, v21, v22, v23);
    v24:ShowAsync();
    for _, v26 in ipairs(v23) do
        v26:Destroy();
    end;
    v24:Destroy();
end;
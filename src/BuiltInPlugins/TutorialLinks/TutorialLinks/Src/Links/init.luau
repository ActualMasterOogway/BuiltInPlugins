local l_GuiService_0 = game:GetService("GuiService");
local l_insert_0 = table.insert;
local v2 = {
    connections = {}
};
v2.addLinks = function(v3) --[[ Line: 9 ]] --[[ Name: addLinks ]]
    -- upvalues: v2 (copy)
    local l_v3_Children_0 = v3:GetChildren();
    for _, v6 in ipairs(l_v3_Children_0) do
        if v6:IsA("BillboardGui") or v6:IsA("SurfaceGui") then
            v2.addGui(v6);
        end;
    end;
end;
v2.removeLinks = function() --[[ Line: 18 ]] --[[ Name: removeLinks ]]
    -- upvalues: v2 (copy)
    for _, v8 in ipairs(v2.connections) do
        v8:Disconnect();
    end;
    v2.connections = {};
end;
v2.addGui = function(v9) --[[ Line: 25 ]] --[[ Name: addGui ]]
    -- upvalues: v2 (copy)
    local l_v9_Children_0 = v9:GetChildren();
    for _, v12 in ipairs(l_v9_Children_0) do
        if v12:IsA("TextButton") then
            v2.addLink(v12);
        end;
    end;
end;
v2.addLink = function(v13) --[[ Line: 34 ]] --[[ Name: addLink ]]
    -- upvalues: l_GuiService_0 (copy), v2 (copy), l_insert_0 (copy)
    if v13:GetAttribute("TutorialLink") then
        local v15 = v13.Activated:Connect(function() --[[ Line: 37 ]]
            -- upvalues: v13 (copy), l_GuiService_0 (ref)
            local l_v13_Attribute_0 = v13:GetAttribute("TutorialLink");
            l_GuiService_0:OpenBrowserWindow("https://create.roblox.com/" .. l_v13_Attribute_0);
        end);
        l_insert_0(v2.connections, v15);
    end;
end;
return v2;
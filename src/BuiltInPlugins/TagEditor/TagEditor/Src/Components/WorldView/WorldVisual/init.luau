local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(script.Parent.BoxAdorn);
local v4 = require(script.Parent.SphereAdorn);
local v5 = require(script.Parent.OutlineAdorn);
local v6 = require(script.Parent.IconAdorn);
local v7 = require(script.Parent.TextAdorn);
return function(v8) --[[ Line: 12 ]] --[[ Name: WorldVisual ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy), v6 (copy), v7 (copy), v2 (copy), l_CoreGui_0 (copy)
    local l_partsList_0 = v8.partsList;
    local v10 = {};
    for v11, v12 in pairs(l_partsList_0) do
        local v13 = nil;
        if v12.DrawType == "Outline" then
            v13 = v5;
        elseif v12.DrawType == "Box" then
            v13 = v3;
        elseif v12.DrawType == "Sphere" then
            v13 = v4;
        elseif v12.DrawType == "Icon" then
            v13 = v6;
        elseif v12.DrawType == "Text" then
            v13 = v7;
        else
            error("Unknown DrawType: " .. tostring(v12.DrawType));
        end;
        v10[v11] = v2.createElement(v13, {
            Adornee = v12.Part, 
            Icon = v12.Icon, 
            Color = v12.Color, 
            TagName = v12.TagName, 
            AlwaysOnTop = v12.AlwaysOnTop
        });
    end;
    return v2.createElement(v2.Portal, {
        target = l_CoreGui_0
    }, {
        TagEditorWorldView = v2.createElement("Folder", {}, v10)
    });
end;
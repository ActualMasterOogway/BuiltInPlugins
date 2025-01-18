local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.tableCache);
local v2 = require(l_Parent_0.UI.Components.UIFolderData);
local v3 = v1("ComponentSymbols");
local _ = function(v4) --[[ Line: 16 ]] --[[ Name: createSymbolsForFolder ]]
    -- upvalues: v3 (copy)
    for _, v6 in pairs(v4) do
        v3:add(v6.name, require);
    end;
end;
for _, v9 in pairs(v2) do
    v3:add(v9.name, require);
end;
return v3;
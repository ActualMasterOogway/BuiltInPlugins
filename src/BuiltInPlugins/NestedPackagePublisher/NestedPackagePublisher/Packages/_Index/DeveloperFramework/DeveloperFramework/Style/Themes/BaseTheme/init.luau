local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.UI.Components.UIFolderData);
local v2 = require(l_Parent_0.Style.ComponentSymbols);
local v3 = require(l_Parent_0.Style.StyleKey);
local v4 = {
    BorderColor = v3.Border, 
    Color = v3.MainBackground, 
    Font = Enum.Font.SourceSans, 
    TextColor = v3.MainText, 
    TextSize = 18
};
(function(v5) --[[ Line: 21 ]] --[[ Name: createComponentStyles ]]
    -- upvalues: v2 (copy), v4 (copy)
    for _, v7 in pairs(v5) do
        if v7.style then
            assert(v2[v7.name] ~= nil, ("No Symbol was found for the component %s"):format(v7.name));
            local v8 = require(v7.style);
            v4[v2[v7.name]] = v8;
        end;
    end;
end)(v1);
return v4;
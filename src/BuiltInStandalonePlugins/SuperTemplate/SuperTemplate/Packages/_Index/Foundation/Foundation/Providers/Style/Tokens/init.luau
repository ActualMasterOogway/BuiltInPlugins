local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RbxDesignFoundations);
local v3 = require(l_script_FirstAncestor_0.Enums.Theme);
local v4 = require(l_script_FirstAncestor_0.Enums.Device);
local function _(v5) --[[ Line: 10 ]] --[[ Name: getPlatformScale ]]
    -- upvalues: v4 (copy)
    if v5 == v4.Console then
        return 1.5;
    else
        return 1;
    end;
end;
return {
    getTokens = function(v7, v8, v9) --[[ Line: 20 ]] --[[ Name: getTokens ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy)
        local l_Tokens_0 = v2.Tokens;
        local v11 = v7 == v4.Console and 1.5 or 1;
        local v12 = (if v8 == v3.Dark then if v9 then l_Tokens_0.FoundationDark else l_Tokens_0.UIBloxDark else if v9 then l_Tokens_0.FoundationLight else l_Tokens_0.UIBloxLight)(v11);
        local v13 = {
            Color = v12.Color, 
            Config = v12.Config, 
            DarkMode = v12.DarkMode, 
            LightMode = v12.LightMode, 
            Inverse = v12.Inverse, 
            Semantic = v12.Semantic, 
            Size = v12.Size, 
            Padding = v12.Padding, 
            Margin = v12.Margin, 
            Gap = v12.Gap, 
            Gutter = v12.Gutter, 
            Radius = v12.Radius, 
            Stroke = v12.Stroke, 
            LineHeight = v12.LineHeight, 
            FontSize = v12.FontSize, 
            FontWeight = v12.FontWeight, 
            Typography = v12.Typography
        };
        v13.Config.UI.Scale = v11;
        return v13;
    end
};
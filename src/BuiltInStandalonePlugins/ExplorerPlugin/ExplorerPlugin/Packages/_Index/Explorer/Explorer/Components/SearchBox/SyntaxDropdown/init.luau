local l_BrowserService_0 = game:GetService("BrowserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v2 = require(l_script_FirstAncestor_0.Components.SearchBox.Dropdown);
local v3 = require(l_script_FirstAncestor_0.Parent.Framework);
local v4 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local v6 = require(l_script_FirstAncestor_0.Components.SearchBox.Tooltip);
local v7 = game:DefineFastString("ExplorerSyntaxGuideUrl", "https://create.roblox.com/docs/studio/explorer#filtering-instances");
local l_createElement_0 = v5.createElement;
local v9 = {
    {
        text = "anchored=", 
        icon = v4.standard("anchor")
    }, 
    {
        text = "locked=", 
        icon = v4.standard("lock")
    }, 
    {
        text = "transparency=", 
        icon = v4.standard("transparency")
    }, 
    {
        text = "material=", 
        icon = v4.standard("material")
    }, 
    {
        text = "meshId=", 
        icon = v4.standard("meshPart")
    }, 
    {
        text = "textureId=", 
        icon = v4.standard("texture")
    }, 
    {
        text = "tag:", 
        icon = v4.standard("tag")
    }
};
local function v10() --[[ Line: 49 ]] --[[ Name: openSyntaxGuide ]]
    -- upvalues: l_BrowserService_0 (copy), v7 (copy)
    l_BrowserService_0:OpenBrowserWindow(v7);
end;
return function(v11) --[[ Line: 53 ]] --[[ Name: SyntaxDropdown ]]
    -- upvalues: v3 (copy), l_createElement_0 (copy), v2 (copy), v4 (copy), v5 (copy), v10 (copy), v6 (copy), v9 (copy)
    local v12 = v3.ContextServices.Localization:use();
    return l_createElement_0(v2, {
        dropdownRef = v11.dropdownRef, 
        headerInfo = {
            titleText = v12:getText("SyntaxDropdown", "SuggestedFilters"), 
            button = l_createElement_0("ImageButton", {
                Image = v4.standard("help"), 
                [v5.Event.Activated] = v10, 
                [v5.Tag] = "Explorer-Content-Standard Explorer-Icon data-testid=SyntaxDropdown-HelpButton"
            }, {
                Tooltip = l_createElement_0(v6, {
                    anchorPoint = Vector2.new(1, 0), 
                    position = UDim2.new(1, 0, 1, 1), 
                    showDelay = 0.5, 
                    text = v12:getText("SyntaxDropdown", "SyntaxGuide")
                })
            })
        }, 
        itemData = v9, 
        onItemClicked = v11.onItemClicked, 
        shouldIgnoreMaxHeight = true
    });
end;
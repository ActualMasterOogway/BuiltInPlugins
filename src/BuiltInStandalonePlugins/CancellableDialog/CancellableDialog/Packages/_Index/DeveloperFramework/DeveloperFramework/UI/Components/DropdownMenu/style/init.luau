local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.Components.UIFolderData);
local v2 = require(v1.RoundBox.style);
local l_deepCopy_0 = require(l_Parent_0.Util).deepCopy;
local v4 = require(l_Parent_0.Style.StyleKey);
local v5 = l_deepCopy_0(v2);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = v6.getFFlagDropdownMenuAddItemHeight();
local v8 = v6.getFFlagDevFrameworkFixAutocompleteDropdownMenuStyle();
local v9 = v6.getFFlagDevFrameworkModernStartPageStyle();
return {
    BackgroundStyle = v5, 
    BorderColor = v4.Border, 
    Width = 240, 
    MaxHeight = 240, 
    ItemHeight = v7 and 40 or nil, 
    Offset = Vector2.new(0, 0), 
    Text = {
        TextSize = 18, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, 
    ["&ImageOffset"] = {
        Offset = Vector2.new(-40, 0)
    }, 
    ["&TextInputDropdown"] = if v8 then nil else {
        Offset = Vector2.new(0, 2)
    }, 
    ["&Modern"] = if v9 then {
        CornerRadius = UDim.new(0, 8), 
        BackgroundColor = v4.DropdownMenuStateLayerBackground, 
        StrokeColor = v4.DropdownMenuStateLayerBorderColor, 
        StrokeThickness = 1, 
        Offset = Vector2.new(0, 5)
    } else nil
};
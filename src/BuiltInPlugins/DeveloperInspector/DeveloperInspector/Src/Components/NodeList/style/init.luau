local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_StyleKey_0 = v1.Style.StyleKey;
local l_deepCopy_0 = v1.Util.deepCopy;
local l_UIData_0 = v1.UIData;
local v5 = require(l_UIData_0.ScrollingFrame.style);
local v6 = require(l_UIData_0.RoundBox.style);
local v7 = require(l_UIData_0.LinkText.style);
return {
    Background = v6, 
    BackgroundStyle = v6, 
    ScrollingFrame = v5, 
    BackgroundColor = l_StyleKey_0.MainBackground, 
    Padding = 1, 
    RowHeight = 24, 
    IconPadding = 5, 
    HoverColor = l_StyleKey_0.ButtonHover, 
    SelectedColor = l_StyleKey_0.DialogMainButton, 
    SelectedTextColor = l_StyleKey_0.DialogMainButtonText, 
    Link = l_deepCopy_0(v7)
};
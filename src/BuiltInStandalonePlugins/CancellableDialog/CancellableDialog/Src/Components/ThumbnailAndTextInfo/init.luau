local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_LayoutOrderIterator_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v4 = require(l_Components_0.Shimmer);
local v5 = require(l_Components_0.TextInfo);
local v6 = require(script.styles);
local v7 = v6:GetAttribute("ThumbnailSize").X.Offset + v6:GetAttribute("ThumbnailToContentPadding").Offset;
local l_TextService_0 = game:GetService("TextService");
local v9 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagFixCancellableDialogResizing();
return function(v10) --[[ Line: 30 ]] --[[ Name: ThumbnailAndTextInfo ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_TextService_0 (copy), v1 (copy), v9 (copy), v7 (copy), v4 (copy), v5 (copy)
    local v11 = l_LayoutOrderIterator_0.new();
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v10.Title, 16, Enum.Font.SourceSansSemibold, Vector2.new(10000, 10000));
    return v1.createElement("Frame", {
        LayoutOrder = v11:getNextOrder(), 
        [v1.Tag] = "X-FitY X-Row Component-ThumbnailAndTextInfo", 
        [v1.Change.AbsoluteSize] = v9 and function(_) --[[ Line: 43 ]]
            -- upvalues: v10 (copy), l_l_TextService_0_TextSize_0 (copy), v7 (ref)
            v10.OnWidthChanged(l_l_TextService_0_TextSize_0.X + 2 * v7);
        end or nil
    }, {
        ThumbnailContainer = if v10.Image ~= "" then v1.createElement("ImageLabel", {
            LayoutOrder = v11:getNextOrder(), 
            Image = v10.Image, 
            [v1.Tag] = "Thumbnail"
        }) else nil, 
        Shimmer = if v10.Image == "" then v1.createElement(v4, {
            Size = UDim2.new(0, 50, 0, 50), 
            LayoutOrder = v11:getNextOrder()
        }) else nil, 
        TextInfo = v1.createElement(v5, {
            Title = v10.Title, 
            Subtitle = v10.Subtitle, 
            Status = v10.Status, 
            Size = UDim2.new(1, -v7, 0, 0), 
            LayoutOrder = v11:getNextOrder(), 
            OnShown = v10.OnShown
        })
    });
end;
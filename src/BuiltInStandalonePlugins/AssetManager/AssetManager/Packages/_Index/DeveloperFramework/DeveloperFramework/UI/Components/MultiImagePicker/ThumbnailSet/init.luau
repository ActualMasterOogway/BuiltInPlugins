local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Cryo);
local l_Components_0 = l_Parent_0.UI.Components;
local v4 = require(l_Components_0.Pane);
local v5 = require(script.Parent.Thumbnail);
local v6 = require(script.Parent.DragDestination);
local v7 = require(script.Parent.NewThumbnail);
local _ = require(script.Parent.types);
local v9 = v1.PureComponent:extend("ThumbnailSet");
v9.render = function(v10) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), v2 (copy), v5 (copy), v7 (copy), v4 (copy)
    local l_props_0 = v10.props;
    local l_Theme_0 = l_props_0.Theme;
    local l_ThumbnailSet_0 = l_Theme_0.ThumbnailSet;
    local v14 = l_props_0.Thumbnails or {};
    local v15 = l_props_0.Order or {};
    local l_Enabled_0 = l_props_0.Enabled;
    local l_HoverBarsEnabled_0 = l_props_0.HoverBarsEnabled;
    local l_ThumbnailSize_0 = l_props_0.ThumbnailSize;
    local v19 = {};
    if l_Enabled_0 then
        for v20, v21 in pairs(v14) do
            if v21.id == "DragDestination" then
                v19.DragDestination = v1.createElement(v6, {
                    LayoutOrder = v2.List.find(v15, v20), 
                    Theme = l_Theme_0
                });
            else
                local v22 = nil;
                if not v21.videoHash then
                    if v21.imageId then
                        v22 = "rbxassetid://" .. v21.imageId;
                    elseif v21.tempId then
                        v22 = v21.tempId;
                    end;
                end;
                v19[tostring(v20)] = v1.createElement(v5, {
                    HoverBarEnabled = l_HoverBarsEnabled_0, 
                    Id = v20, 
                    Image = v22, 
                    LayoutOrder = v2.List.find(v15, v20), 
                    Preview = v21.tempId, 
                    InReview = not v21.approved, 
                    IsModerated = v21.isModerated, 
                    VideoHash = v21.videoHash or nil, 
                    VideoTitle = v21.videoTitle, 
                    StartDragging = l_props_0.StartDragging, 
                    DragMove = l_props_0.DragMove, 
                    PromptDeleteThumbnail = l_props_0.PromptDeleteThumbnail, 
                    PromptPreviewThumbnail = l_props_0.PromptPreviewThumbnail, 
                    Theme = l_Theme_0
                });
            end;
        end;
        v19.NewThumbnail = v1.createElement(v7, {
            LayoutOrder = #v15 + 1, 
            OnClick = l_props_0.AddNew, 
            Theme = l_Theme_0
        });
    end;
    v19.Layout = v1.createElement("UIGridLayout", {
        CellPadding = l_ThumbnailSet_0.Padding, 
        CellSize = l_ThumbnailSize_0, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v1.createElement(v4, {
        LayoutOrder = l_props_0.LayoutOrder or 1, 
        Position = l_props_0.Position or UDim2.new(), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left
    }, v19);
end;
return v9;
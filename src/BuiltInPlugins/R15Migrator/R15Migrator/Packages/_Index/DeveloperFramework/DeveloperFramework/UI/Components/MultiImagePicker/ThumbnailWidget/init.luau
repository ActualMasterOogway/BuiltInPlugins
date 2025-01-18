local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util);
local v3 = require(l_Parent_0.Parent.Cryo);
local l_prioritize_0 = v2.prioritize;
local l_Components_0 = l_Parent_0.UI.Components;
local v6 = require(l_Components_0.Pane);
local v7 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v7.withContext;
local v9 = require(l_Parent_0.Resources);
local v10 = require(script.Parent.ThumbnailSet);
local v11 = require(script.Parent.DragGhostThumbnail);
local v12 = require(script.Parent.DeleteThumbnailDialog);
local v13 = require(script.Parent.PreviewThumbnailDialog);
local _ = require(script.Parent.types);
local l_LOCALIZATION_PROJECT_NAME_0 = v9.LOCALIZATION_PROJECT_NAME;
local v16 = v1.PureComponent:extend("ThumbnailWidget");
v16.init = function(v17) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v17.frameRef = v1.createRef();
    v17.state = {
        dragId = nil, 
        dragIndex = nil, 
        oldIndex = nil, 
        deleteThumbnailInfo = nil, 
        previewThumbnailInfo = nil
    };
    v17.startDragging = function(v18) --[[ Line: 94 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            dragId = v18.thumbnailId, 
            dragIndex = v18.index, 
            oldIndex = v18.index or nil
        });
    end;
    v17.dragMove = function(v19) --[[ Line: 102 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            dragIndex = v19.index
        });
    end;
    v17.stopDragging = function() --[[ Line: 108 ]]
        -- upvalues: v17 (copy), v1 (ref)
        if v17.state.dragId ~= nil and v17.state.dragIndex ~= nil then
            local l_props_0 = v17.props;
            l_props_0.Mouse:__resetCursor();
            if v17.state.dragIndex == v17.state.oldIndex then
                v17:setState({
                    dragId = v1.None, 
                    dragIndex = v1.None, 
                    oldIndex = v1.None
                });
                return;
            else
                l_props_0.ThumbnailAction("MoveTo", {
                    thumbnailId = v17.state.dragId, 
                    index = v17.state.dragIndex
                });
            end;
        end;
    end;
    v17.promptDeleteThumbnail = function(v21) --[[ Line: 128 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            deleteThumbnailInfo = v21
        });
    end;
    v17.promptPreviewThumbnail = function(v22) --[[ Line: 134 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            previewThumbnailInfo = v22
        });
    end;
end;
v16.didUpdate = function(v23, v24) --[[ Line: 141 ]] --[[ Name: didUpdate ]]
    -- upvalues: v1 (copy)
    local l_props_1 = v23.props;
    if v24.Order ~= l_props_1.Order then
        v23:setState({
            dragId = v1.None, 
            dragIndex = v1.None, 
            oldIndex = v1.None
        });
    end;
end;
v16.render = function(v26) --[[ Line: 156 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v3 (copy), v1 (copy), v11 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), v10 (copy), v12 (copy), v13 (copy), v6 (copy)
    local l_props_2 = v26.props;
    local l_Theme_0 = l_props_2.Theme;
    local l_Localization_0 = l_props_2.Localization;
    local l_Enabled_0 = l_props_2.Enabled;
    local v31 = l_props_2.Thumbnails or {};
    local v32 = l_props_2.Order or {};
    local v33 = l_prioritize_0(l_props_2.MaxThumbnails, l_Theme_0.Thumbnail.DefaultMaxCount);
    local v34 = #v32 or 0;
    local v35 = l_prioritize_0(l_props_2.ShowAltText, true);
    local v36 = l_prioritize_0(l_props_2.ShowTitle, true);
    local v37 = l_prioritize_0(l_props_2.ThumbnailSize, l_Theme_0.Thumbnail.DefaultSize);
    local l_ErrorMessage_0 = l_props_2.ErrorMessage;
    local l_deleteThumbnailInfo_0 = v26.state.deleteThumbnailInfo;
    local l_previewThumbnailInfo_0 = v26.state.previewThumbnailInfo;
    local l_dragId_0 = v26.state.dragId;
    local l_dragIndex_0 = v26.state.dragIndex;
    local v43 = l_dragId_0 ~= nil;
    local v44 = nil;
    local v45 = nil;
    if v43 then
        v44 = v3.Dictionary.join(v31, {
            [l_dragId_0] = {
                id = "DragDestination"
            }
        });
        v45 = v3.List.removeValue(v32, l_dragId_0);
        table.insert(v45, l_dragIndex_0, l_dragId_0);
    end;
    local v46 = nil;
    if v31[l_dragId_0] then
        if v31[l_dragId_0].imageId then
            v46 = "rbxassetid://" .. v31[l_dragId_0].imageId;
        elseif v31[l_dragId_0].tempId then
            v46 = v31[l_dragId_0].tempId;
        end;
    end;
    local v47 = nil;
    v47 = if not not l_ErrorMessage_0 or v33 < v34 then l_Theme_0.Colors.Error else l_Theme_0.Thumbnail.Count;
    local v49 = {
        DragFolder = v1.createElement("Folder", {}, {
            DragGhost = v1.createElement(v11, {
                Enabled = l_Enabled_0 and v43, 
                Image = v46, 
                StopDragging = v26.stopDragging, 
                ThumbnailSize = v37, 
                Theme = l_Theme_0
            })
        }), 
        Title = if v36 then v1.createElement("TextLabel", v3.Dictionary.join(l_Theme_0.FontStyle.Normal, {
            LayoutOrder = 0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 16), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MulitImagePicker", "TitleThumbnails")
        })) else nil, 
        Notes = l_props_2.Notes, 
        Thumbnails = v1.createElement(v10, {
            LayoutOrder = 2, 
            Thumbnails = v43 and v44 or v31, 
            Order = v43 and v45 or v32, 
            HoverBarsEnabled = not v43, 
            Enabled = l_Enabled_0, 
            StartDragging = v26.startDragging, 
            DragMove = v26.dragMove, 
            PromptPreviewThumbnail = v26.promptPreviewThumbnail, 
            PromptDeleteThumbnail = v26.promptDeleteThumbnail, 
            ThumbnailSize = v37, 
            AddNew = function() --[[ Line: 252 ]] --[[ Name: AddNew ]]
                -- upvalues: l_props_2 (copy)
                l_props_2.ThumbnailAction("AddNew");
            end, 
            Theme = l_Theme_0
        }), 
        Count = v1.createElement("TextLabel", v3.Dictionary.join(l_Theme_0.FontStyle.Smaller, {
            LayoutOrder = 3, 
            Visible = l_Enabled_0, 
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1, 
            TextColor3 = v47, 
            Text = l_ErrorMessage_0 or v34 > 0 and v34 .. "/" .. v33 or l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MulitImagePicker", "ThumbnailsCount", {
                maxThumbnails = v33
            }), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })), 
        DeleteDialog = v1.createElement(v12, {
            Enabled = l_deleteThumbnailInfo_0 ~= nil, 
            OnClose = function() --[[ Line: 282 ]] --[[ Name: OnClose ]]
                -- upvalues: v26 (copy), v1 (ref)
                v26:setState({
                    deleteThumbnailInfo = v1.None
                });
            end, 
            DeleteThumbnail = function() --[[ Line: 287 ]] --[[ Name: DeleteThumbnail ]]
                -- upvalues: l_props_2 (copy), l_deleteThumbnailInfo_0 (copy)
                l_props_2.ThumbnailAction("Delete", l_deleteThumbnailInfo_0);
            end, 
            Theme = l_Theme_0
        }), 
        PreviewDialog = v1.createElement(v13, {
            AltTextError = l_props_2.AltTextError, 
            Enabled = l_previewThumbnailInfo_0 ~= nil, 
            IsVideoAllowed = l_props_2.IsVideoAllowed, 
            OnClose = function() --[[ Line: 297 ]] --[[ Name: OnClose ]]
                -- upvalues: v26 (copy), v1 (ref)
                v26:setState({
                    previewThumbnailInfo = v1.None
                });
            end, 
            Order = v32, 
            ShowAltText = v35, 
            StartThumbnailInfo = l_previewThumbnailInfo_0, 
            Thumbnails = v31, 
            UpdateAltTexts = function(v48) --[[ Line: 306 ]] --[[ Name: UpdateAltTexts ]]
                -- upvalues: l_props_2 (copy)
                l_props_2.ThumbnailAction("UpdateAltTexts", v48);
            end, 
            Theme = l_Theme_0
        })
    };
    return v1.createElement(v6, {
        LayoutOrder = l_props_2.LayoutOrder or 1, 
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Spacing = UDim.new(0, 15)
    }, v49);
end;
return (l_withContext_0({
    Localization = v7.Localization, 
    Mouse = v7.Mouse
})(v16));
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v2.withContext;
local l_Components_0 = l_Parent_0.UI.Components;
local v5 = require(l_Components_0.Pane);
local v6 = require(l_Components_0.MultiImagePicker);
local _ = require(script.types);
local v8 = require(l_Parent_0.Util);
local l_deepCopy_0 = v8.deepCopy;
local l_deepEqual_0 = v8.deepEqual;
local v11 = v8.isRoact17(v1);
local v12 = require(script.RejectedThumbnailDialog);
local l_StudioService_0 = game:GetService("StudioService");
local v14 = tonumber(settings():GetFVariable("FileMaxSizeBytes"));
local v15 = v1.PureComponent:extend("MultiImagePickerWrapper");
v15.init = function(v16) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: l_StudioService_0 (copy), v14 (copy), l_deepCopy_0 (copy), v11 (copy), v1 (copy)
    v16.state = {
        altTextError = nil, 
        errorMessage = nil, 
        order = {}, 
        thumbnails = {}, 
        originalOrder = {}, 
        originalThumbnails = {}
    };
    v16.promptForThumbnails = function() --[[ Line: 87 ]]
        -- upvalues: v16 (copy), l_StudioService_0 (ref), v14 (ref)
        local l_Stylizer_0 = v16.props.Stylizer;
        local v18 = l_StudioService_0:PromptImportFiles(l_Stylizer_0.ImageTypes);
        local v19 = {};
        local v20 = {};
        if v18 and #v18 > 0 then
            for _, v22 in ipairs(v18) do
                if v22.Size > v14 then
                    table.insert(v19, v22.Name);
                else
                    table.insert(v20, v22);
                end;
            end;
            if next(v19) ~= nil then
                v16:setState({
                    rejectedThumbnailNames = v19
                });
            end;
            return v20;
        else
            return nil;
        end;
    end;
    v16.addThumbnails = function() --[[ Line: 115 ]]
        -- upvalues: v16 (copy), l_deepCopy_0 (ref), v11 (ref)
        local l_state_0 = v16.state;
        local v24 = v16.promptForThumbnails();
        if v24 then
            local v25 = l_deepCopy_0(l_state_0.order);
            local v26 = l_deepCopy_0(l_state_0.thumbnails);
            for _, v28 in pairs(v24) do
                local l_v28_TemporaryId_0 = v28:GetTemporaryId();
                table.insert(v25, l_v28_TemporaryId_0);
                v26[l_v28_TemporaryId_0] = {
                    asset = v28, 
                    tempId = l_v28_TemporaryId_0
                };
            end;
            if v11 then
                v16:setState({
                    thumbnails = v26, 
                    order = v25
                }, function() --[[ Line: 136 ]]
                    -- upvalues: v16 (ref)
                    v16.updateThumbnailChangeInfo();
                end);
                return;
            else
                v16:setState({
                    thumbnails = v26, 
                    order = v25
                });
                v16.updateThumbnailChangeInfo();
            end;
        end;
    end;
    v16.deleteThumbnail = function(v30, v31) --[[ Line: 149 ]]
        -- upvalues: v11 (ref), v16 (copy)
        if v11 then
            v16:setState({
                order = v30, 
                thumbnails = v31
            }, function() --[[ Line: 157 ]]
                -- upvalues: v16 (ref)
                v16.updateThumbnailChangeInfo();
            end);
            return;
        else
            v16:setState({
                order = v30, 
                thumbnails = v31
            });
            v16.updateThumbnailChangeInfo();
            return;
        end;
    end;
    v16.orderChanged = function(v32) --[[ Line: 169 ]]
        -- upvalues: v11 (ref), v16 (copy)
        if v11 then
            v16:setState({
                order = v32
            }, function() --[[ Line: 173 ]]
                -- upvalues: v16 (ref)
                v16.updateThumbnailChangeInfo();
            end);
            return;
        else
            v16:setState({
                order = v32
            });
            v16.updateThumbnailChangeInfo();
            return;
        end;
    end;
    v16.thumbnailsChanged = function(v33) --[[ Line: 186 ]]
        -- upvalues: v11 (ref), v16 (copy)
        if v11 then
            v16:setState({
                altTextError = nil, 
                thumbnails = v33
            }, function() --[[ Line: 192 ]]
                -- upvalues: v16 (ref)
                v16.updateThumbnailChangeInfo();
            end);
            return;
        else
            v16:setState({
                altTextError = nil, 
                thumbnails = v33
            });
            v16.updateThumbnailChangeInfo();
            return;
        end;
    end;
    v16.updateThumbnailChangeInfo = function() --[[ Line: 204 ]]
        -- upvalues: v16 (copy)
        local l_state_1 = v16.state;
        local l_props_0 = v16.props;
        local l_originalThumbnails_0 = l_state_1.originalThumbnails;
        local l_thumbnails_0 = l_state_1.thumbnails;
        local v38 = {};
        local v39 = {};
        local v40 = {};
        if l_originalThumbnails_0 and l_thumbnails_0 then
            for v41 in pairs(l_originalThumbnails_0) do
                if l_thumbnails_0[v41] == nil then
                    table.insert(v40, (tonumber(v41)));
                end;
            end;
            for v42, v43 in pairs(l_thumbnails_0) do
                if l_originalThumbnails_0[v42] == nil then
                    table.insert(v39, v43.asset);
                    if v43.altText ~= "" then
                        v38[v42] = v43.altText;
                    end;
                elseif l_originalThumbnails_0[v42].altText ~= v43.altText then
                    v38[v42] = v43.altText;
                end;
            end;
        end;
        l_props_0.SetThumbnailUpdateInfo({
            ThumbnailAltTextsToUpdate = v38, 
            ThumbnailFilesToAdd = v39, 
            ThumbnailIdsToRemove = v40, 
            ThumbnailOrderToChange = l_state_1.order
        });
    end;
    v16.initializeThumbnails = function() --[[ Line: 240 ]]
        -- upvalues: v16 (copy)
        local l_props_1 = v16.props;
        if not l_props_1.InitThumbnailArray then
            return;
        else
            local v45 = {};
            local v46 = {};
            for _, v48 in pairs(l_props_1.InitThumbnailArray) do
                local v49 = tostring(v48.id);
                table.insert(v45, v49);
                v46[v49] = v48;
            end;
            v16:setState({
                altTextError = l_props_1.AltTextError, 
                order = v45, 
                thumbnails = v46, 
                originalOrder = v45, 
                originalThumbnails = v46
            });
            return;
        end;
    end;
    v16.onCloseRejectedDialog = function() --[[ Line: 266 ]]
        -- upvalues: v16 (copy), v1 (ref)
        v16:setState({
            rejectedThumbnailNames = v1.None
        });
    end;
end;
v15.didMount = function(v50) --[[ Line: 273 ]] --[[ Name: didMount ]]
    v50.initializeThumbnails();
end;
v15.didUpdate = function(v51, v52) --[[ Line: 277 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_deepEqual_0 (copy)
    local l_props_2 = v51.props;
    if v52.InitThumbnailArray == nil then
        v51.initializeThumbnails();
        return;
    else
        if not l_deepEqual_0(v52.InitThumbnailArray, l_props_2.InitThumbnailArray) then
            v51.initializeThumbnails();
        end;
        return;
    end;
end;
v15.render = function(v54) --[[ Line: 288 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v12 (copy)
    local l_props_3 = v54.props;
    local l_state_2 = v54.state;
    return v1.createElement(v5, {
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        MultiImagePicker = v1.createElement(v6, {
            AddThumbnail = v54.addThumbnails, 
            AltTextError = l_state_2.altTextError, 
            DeleteThumbnail = v54.deleteThumbnail, 
            Enabled = true, 
            ErrorMessage = l_state_2.errorMessage, 
            IsVideoAllowed = l_props_3.IsVideoAllowed, 
            LayoutOrder = l_props_3.LayoutOrder, 
            Order = l_state_2.order, 
            MaxThumbnails = l_props_3.MaxThumbnails, 
            Notes = l_props_3.Notes, 
            ShowAltText = l_props_3.ShowAltText, 
            ShowTitle = l_props_3.ShowTitle, 
            ThumbnailOrderChanged = v54.orderChanged, 
            Thumbnails = l_state_2.thumbnails, 
            ThumbnailsChanged = v54.thumbnailsChanged, 
            ThumbnailSize = l_props_3.ThumbnailSize
        }), 
        RejectedThumbnailDialog = v1.createElement(v12, {
            Enabled = l_state_2.rejectedThumbnailNames ~= nil, 
            Files = l_state_2.rejectedThumbnailNames, 
            OnClose = v54.onCloseRejectedDialog, 
            Theme = l_props_3.Stylizer
        })
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v15));
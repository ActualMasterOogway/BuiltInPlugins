local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.SliceRectUtil);
local _ = require(l_Parent_0.Src.Types);
local v5 = require(l_Parent_0.Src.Util.Orientation);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Promise_0 = v2.Util.Promise;
local v11 = require(l_Parent_0.Src.Components.AlertDialog);
local l_GuiService_0 = game:GetService("GuiService");
local l_Selection_0 = game:GetService("Selection");
local l_RunService_0 = game:GetService("RunService");
local v15 = v1.PureComponent:extend("InstanceUnderEditManager");
local v16 = v5.Left.rawValue();
local v17 = v5.Right.rawValue();
local v18 = v5.Top.rawValue();
local v19 = v5.Bottom.rawValue();
v15.init = function(v20, v21) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v3 (copy), l_Promise_0 (copy), l_RunService_0 (copy), l_Selection_0 (copy), l_GuiService_0 (copy)
    v20.state = {
        showingAlertTitleKey = nil, 
        showingAlertMessageKey = nil
    };
    v20.instanceUnderEdit = nil;
    v20.instanceWatchedForImageChange = nil;
    v20.lastSliceOffsets = nil;
    v20.uncroppedImageSize = Vector2.new();
    v20.showAlertDialog = function(v22, v23, v24) --[[ Line: 54 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            showingAlertTitleKey = v22, 
            showingAlertMessageKey = v23, 
            showingAlertMessageReplacements = v24
        });
    end;
    v20.closeAlertDialog = function() --[[ Line: 62 ]]
        -- upvalues: v20 (copy), v1 (ref)
        v20:setState({
            showingAlertTitleKey = v1.None, 
            showingAlertMessageKey = v1.None, 
            showingAlertMessageReplacements = v1.None
        });
    end;
    v20.imageUnderEditConnections = {};
    v20.clearCurrentImageUnderEdit = function() --[[ Line: 71 ]]
        -- upvalues: v20 (copy)
        for _, v26 in ipairs(v20.imageUnderEditConnections) do
            if v26 then
                v26:Disconnect();
            end;
        end;
        v20.imageUnderEditConnections = {};
    end;
    v20.getOffsetsForResizedImage = function(v27, v28) --[[ Line: 80 ]]
        -- upvalues: v16 (ref), v17 (ref), v18 (ref), v19 (ref)
        local v29 = {
            [v16] = math.clamp(v27[v16], 0, v28.X)
        };
        v29[v17] = math.clamp(v27[v17], 0, (math.max(0, v28.X - v29[v16])));
        v29[v18] = math.clamp(v27[v18], 0, v28.Y);
        v29[v19] = math.clamp(v27[v19], 0, (math.max(0, v28.Y - v29[v18])));
        return v29;
    end;
    v20.getImageDimensionsForInstance = function(v30) --[[ Line: 92 ]]
        -- upvalues: v20 (copy)
        if v30.ImageRectSize.X > 0 and v30.ImageRectSize.Y > 0 then
            return v30.ImageRectSize;
        else
            return v20.uncroppedImageSize;
        end;
    end;
    v20.getImageUnderEdit = function() --[[ Line: 99 ]]
        -- upvalues: v20 (copy)
        return v20.instanceUnderEdit;
    end;
    v20.onSliceCenterChanged = function() --[[ Line: 103 ]]
        -- upvalues: v20 (copy), v3 (ref)
        local v31 = v20.getImageUnderEdit();
        if v31 ~= nil then
            local v32 = v3.getSliceRectFromSliceCenter(v31.SliceCenter);
            v20.props.SliceRectChanged(v32);
            local v33 = v20.getImageDimensionsForInstance(v31);
            v20.lastSliceOffsets = v3.getOffsetsFromSliceRect(v32, v33);
        end;
    end;
    v20.getInstanceProperty = function(v34) --[[ Line: 115 ]]
        -- upvalues: v20 (copy)
        local v35 = v20.getImageUnderEdit();
        return v35 and v35[v34];
    end;
    v20.onImageRectOffsetChanged = function() --[[ Line: 120 ]]
        -- upvalues: v20 (copy)
        v20.props.InstancePropertyChanged("ImageRectOffset", v20.getInstanceProperty("ImageRectOffset"));
    end;
    v20.clampSliceCenterToDimensions = function(v36, v37) --[[ Line: 124 ]]
        return Rect.new(math.clamp(v36.Min.X, 0, v37.X), math.clamp(v36.Min.Y, 0, v37.Y), math.clamp(v36.Max.X, 0, v37.X), (math.clamp(v36.Max.Y, 0, v37.Y)));
    end;
    v20.onImageRectSizeChanged = function() --[[ Line: 133 ]]
        -- upvalues: v20 (copy)
        local v38 = v20.getImageUnderEdit();
        if not v38 then
            return;
        else
            local l_ImageRectSize_0 = v38.ImageRectSize;
            v20.props.InstancePropertyChanged("ImageRectSize", l_ImageRectSize_0);
            if l_ImageRectSize_0.X > 0 and l_ImageRectSize_0.Y > 0 then
                v38.SliceCenter = v20.clampSliceCenterToDimensions(v38.SliceCenter, l_ImageRectSize_0);
            end;
            return;
        end;
    end;
    v20.onImageColor3Changed = function() --[[ Line: 148 ]]
        -- upvalues: v20 (copy)
        v20.props.InstancePropertyChanged("ImageColor3", v20.getInstanceProperty("ImageColor3"));
    end;
    v20.onResampleModeChanged = function() --[[ Line: 152 ]]
        -- upvalues: v20 (copy)
        v20.props.InstancePropertyChanged("ResampleMode", v20.getInstanceProperty("ResampleMode"));
    end;
    v20.openInstanceInEditor = function(v40, v41) --[[ Line: 156 ]]
        -- upvalues: v20 (copy), v3 (ref)
        v20.clearCurrentImageUnderEdit();
        local v42 = Vector2.new(0, 0);
        local v43 = {
            0, 
            0, 
            0, 
            0
        };
        local v44 = {
            0, 
            0, 
            0, 
            0
        };
        local v45 = v20.props.Localization:getText("Plugin", "Name");
        local v46 = {
            title = v45, 
            pixelDimensions = v42, 
            sliceRect = v43, 
            revertSliceRect = v44
        };
        if v40 ~= nil then
            assert(v41);
            local v47 = true;
            if v41.X <= 0 then
                v47 = v41.Y > 0;
            end;
            assert(v47);
            v20.uncroppedImageSize = v41;
            v42 = v41;
            local v48 = v20.getImageDimensionsForInstance(v40);
            if v40.SliceCenter == Rect.new(0, 0, 0, 0) then
                v40.SliceCenter = Rect.new(0, 0, v48.X, v48.Y);
            end;
            table.insert(v20.imageUnderEditConnections, v40:GetPropertyChangedSignal("SliceCenter"):Connect(v20.onSliceCenterChanged));
            table.insert(v20.imageUnderEditConnections, v40:GetPropertyChangedSignal("ImageRectOffset"):Connect(v20.onImageRectOffsetChanged));
            table.insert(v20.imageUnderEditConnections, v40:GetPropertyChangedSignal("ImageRectSize"):Connect(v20.onImageRectSizeChanged));
            table.insert(v20.imageUnderEditConnections, v40:GetPropertyChangedSignal("ImageColor3"):Connect(v20.onImageColor3Changed));
            table.insert(v20.imageUnderEditConnections, v40:GetPropertyChangedSignal("ResampleMode"):Connect(v20.onResampleModeChanged));
            v43 = v3.getSliceRectFromSliceCenter(v40.SliceCenter);
            v44 = v3.copySliceRect(v43);
            v45 = v45 .. ": " .. tostring(v40.Name);
            v20.lastSliceOffsets = v3.getOffsetsFromSliceRect(v43, v48);
            v46 = {
                title = v45, 
                pixelDimensions = v42, 
                sliceRect = v43, 
                revertSliceRect = v44, 
                imageRectOffset = v40.ImageRectOffset, 
                imageRectSize = v40.ImageRectSize, 
                imageColor3 = v40.ImageColor3, 
                resampleMode = v40.ResampleMode
            };
        end;
        v20.instanceUnderEdit = v40;
        v20.props.InstanceUnderEditChanged(v40, v46);
    end;
    v20.loadingToken = 0;
    v20.newLoadingToken = function() --[[ Line: 230 ]]
        -- upvalues: v20 (copy)
        local l_v20_0 = v20;
        l_v20_0.loadingToken = l_v20_0.loadingToken + 1;
        return v20.loadingToken;
    end;
    v20.loadingImageRef = v1.createRef();
    v20.createPromiseForImageLoaded = function(v50, v51) --[[ Line: 237 ]]
        -- upvalues: v20 (copy), l_Promise_0 (ref), l_RunService_0 (ref)
        v20.openInstanceInEditor(nil);
        local v52 = v20.newLoadingToken();
        return l_Promise_0.new(function(v53, v54) --[[ Line: 241 ]]
            -- upvalues: v50 (copy), v52 (copy), v20 (ref), v51 (copy), l_RunService_0 (ref)
            if not v50 or not v50:IsA("ImageLabel") and not v50:IsA("ImageButton") then
                v54(false, v52);
                return;
            else
                v20.connectImageChangedConnection(v50);
                local l_v50_0 = v50;
                if l_v50_0.IsLoaded then
                    v53(l_v50_0, v52);
                    return;
                else
                    if v51 then
                        v20.props.RequestToLoadImage(l_v50_0.Image);
                        v20.props.LoadingChanged(true);
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        l_RunService_0.RenderStepped:Wait();
                        if not v20._isMounted then
                            v54(false, v52);
                            return;
                        end;
                    end;
                    v20.props.LoadingChanged(true);
                    local v56 = tick();
                    while true do
                        if tick() - v56 < 5 then
                            local _ = false;
                            if not v20._isMounted then
                                v54(false, v52);
                                return;
                            else
                                local v58 = v20.props.LoadingImageRef:getValue();
                                if v58 and v58.IsLoaded and v58.ContentImageSize ~= Vector2.new(0, 0) and v58.Image == l_v50_0.Image then
                                    if v52 == v20.loadingToken then
                                        v53(v50);
                                        return;
                                    else
                                        v54(false, v52);
                                        return;
                                    end;
                                else
                                    task.wait(0.2);
                                end;
                            end;
                        else
                            v54(true, v52);
                            return;
                        end;
                    end;
                end;
            end;
        end);
    end;
    v20.createAndRunPromiseForImageLoaded = function(v59, v60) --[[ Line: 308 ]]
        -- upvalues: v20 (copy), v3 (ref)
        v20.disconnectImageChangedConnection();
        local v61 = v59 and (v59:IsA("ImageLabel") or v59:IsA("ImageButton")) and not v59.IsLoaded;
        v20.createPromiseForImageLoaded(v59, v61):andThen(function(v62) --[[ Line: 316 ]]
            -- upvalues: v20 (ref), v61 (copy), v60 (copy), v3 (ref)
            if not v20._isMounted then
                return;
            else
                if v61 then
                    local v63 = v20.props.LoadingImageRef:getValue();
                    assert(v63 and v63.IsLoaded);
                else
                    assert(v62.IsLoaded);
                end;
                if v60 then
                    if v20.lastSliceOffsets ~= nil then
                        local v64 = v20.getImageDimensionsForInstance(v62);
                        local v65 = v20.getOffsetsForResizedImage(v20.lastSliceOffsets, v64);
                        local v66 = v3.getSliceRectFromOffsets(v65, v64);
                        v62.SliceCenter = v3.getSliceCenterFromSliceRect(v66);
                    else
                        v62.SliceCenter = Rect.new(0, 0, 0, 0);
                    end;
                end;
                local v67 = nil;
                v67 = if v61 then v20.props.LoadingImageRef:getValue().ContentImageSize else v62.ContentImageSize;
                v20.openInstanceInEditor(v62, v67);
                v20.props.LoadingChanged(false);
                return;
            end;
        end, function(v68, v69) --[[ Line: 350 ]]
            -- upvalues: v20 (ref)
            if v69 ~= v20.loadingToken then
                return;
            elseif not v20._isMounted then
                return;
            else
                if v68 then
                    print(v20.props.Localization:getText("Plugin", "ImageLoadErrorMessage"));
                end;
                v20.props.LoadingChanged(false);
                return;
            end;
        end);
    end;
    v20.onImageChanged = function() --[[ Line: 370 ]]
        -- upvalues: l_RunService_0 (ref), v20 (copy)
        l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        if not v20._isMounted then
            return;
        else
            local l_instanceWatchedForImageChange_0 = v20.instanceWatchedForImageChange;
            if l_instanceWatchedForImageChange_0 ~= nil then
                v20.createAndRunPromiseForImageLoaded(l_instanceWatchedForImageChange_0, true);
            end;
            return;
        end;
    end;
    v20.onSelectionChanged = function() --[[ Line: 387 ]]
        -- upvalues: l_Selection_0 (ref), v20 (copy)
        local v71 = l_Selection_0:Get();
        if #v71 > 1 then
            return;
        elseif #v71 == 0 then
            v20.disconnectImageChangedConnection();
            v20.openInstanceInEditor(nil);
            return;
        else
            local v72 = v71[1];
            assert(v72);
            if v72 == v20.instanceUnderEdit then
                return;
            else
                v20.createAndRunPromiseForImageLoaded(v72, false);
                return;
            end;
        end;
    end;
    v20.connectImageChangedConnection = function(v73) --[[ Line: 411 ]]
        -- upvalues: v20 (copy)
        if not v20.imageChangedConnection then
            v20.instanceWatchedForImageChange = v73;
            v20.imageChangedConnection = v73:GetPropertyChangedSignal("Image"):Connect(v20.onImageChanged);
        end;
    end;
    v20.disconnectImageChangedConnection = function() --[[ Line: 418 ]]
        -- upvalues: v20 (copy)
        if v20.imageChangedConnection then
            v20.imageChangedConnection:Disconnect();
            v20.imageChangedConnection = nil;
        end;
        v20.instanceWatchedForImageChange = nil;
    end;
    v20.startListeningToSelection = function() --[[ Line: 426 ]]
        -- upvalues: v20 (copy), l_Selection_0 (ref)
        if not v20.selectionChangedConnection then
            v20.selectionChangedConnection = l_Selection_0.SelectionChanged:Connect(v20.onSelectionChanged);
        end;
    end;
    v20.stopListeningToSelection = function() --[[ Line: 432 ]]
        -- upvalues: v20 (copy)
        if v20.selectionChangedConnection then
            v20.selectionChangedConnection:Disconnect();
            v20.selectionChangedConnection = nil;
        end;
    end;
    v20.onSliceCenterEditButtonClicked = function(v74) --[[ Line: 439 ]]
        -- upvalues: v20 (copy)
        if not v74:IsA("ImageLabel") and not v74:IsA("ImageButton") then
            v20.showAlertDialog("ErrorMessageTitle", "InvalidInstanceErrorMessage");
            return;
        else
            v20.createAndRunPromiseForImageLoaded(v74, false);
            return;
        end;
    end;
    if v21.WidgetEnabled then
        v20.startListeningToSelection();
    end;
    v20.onOpen9SliceEditorConnection = l_GuiService_0.Open9SliceEditor:Connect(v20.onSliceCenterEditButtonClicked);
end;
v15.didMount = function(v75) --[[ Line: 455 ]] --[[ Name: didMount ]]
    v75._isMounted = true;
    if v75.props.InitialEditorInstanceRequest then
        task.defer(function() --[[ Line: 459 ]]
            -- upvalues: v75 (copy)
            if v75._isMounted then
                v75.onSliceCenterEditButtonClicked(v75.props.InitialEditorInstanceRequest);
            end;
        end);
    end;
end;
v15.didUpdate = function(v76, v77, _) --[[ Line: 467 ]] --[[ Name: didUpdate ]]
    if v76.props.WidgetEnabled and not v77.WidgetEnabled then
        v76.startListeningToSelection();
        return;
    else
        if not v76.props.WidgetEnabled and v77.WidgetEnabled then
            v76.stopListeningToSelection();
            v76.clearCurrentImageUnderEdit();
            v76.disconnectImageChangedConnection();
        end;
        return;
    end;
end;
v15.willUnmount = function(v79) --[[ Line: 479 ]] --[[ Name: willUnmount ]]
    v79._isMounted = false;
    v79.stopListeningToSelection();
    v79.clearCurrentImageUnderEdit();
    v79.disconnectImageChangedConnection();
    if v79.onOpen9SliceEditorConnection then
        v79.onOpen9SliceEditorConnection:Disconnect();
        v79.onOpen9SliceEditorConnection = nil;
    end;
end;
v15.render = function(v80) --[[ Line: 492 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v11 (copy)
    local l_state_0 = v80.state;
    if l_state_0.showingAlertTitleKey then
        return v1.createElement(v11, {
            Enabled = true, 
            TitleKey = l_state_0.showingAlertTitleKey, 
            MessageKey = l_state_0.showingAlertMessageKey, 
            MessageKeyFormatTable = l_state_0.showingAlertMessageReplacements, 
            OnClose = v80.closeAlertDialog
        });
    else
        return nil;
    end;
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15));
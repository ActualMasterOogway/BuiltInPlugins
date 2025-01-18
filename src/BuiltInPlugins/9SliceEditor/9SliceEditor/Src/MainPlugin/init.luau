local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Types);
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v9 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v12 = require(l_Parent_0.Src.Components.SliceEditorMain);
local v13 = require(l_Parent_0.Src.Components.InstanceUnderEditManager);
local v14 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local l_DockWidget_0 = v3.UI.DockWidget;
local v16 = v1.PureComponent:extend("MainPlugin");
v16.init = function(v17, _) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v14 (copy), v1 (copy), v2 (copy)
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "9SliceEditor"
    });
    v17.analytics = nil;
    v17.analytics = l_ContextServices_0.Analytics.new(v14);
    v17.state = {
        enabled = false, 
        pixelDimensions = Vector2.new(0, 0), 
        sliceRect = {
            0, 
            0, 
            0, 
            0
        }, 
        revertSliceRect = {
            0, 
            0, 
            0, 
            0
        }, 
        imageRectSize = Vector2.new(), 
        imageRectOffset = Vector2.new(), 
        imageColor3 = Color3.new(), 
        selectedInstance = nil, 
        title = v17.localization:getText("Plugin", "Name"), 
        loading = false
    };
    v17.timeOpened = nil;
    v17.reportOpen = function() --[[ Line: 62 ]]
        -- upvalues: v17 (copy)
        v17.timeOpened = tick();
        v17.analytics:report("sliceEditorOpened");
    end;
    v17.reportClose = function() --[[ Line: 68 ]]
        -- upvalues: v17 (copy)
        if v17.timeOpened then
            v17.analytics:report("sliceEditorOpenTime", tick() - v17.timeOpened);
        end;
    end;
    v17.onClose = function() --[[ Line: 74 ]]
        -- upvalues: v17 (copy)
        if v17.state.enabled then
            v17.reportClose();
        end;
        v17:setState({
            enabled = false
        });
    end;
    v17.onInstanceUnderEditChanged = function(v19, v20) --[[ Line: 84 ]]
        -- upvalues: v17 (copy), v1 (ref), v2 (ref)
        if not v17.state.enabled then
            v17.reportOpen();
        end;
        if v19 then
            v17.analytics:report("sliceEditorImageLoadedIntoEditor");
        end;
        local v21 = {
            enabled = true, 
            selectedInstance = v19 or v1.None
        };
        v21 = v2.Dictionary.join(v21, v20);
        v17:setState(v21);
    end;
    v17.onSliceRectChanged = function(v22) --[[ Line: 103 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            sliceRect = v22
        });
    end;
    v17.onLoadingChanged = function(v23) --[[ Line: 109 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            loading = v23
        });
    end;
    v17.onInstancePropertyChanged = function(v24, v25) --[[ Line: 115 ]]
        -- upvalues: v17 (copy)
        if v24 == "ImageRectOffset" then
            v17:setState({
                imageRectOffset = v25
            });
            return;
        elseif v24 == "ImageRectSize" then
            v17:setState({
                imageRectSize = v25
            });
            return;
        elseif v24 == "ImageColor3" then
            v17:setState({
                imageColor3 = v25
            });
            return;
        else
            if v24 == "ResampleMode" then
                v17:setState({
                    resampleMode = v25
                });
            end;
            return;
        end;
    end;
    v17.loadingImageRef = v1.createRef();
    v17.onRequestToLoadImage = function(v26) --[[ Line: 137 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            contentIdToLoad = v26
        });
    end;
end;
v16.willUnmount = function(v27) --[[ Line: 144 ]] --[[ Name: willUnmount ]]
    if v27.state.enabled then
        v27.reportClose();
    end;
end;
v16.render = function(v28) --[[ Line: 150 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v9 (copy), v1 (copy), v13 (copy), l_DockWidget_0 (copy), v4 (copy), v12 (copy)
    local l_props_0 = v28.props;
    local l_state_0 = v28.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v9(), 
        v28.localization, 
        v28.analytics
    }, {
        InstanceUnderEditManager = v1.createElement(v13, {
            WidgetEnabled = l_enabled_0, 
            InstanceUnderEditChanged = v28.onInstanceUnderEditChanged, 
            InstancePropertyChanged = v28.onInstancePropertyChanged, 
            SliceRectChanged = v28.onSliceRectChanged, 
            LoadingChanged = v28.onLoadingChanged, 
            InitialEditorInstanceRequest = l_props_0.InitialEditorInstanceRequest, 
            RequestToLoadImage = v28.onRequestToLoadImage, 
            LoadingImageRef = v28.loadingImageRef
        }), 
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "SliceEditor", 
            Enabled = l_enabled_0, 
            Title = l_state_0.title, 
            InitialDockState = Enum.InitialDockState.Float, 
            ZIndexBehavior = Enum.ZIndexBehavior.Global, 
            Size = v4.WIDGET_SIZE, 
            MinSize = v4.WIDGET_SIZE, 
            OnClose = v28.onClose, 
            ShouldRestore = false
        }, {
            SliceEditor = l_enabled_0 and v1.createElement(v12, {
                onClose = v28.onClose, 
                pixelDimensions = l_state_0.pixelDimensions, 
                selectedObject = l_state_0.selectedInstance, 
                sliceRect = l_state_0.sliceRect, 
                revertSliceRect = l_state_0.revertSliceRect, 
                loading = l_state_0.loading, 
                imageRectSize = l_state_0.imageRectSize, 
                imageRectOffset = l_state_0.imageRectOffset, 
                imageColor3 = l_state_0.imageColor3, 
                resampleMode = l_state_0.resampleMode, 
                contentIdToLoad = l_state_0.contentIdToLoad, 
                loadingImageRef = v28.loadingImageRef
            })
        })
    });
end;
return v16;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.FitFrame);
local v4 = require(l_Parent_0.Src.Util.Constants);
local v5 = require(l_Parent_0.Src.Components.PluginDetails.DetailsTopBar);
local v6 = require(l_Parent_0.Src.Components.PluginDetails.HttpRequestHolder);
local v7 = require(l_Parent_0.Src.Components.PluginDetails.ScriptInjectionHolder);
local v8 = require(l_Parent_0.Src.Components.PluginDetails.ListItem);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local v12 = v1.Component:extend("PluginDetailsView");
v12.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v12.init = function(v13) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v13.scrollLayoutRef = v1.createRef();
    v13.scrollRef = v1.createRef();
    v13.resizeScrollingFrameCanvas = function(_) --[[ Line: 31 ]]
        -- upvalues: v13 (copy)
        local l_current_0 = v13.scrollLayoutRef.current;
        local l_current_1 = v13.scrollRef.current;
        if not l_current_1 or not l_current_0 then
            return;
        else
            local v17 = UDim.new(0, l_current_0.AbsoluteContentSize.Y);
            l_current_1.CanvasSize = UDim2.new(l_current_1.CanvasSize.X, v17);
            return;
        end;
    end;
end;
v12.didMount = function(v18) --[[ Line: 42 ]] --[[ Name: didMount ]]
    v18.resizeScrollingFrameCanvas();
end;
v12.render = function(v19) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy), l_FitFrameVertical_0 (copy), v5 (copy), v8 (copy), v6 (copy), v7 (copy)
    local l_assetId_0 = v19.props.assetId;
    local l_Size_0 = v19.props.Size;
    local l_Localization_0 = v19.props.Localization;
    local l_httpPermissions_0 = v19.props.httpPermissions;
    local l_scriptInjectionPermissions_0 = v19.props.scriptInjectionPermissions;
    local l_pluginData_0 = v19.props.pluginData;
    local l_Stylizer_0 = v19.props.Stylizer;
    local v27 = 40 + v4.DETAILS_THUMBNAIL_SIZE;
    return v1.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderSizePixel = 0, 
        Size = l_Size_0
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 40), 
            PaddingLeft = UDim.new(0, 40), 
            PaddingRight = UDim.new(0, 40)
        }), 
        Layout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 20), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        PlugnEntryContainer = v1.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            width = UDim.new(1, 0)
        }, {
            DetailsTopBar = v1.createElement(v5, {
                assetId = l_assetId_0, 
                name = l_pluginData_0.name, 
                LayoutOrder = 1
            }), 
            Border = v1.createElement("Frame", {
                LayoutOrder = 2, 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Stylizer_0.BorderColor, 
                Size = UDim2.new(1, 0, 0, 1)
            })
        }), 
        ScrollingFrame = v1.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 200, 0, 0), 
            TopImage = "rbxasset://textures/StudioToolbox/ScrollBarTop.png", 
            MidImage = "rbxasset://textures/StudioToolbox/ScrollBarMiddle.png", 
            BottomImage = "rbxasset://textures/StudioToolbox/ScrollBarBottom.png", 
            ScrollBarImageColor3 = l_Stylizer_0.ScrollbarColor, 
            ScrollBarThickness = l_Stylizer_0.ScrollbarSize, 
            ScrollBarImageTransparency = l_Stylizer_0.ScrollbarTransparency, 
            Size = UDim2.new(1, 0, 1, -v27), 
            [v1.Ref] = v19.scrollRef
        }, {
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                [v1.Change.AbsoluteContentSize] = v19.resizeScrollingFrameCanvas, 
                [v1.Ref] = v19.scrollLayoutRef
            }), 
            Content = v1.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                contentPadding = UDim.new(0, 20), 
                width = UDim.new(1, 0)
            }, {
                HttpRequestPermissionContainer = next(l_httpPermissions_0) and v1.createElement(v8, {
                    LayoutOrder = 3, 
                    renderContent = function() --[[ Line: 139 ]] --[[ Name: renderContent ]]
                        -- upvalues: v1 (ref), v6 (ref), l_assetId_0 (copy), l_httpPermissions_0 (copy)
                        return v1.createElement(v6, {
                            assetId = l_assetId_0, 
                            httpPermissions = l_httpPermissions_0
                        });
                    end, 
                    theme = l_Stylizer_0, 
                    title = l_Localization_0:getText("Details", "HttpRequests")
                }), 
                ScriptInjectionPermissionContainer = next(l_scriptInjectionPermissions_0) and v1.createElement(v8, {
                    LayoutOrder = 4, 
                    renderContent = function() --[[ Line: 152 ]] --[[ Name: renderContent ]]
                        -- upvalues: v1 (ref), v7 (ref), l_assetId_0 (copy), l_scriptInjectionPermissions_0 (copy)
                        return v1.createElement(v7, {
                            assetId = l_assetId_0, 
                            scriptInjectionPermissions = l_scriptInjectionPermissions_0
                        });
                    end, 
                    theme = l_Stylizer_0, 
                    title = l_Localization_0:getText("Details", "ScriptInjection")
                })
            })
        })
    });
end;
v12 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12);
return v2.connect(function(v28, v29) --[[ Line: 171 ]] --[[ Name: mapStateToProps ]]
    local l_plugins_0 = v28.Management.plugins;
    local v31 = v28.PluginPermissions[v29.assetId];
    return {
        pluginData = l_plugins_0 and l_plugins_0[v29.assetId] or nil, 
        httpPermissions = v31 and v31.httpPermissions or {}, 
        scriptInjectionPermissions = v31 and v31.scriptInjectionPermissions or {}
    };
end, nil)(v12);
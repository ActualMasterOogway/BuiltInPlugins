local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Standalone_0 = require(l_script_FirstAncestor_0.Src.Util.CrossDMCommunication).Standalone;
local l_joinTags_0 = v2.Styling.joinTags;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = require(l_script_FirstAncestor_0.Src.Components.AnnotationListCard);
local v9 = require(l_script_FirstAncestor_0.Src.Components.SizedScrollingFrame);
local v10 = require(l_script_FirstAncestor_0.Src.Components.DropdownButton);
local v11 = require(l_script_FirstAncestor_0.Src.Util.rerenderReducer);
local l_AnnotationsService_0 = game:GetService("AnnotationsService");
return function(_) --[[ Line: 22 ]] --[[ Name: AnnotationListView ]]
    -- upvalues: l_Plugin_0 (copy), l_Localization_0 (copy), v1 (copy), l_AnnotationsService_0 (copy), v11 (copy), v8 (copy), l_Standalone_0 (copy), v10 (copy), v9 (copy), l_joinTags_0 (copy)
    local v14 = l_Plugin_0:use():get();
    local v15 = l_Localization_0:use();
    local v16, v17 = v1.useState(l_AnnotationsService_0:GetChildren());
    local v18, v19 = v1.useState(false);
    local v20, v21 = v1.useState(false);
    local _, v23 = v1.useReducer(v11, 0);
    v1.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: l_AnnotationsService_0 (ref), v17 (copy), v14 (copy), v23 (copy)
        local v24 = l_AnnotationsService_0.ChildAdded:Connect(function() --[[ Line: 31 ]]
            -- upvalues: v17 (ref), l_AnnotationsService_0 (ref)
            v17(l_AnnotationsService_0:GetChildren());
        end);
        local v25 = l_AnnotationsService_0.ChildRemoved:Connect(function() --[[ Line: 34 ]]
            -- upvalues: v17 (ref), l_AnnotationsService_0 (ref)
            v17(l_AnnotationsService_0:GetChildren());
        end);
        local v26 = v14:OnInvoke("UpdateAnnotation", v23);
        return function() --[[ Line: 38 ]]
            -- upvalues: v24 (copy), v25 (copy), v26 (copy)
            v24:Disconnect();
            v25:Disconnect();
            v26:Disconnect();
        end;
    end, {});
    local v27 = {};
    for v28, v29 in ipairs(v16) do
        if not v18 and not v29.Resolved or v18 and v29.Resolved then
            table.insert(v27, v1.createElement(v8, {
                LayoutOrder = v28, 
                Annotation = v29
            }));
        end;
    end;
    local v30 = #v27 == 0;
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-AnnotationListView X-Fill X-Column X-Center"
    }, {
        Header = if #v16 > 0 then v1.createElement("Frame", {
            LayoutOrder = 0
        }, {
            AddButton = v1.createElement("TextButton", {
                Text = ("+ %*"):format((v15:getText("AddAnnotation", "Button"))), 
                [v1.Event.Activated] = function() --[[ Line: 68 ]]
                    -- upvalues: v14 (copy), l_Standalone_0 (ref)
                    v14:Activate(true);
                    l_Standalone_0.beginAddAnnotation(v14);
                end
            }), 
            SettingsWrapper = v1.createElement("Frame", {}, {
                Settings = v1.createElement(v10, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    DropdownItems = {
                        ShowResolved = v1.createElement("TextButton", {
                            Text = "", 
                            [v1.Event.Activated] = function() --[[ Line: 79 ]]
                                -- upvalues: v19 (copy), v18 (copy)
                                v19(not v18);
                            end, 
                            [v1.Tag] = "Component-DropdownItem X-RowS X-Middle"
                        }, {
                            Checkbox = v1.createElement("ImageLabel", {
                                BackgroundTransparency = 1, 
                                [v1.Tag] = v18 and "CheckboxOnIcon" or "CheckboxOffIcon"
                            }), 
                            Text = v1.createElement("TextLabel", {
                                Text = v15:getText("Dropdown", "ShowResolved"), 
                                BackgroundTransparency = 1
                            })
                        }), 
                        HideAnnotations = v1.createElement("TextButton", {
                            Text = "", 
                            [v1.Event.Activated] = function() --[[ Line: 95 ]]
                                -- upvalues: l_Standalone_0 (ref), v14 (copy), v20 (copy), v21 (copy)
                                l_Standalone_0.setVisibility(v14, v20);
                                v21(not v20);
                            end, 
                            [v1.Tag] = "Component-DropdownItem X-RowS X-Middle"
                        }, {
                            Checkbox = v1.createElement("ImageLabel", {
                                BackgroundTransparency = 1, 
                                [v1.Tag] = v20 and "CheckboxOnIcon" or "CheckboxOffIcon"
                            }), 
                            Text = v1.createElement("TextLabel", {
                                Text = v15:getText("Dropdown", "HideInWorkspace"), 
                                BackgroundTransparency = 1
                            })
                        })
                    }, 
                    ImageTag = "SettingsIcon", 
                    [v1.Tag] = "Dropdown"
                }, {})
            })
        }) else nil, 
        AnnotationList = if not v30 then v1.createElement("Frame", {
            LayoutOrder = 2
        }, {
            AnnotationScrollingFrame = v1.createElement(v9, {
                OnScrollToBottom = v18 and function() --[[ Line: 123 ]]
                    -- upvalues: l_Standalone_0 (ref), v14 (copy)
                    l_Standalone_0.loadResolvedAnnotations(v14, 25);
                end or nil
            }, {
                BottomPadding = v1.createElement("Frame", {
                    LayoutOrder = #v27 + 1
                }); 
                table.unpack(v27)
            })
        }) else nil, 
        EmptyState = if #v27 == 0 then v1.createElement("Frame", {
            LayoutOrder = 3, 
            [v1.Tag] = l_joinTags_0("X-ColumnM X-Transparent X-Middle X-Center", #v16 ~= 0 and "HeaderOffset" or nil)
        }, {
            AnnotationIcon = v1.createElement("ImageLabel", {
                LayoutOrder = 0, 
                [v1.Tag] = "X-Transparent"
            }), 
            NoCommentsYet = v1.createElement("TextLabel", {
                LayoutOrder = 1, 
                Text = if not v18 then v15:getText("Plugin", "NoAnnotations") else v15:getText("Plugin", "NoResolvedAnnotations"), 
                [v1.Tag] = "X-Transparent"
            }), 
            ToBegin = if not v18 then v1.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v15:getText("Plugin", "ToBegin"), 
                [v1.Tag] = "X-Transparent"
            }) else nil, 
            AddButton = if not v18 then v1.createElement("TextButton", {
                LayoutOrder = 3, 
                Text = ("+ %*"):format((v15:getText("AddAnnotation", "Button"))), 
                [v1.Event.Activated] = function() --[[ Line: 165 ]]
                    -- upvalues: v14 (copy), l_Standalone_0 (ref)
                    v14:Activate(true);
                    l_Standalone_0.beginAddAnnotation(v14);
                end
            }) else nil
        }) else nil
    });
end;
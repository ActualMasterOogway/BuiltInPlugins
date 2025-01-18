local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Alert_0 = v2.UI.Alert;
local l_Pane_0 = v2.UI.Pane;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v11 = require(l_Components_0.Browser);
local v12 = require(l_Components_0.Editor);
local v13 = require(l_Components_0.Prompt);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v15 = game:DefineFastFlag("MaterialGeneratorFixBrowserLayout", false);
local v16 = require(l_script_FirstAncestor_0.Src.Hooks.useResponsiveLayout);
local v17 = require(l_script_FirstAncestor_0.Src.Resources.AppLayout);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v19 = require(l_script_FirstAncestor_0.Src.Util.GenerationContext);
local v20 = require(l_script_FirstAncestor_0.Src.Util.PreviewContext);
return function(v21) --[[ Line: 35 ]] --[[ Name: App ]]
    -- upvalues: v14 (copy), v3 (copy), v20 (copy), v19 (copy), v16 (copy), v17 (copy), l_LayoutOrderIterator_0 (copy), l_Stylizer_0 (copy), l_Localization_0 (copy), l_Pane_0 (copy), l_Alert_0 (copy), v13 (copy), v15 (copy), v11 (copy), v12 (copy), v1 (copy)
    assert(v14(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local l_selectedMaterial_0 = v3.useContext(v20).selectedMaterial;
    local v23 = v3.useContext(v19);
    local l_errorMessage_0 = v23.errorMessage;
    local v25, v26 = v16(v17);
    local v27 = l_LayoutOrderIterator_0.new();
    local v28 = l_Stylizer_0:use("App", v21);
    local v29 = l_Localization_0:use();
    local function v32() --[[ Line: 52 ]] --[[ Name: renderMainContent ]]
        -- upvalues: l_selectedMaterial_0 (copy), v26 (copy), v3 (ref), l_Pane_0 (ref), v27 (copy), l_errorMessage_0 (copy), l_Alert_0 (ref), v23 (copy), v29 (copy), v13 (ref), v28 (copy), v15 (ref), v11 (ref)
        local v30 = nil;
        local v31 = true;
        if l_selectedMaterial_0 and v26 then
            v30 = v26.mainContentSize;
            if v26.browserVisible == false then
                v31 = false;
            end;
        else
            v30 = UDim2.fromScale(1, 1);
        end;
        if v30 == UDim2.new() then
            return nil;
        else
            return v3.createElement(l_Pane_0, {
                LayoutOrder = v27:getNextOrder(), 
                Size = v30
            }, {
                Alert = if l_errorMessage_0 then v3.createElement(l_Alert_0, {
                    Description = l_errorMessage_0, 
                    OnClose = function() --[[ Line: 75 ]] --[[ Name: OnClose ]]
                        -- upvalues: v23 (ref)
                        v23.popError();
                    end, 
                    Style = "AppError", 
                    Title = v29:getText("App", "ErrorAlertTitle"), 
                    ZIndex = 2
                }) else nil, 
                Content = v3.createElement(l_Pane_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, {
                    Prompt = v3.createElement(v13, {
                        LayoutOrder = v27:getNextOrder(), 
                        Size = v28.PromptSize, 
                        isDisabled = l_errorMessage_0 ~= nil
                    }), 
                    Browser = if v15 then v3.createElement(v11, {
                        LayoutOrder = v27:getNextOrder(), 
                        Size = if v31 then v28.BrowserSize else v28.BrowserHiddenSize
                    }) else nil, 
                    DEPRECATED_Browser = if not v15 then if v31 then v3.createElement(v11, {
                        LayoutOrder = v27:getNextOrder(), 
                        Size = v28.BrowserSize
                    }) else nil else nil
                })
            });
        end;
    end;
    local function _() --[[ Line: 114 ]] --[[ Name: renderEditor ]]
        -- upvalues: l_selectedMaterial_0 (copy), v26 (copy), v3 (ref), v12 (ref), v27 (copy)
        if l_selectedMaterial_0 and v26 then
            return v3.createElement(v12, {
                LayoutOrder = v27:getNextOrder(), 
                Size = v26.editorSize
            });
        else
            return nil;
        end;
    end;
    local v34 = v1.join({
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = if v26 then v26.fillDirection else nil, 
        Style = "Box", 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, v25);
    return v3.createElement(l_Pane_0, v34, {
        MainContent = v32(), 
        Editor = if l_selectedMaterial_0 and v26 then v3.createElement(v12, {
            LayoutOrder = v27:getNextOrder(), 
            Size = v26.editorSize
        }) else nil
    });
end;
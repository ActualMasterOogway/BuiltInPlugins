local l_CollectionService_0 = game:GetService("CollectionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v6 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v7 = require(l_script_FirstAncestor_0.Packages.Framework);
local v8 = require(l_script_FirstAncestor_0.Packages.React);
local v9 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v10 = require(l_script_FirstAncestor_0.Packages.Dev.ReactTestingLibrary);
local v11 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
local v12 = require(l_script_FirstAncestor_0.RhodiumTests.Utils.onTestEnd);
local v13 = require(script.createDisambiguationMenuTestHelpers);
local v14 = require(l_script_FirstAncestor_0.RhodiumTests.createMockContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v16 = require(l_script_FirstAncestor_0.Src.Components.App);
local v17 = require(l_script_FirstAncestor_0.Src.Components.ContextStack);
local v18 = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local v19 = require(l_script_FirstAncestor_0.Src.Components.RunServiceContext);
local v20 = require(l_script_FirstAncestor_0.Src.Components.UGCAvatarServiceContext);
local v21 = require(l_script_FirstAncestor_0.RhodiumTests.UGCValidationContextMocks);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAddGeoToSelection);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCatalogUndo);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local l_provideMockContext_0 = v7.TestHelpers.provideMockContext;
local v29 = {
    testAssets = l_ServerStorage_0.TestAssets, 
    clickSimpleTab = function(v28) --[[ Line: 40 ]] --[[ Name: clickSimpleTab ]]
        -- upvalues: v9 (copy), v11 (copy)
        v28.Size = UDim2.fromOffset(0, 1);
        v9.act(function() --[[ Line: 45 ]]
            -- upvalues: v11 (ref), v28 (copy)
            v11.Element.new(v28):click();
        end);
    end
};
v29.cloneLizard = function(v30) --[[ Line: 50 ]] --[[ Name: cloneLizard ]]
    -- upvalues: v29 (copy), v12 (copy), l_Workspace_0 (copy)
    local v31 = v29.testAssets.Lizard:Clone();
    if v30 ~= nil then
        v31.Name = v30;
    end;
    v12(function() --[[ Line: 57 ]]
        -- upvalues: v31 (copy)
        v31:Destroy();
    end);
    v31.Parent = l_Workspace_0;
    return v31;
end;
v29.cloneRigidHat = function() --[[ Line: 66 ]] --[[ Name: cloneRigidHat ]]
    -- upvalues: v29 (copy), v12 (copy), l_Workspace_0 (copy)
    local v32 = v29.testAssets.RigidHat:Clone();
    v12(function() --[[ Line: 69 ]]
        -- upvalues: v32 (copy)
        v32:Destroy();
    end);
    v32.Parent = l_Workspace_0;
    return v32;
end;
local function v41(v33) --[[ Line: 86 ]] --[[ Name: setViewportToolingFrameworkZIndex ]]
    -- upvalues: v24 (copy), l_CollectionService_0 (copy)
    if not v24() then
        return function() --[[ Line: 88 ]]

        end;
    else
        local function v36(v34) --[[ Line: 91 ]] --[[ Name: setZIndex ]]
            -- upvalues: v33 (copy)
            local l_v34_FirstAncestorWhichIsA_0 = v34:FindFirstAncestorWhichIsA("ScreenGui");
            assert(l_v34_FirstAncestorWhichIsA_0 ~= nil, "Couldn't find ScreenGui for toolbar");
            l_v34_FirstAncestorWhichIsA_0.DisplayOrder = v33;
        end;
        for _, v38 in (l_CollectionService_0:GetTagged("VPF-Toolbar")) do
            local l_v38_FirstAncestorWhichIsA_0 = v38:FindFirstAncestorWhichIsA("ScreenGui");
            assert(l_v38_FirstAncestorWhichIsA_0 ~= nil, "Couldn't find ScreenGui for toolbar");
            l_v38_FirstAncestorWhichIsA_0.DisplayOrder = v33;
        end;
        local v40 = l_CollectionService_0:GetInstanceAddedSignal("VPF-Toolbar"):Connect(v36);
        return function() --[[ Line: 106 ]]
            -- upvalues: v40 (copy)
            v40:Disconnect();
        end;
    end;
end;
local function v139(v42) --[[ Line: 111 ]] --[[ Name: createTestPreviewer ]]
    -- upvalues: l_HttpService_0 (copy), l_CoreGui_0 (copy), v9 (copy), v14 (copy), v6 (copy), v8 (copy), v17 (copy), v23 (copy), v20 (copy), v18 (copy), v19 (copy), v21 (copy), v16 (copy), v26 (copy), l_provideMockContext_0 (copy), v11 (copy), v29 (copy), v25 (copy), v10 (copy), v22 (copy), v13 (copy)
    local l_Folder_0 = Instance.new("Folder");
    local v44 = ("AvatarPreviewer_%*"):format((l_HttpService_0:GenerateGUID()));
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = v44;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local v46 = v9.createBlockingRoot(l_ScreenGui_0);
    local v47, v48 = v14();
    v47.plugin.GetSelectedRibbonTool = function(_) --[[ Line: 125 ]] --[[ Name: GetSelectedRibbonTool ]]
        return Enum.RibbonTool.Move;
    end;
    local v51 = {
        isRunning = function() --[[ Line: 130 ]] --[[ Name: isRunning ]]
            -- upvalues: v42 (copy)
            local v50 = false;
            if v42 ~= nil then
                v50 = v42.runServiceIsRunning == true;
            end;
            return v50;
        end
    };
    if v42 ~= nil and v42.devFrameworkContexts ~= nil then
        v47.context = v6.List.join(v47.context, v42.devFrameworkContexts);
    end;
    v9.act(function() --[[ Line: 139 ]]
        -- upvalues: v8 (ref), v17 (ref), v6 (ref), v23 (ref), v20 (ref), l_Folder_0 (copy), v18 (ref), v48 (copy), v19 (ref), v51 (copy), v21 (ref), v42 (copy), v16 (ref), v26 (ref), v46 (copy), l_provideMockContext_0 (ref), v47 (copy)
        local v52 = v8.createElement(v17, {
            providers = v6.List.join(if not v23() then {
                v8.createElement(v20.Provider, {
                    value = l_Folder_0
                })
            } else {}, {
                v8.createElement(v18.Provider, {
                    value = v48.placesService
                }), 
                v8.createElement(v19.Provider, {
                    value = v51
                }), 
                v8.createElement(v21.NeverReturnsProvider)
            }, if v42 ~= nil and v42.wrapAppContexts ~= nil then v42.wrapAppContexts else {})
        }, v8.createElement(v16, {
            DEPRECATED_additionalAvatarContext = if v26() then nil else v6.List.join({
                v8.createElement(v21.NeverReturnsProvider)
            }, v42 and v42.DEPRECATED_additionalAvatarContext or {})
        }));
        v46:render(l_provideMockContext_0(v47.context, v52));
    end);
    assert(#l_ScreenGui_0:GetChildren() > 0, "Container is empty after mount");
    local v57 = {
        ui = assert(l_CoreGui_0:FindFirstChild(v44), "Couldn't find previewer screen"), 
        placesService = v47.placesService, 
        destroy = function() --[[ Line: 184 ]] --[[ Name: destroy ]]
            -- upvalues: v9 (ref), v46 (copy), l_ScreenGui_0 (copy)
            v9.act(function() --[[ Line: 185 ]]
                -- upvalues: v46 (ref)
                v46:unmount();
            end);
            l_ScreenGui_0:Destroy();
        end, 
        select = function(v53) --[[ Line: 192 ]] --[[ Name: select ]]
            -- upvalues: v9 (ref), v47 (copy)
            v9.act(function() --[[ Line: 193 ]]
                -- upvalues: v47 (ref), v53 (copy)
                v47.selectionService:Set(v53);
            end);
        end, 
        getSelection = function() --[[ Line: 198 ]] --[[ Name: getSelection ]]
            -- upvalues: v47 (copy)
            return v47.selectionService:Get();
        end, 
        getLastAnalyticsEvent = function() --[[ Line: 202 ]] --[[ Name: getLastAnalyticsEvent ]]
            -- upvalues: v47 (copy)
            return v47.analyticsService.lastEvent;
        end, 
        subWindows = function() --[[ Line: 206 ]] --[[ Name: subWindows ]]
            -- upvalues: v47 (copy)
            return v47.plugin.subWindows;
        end, 
        getSubWindow = function(v54) --[[ Line: 210 ]] --[[ Name: getSubWindow ]]
            -- upvalues: v47 (copy)
            return v47.plugin:GetSubWindow(v54);
        end, 
        getStyledDialogButton = function(v55, v56) --[[ Line: 214 ]] --[[ Name: getStyledDialogButton ]]
            return v55.SolidBackground.ButtonContainer[v56].Contents.TextButton;
        end
    };
    v57.clickStyledDialogButton = function(v58, v59) --[[ Line: 218 ]] --[[ Name: clickStyledDialogButton ]]
        -- upvalues: v9 (ref), v11 (ref), v57 (copy)
        v9.act(function() --[[ Line: 219 ]]
            -- upvalues: v11 (ref), v57 (ref), v58 (copy), v59 (copy)
            v11.Element.new(v57.getStyledDialogButton(v58, v59)):click();
        end);
    end;
    v57.getStyledDialogContent = function(v60) --[[ Line: 224 ]] --[[ Name: getStyledDialogContent ]]
        return v60.SolidBackground.Contents.Contents;
    end;
    v57.selectFreshLizard = function() --[[ Line: 228 ]] --[[ Name: selectFreshLizard ]]
        -- upvalues: v57 (copy), v29 (ref), v44 (copy)
        return v57.select({
            v29.cloneLizard((("FreshLizard_%*"):format(v44)))
        });
    end;
    v57.pathOf = function(v61) --[[ Line: 232 ]] --[[ Name: pathOf ]]
        -- upvalues: v11 (ref), v44 (copy)
        local v62 = if typeof(v61) == "string" then v61 else v61:toString();
        return v11.XPath.new((("game.CoreGui.%*.%*"):format(v44, v62)));
    end;
    v57.elementByPath = function(v63) --[[ Line: 238 ]] --[[ Name: elementByPath ]]
        -- upvalues: v11 (ref), v57 (copy)
        return v11.Element.new(v57.pathOf(v63));
    end;
    v57.debugPath = function(v64) --[[ Line: 242 ]] --[[ Name: debugPath ]]
        -- upvalues: v11 (ref), v57 (copy)
        local v65 = nil;
        local v66 = if typeof(v64) == "string" then v11.XPath.new(v64) else v64;
        while true do
            local v67 = v66:parent();
            if v67:toString() ~= v66:toString() then
                v65 = v57.elementByPath(v67:setWait(0)):getRbxInstance();
                if v65 == nil then
                    v66 = v67;
                else
                    break;
                end;
            else
                break;
            end;
        end;
        local v68 = {};
        if v65 then
            table.insert(v68, v65:GetFullName());
            table.insert(v68, "Children found:");
            for _, v70 in v65:GetChildren() do
                table.insert(v68, (("\t- %*"):format(v70.Name)));
            end;
        else
            table.insert(v68, "No segment found");
        end;
        return table.concat(v68, "\n");
    end;
    v57.expectElementByPath = function(v71) --[[ Line: 278 ]] --[[ Name: expectElementByPath ]]
        -- upvalues: v57 (copy)
        local v72 = v57.elementByPath(v71);
        if v72:getRbxInstance() == nil then
            local v73 = if typeof(v71) == "string" then v71 else v71:toString();
            error((("%* was not found\nClosest match: %*"):format(v73, (v57.debugPath(v71)))));
        end;
        return v72;
    end;
    v57.expectInstanceByPath = function(v74) --[[ Line: 290 ]] --[[ Name: expectInstanceByPath ]]
        -- upvalues: v57 (copy)
        return v57.expectElementByPath(v74):getRbxInstance();
    end;
    v57.instanceByPath = function(v75) --[[ Line: 294 ]] --[[ Name: instanceByPath ]]
        -- upvalues: v11 (ref), v57 (copy)
        return v11.Element.new(v57.pathOf(v75):setWait(0)):getRbxInstance();
    end;
    v57.clickPath = function(v76) --[[ Line: 298 ]] --[[ Name: clickPath ]]
        -- upvalues: v9 (ref), v57 (copy)
        v9.act(function() --[[ Line: 299 ]]
            -- upvalues: v57 (ref), v76 (copy)
            v57.expectElementByPath(v76):click();
        end);
    end;
    v57.getByImage = function(v77) --[[ Line: 305 ]] --[[ Name: getByImage ]]
        -- upvalues: v57 (copy)
        local v78 = {};
        for _, v80 in v57.ui:GetDescendants() do
            if (v80:IsA("ImageLabel") or v80:IsA("ImageButton")) and v80.Image:match("rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/[^/]+/[^/]+/([^@]*).*%.png") == v77 then
                table.insert(v78, v80);
            end;
        end;
        return v78;
    end;
    v57.resize = function(v81, v82) --[[ Line: 325 ]] --[[ Name: resize ]]
        -- upvalues: v9 (ref), l_ScreenGui_0 (copy)
        v9.act(function() --[[ Line: 326 ]]
            -- upvalues: l_ScreenGui_0 (ref), v81 (copy), v82 (copy)
            l_ScreenGui_0:GetChildren()[1].Size = UDim2.fromOffset(v81, v82);
            task.wait();
        end);
    end;
    v57.resizeToDefault = function() --[[ Line: 335 ]] --[[ Name: resizeToDefault ]]
        -- upvalues: v57 (copy)
        v57.resize(1024, 758);
    end;
    v57.AvatarScreen = {};
    v57.AvatarScreen.XPATH_ASSET_PALETTES = v25() and "AvatarScreen.Contents.Tabs.AssetPalettes.ScrollingFrame.Scroller.Tabs" or "AvatarScreen.Contents.Tabs.AssetPalettes.Scroller.Tabs";
    local function v87(v83, v84) --[[ Line: 344 ]] --[[ Name: clickOneOfTabs ]]
        -- upvalues: v57 (copy), v29 (ref)
        for _, v86 in v57.expectInstanceByPath(v83):GetChildren() do
            if v86:IsA("TextButton") and v86.Row.Label.Text:match((("%%.%*:"):format(v84))) then
                assert(v86:IsA("TextButton"), "Tab should be a button");
                v29.clickSimpleTab(v86);
                return;
            end;
        end;
        error((("Could not find %*"):format(v84)));
    end;
    v57.AvatarScreen.isActive = function() --[[ Line: 361 ]] --[[ Name: isActive ]]
        -- upvalues: v57 (copy)
        return v57.instanceByPath("AvatarScreen") ~= nil;
    end;
    v57.AvatarScreen.isPalettesPickTabMenuActive = function() --[[ Line: 365 ]] --[[ Name: isPalettesPickTabMenuActive ]]
        -- upvalues: v57 (copy)
        return v57.instanceByPath("AvatarScreen.Contents.Tabs.AssetPalettes.PickTabMenu") ~= nil;
    end;
    v57.AvatarScreen.isCategoryPickTabMenuActive = function() --[[ Line: 369 ]] --[[ Name: isCategoryPickTabMenuActive ]]
        -- upvalues: v57 (copy)
        return v57.instanceByPath("AvatarScreen.Contents.Tabs.TabBar.PickTabMenu") ~= nil;
    end;
    v57.AvatarScreen.isAvatarSettingsActive = function() --[[ Line: 373 ]] --[[ Name: isAvatarSettingsActive ]]
        -- upvalues: v57 (copy)
        return v57.instanceByPath("TopLevelDetector.ScrollBlocker.ScrollBlocker") ~= nil;
    end;
    local function v90(v88) --[[ Line: 378 ]] --[[ Name: waitUntilActive ]]
        -- upvalues: v57 (copy), v9 (ref)
        local v89 = os.clock();
        while true do
            if os.clock() - v89 < (v88 or 1) then
                if v57.AvatarScreen.isActive() then
                    return;
                else
                    v9.act(task.wait);
                end;
            else
                error("AvatarScreen didn't become active within timeout");
                return;
            end;
        end;
    end;
    v57.AvatarScreen.waitUntilActive = v90;
    v57.AvatarScreen.clickCategory = function(v91) --[[ Line: 391 ]] --[[ Name: clickCategory ]]
        -- upvalues: v87 (copy)
        v87("AvatarScreen.Contents.Tabs.TabBar.ScrollingFrame.Scroller.Tabs", v91);
    end;
    v57.AvatarScreen.clickPalette = function(v92) --[[ Line: 395 ]] --[[ Name: clickPalette ]]
        -- upvalues: v87 (copy), v57 (copy)
        v87(v57.AvatarScreen.XPATH_ASSET_PALETTES, v92);
    end;
    v90 = function(v93) --[[ Line: 399 ]] --[[ Name: clickBuiltin ]]
        -- upvalues: v57 (copy), v9 (ref)
        local v94 = v57.expectElementByPath((("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.ScrollingFrame.Scroller.item_builtin_%*.Contents.TextButton"):format(v93)));
        v9.act(function() --[[ Line: 404 ]]
            -- upvalues: v94 (copy)
            v94:click();
        end);
    end;
    v57.AvatarScreen.clickBuiltin = v90;
    v90 = function(v95) --[[ Line: 409 ]] --[[ Name: clickInstance ]]
        -- upvalues: v57 (copy), v9 (ref)
        local v96 = v57.expectElementByPath((("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.ScrollingFrame.Scroller.item_instance_%*.Contents.TextButton"):format(v95)));
        v9.act(function() --[[ Line: 414 ]]
            -- upvalues: v96 (copy)
            v96:click();
        end);
    end;
    v57.AvatarScreen.clickInstance = v90;
    v57.AvatarScreen.catalogItemCounts = function() --[[ Line: 419 ]] --[[ Name: catalogItemCounts ]]
        -- upvalues: v57 (copy)
        local v97 = v57.expectInstanceByPath("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.ScrollingFrame.Scroller");
        local v98 = 0;
        local v99 = 0;
        for _, v101 in v97:GetChildren() do
            local v102, v103 = v101.Name:match("item_([a-z]+)_([0-9]+)");
            if v102 ~= nil and v103 ~= nil then
                local v104 = tonumber(v103);
                assert(v104 ~= nil, "Pattern should not be returning non-numeric indexes");
                if v102 == "builtin" then
                    v98 = math.max(v98, v104);
                elseif v102 == "instance" then
                    v99 = math.max(v99, v104);
                else
                    error((("Unknown item type: %*"):format(v102)));
                end;
            end;
        end;
        return {
            builtins = v98, 
            instances = v99
        };
    end;
    v57.AvatarScreen.selectedPaletteText = function() --[[ Line: 454 ]] --[[ Name: selectedPaletteText ]]
        -- upvalues: v57 (copy)
        for _, v106 in v57.expectInstanceByPath(v57.AvatarScreen.XPATH_ASSET_PALETTES):GetChildren() do
            if v106:IsA("TextButton") and v106.Row.Label.FontFace.Bold then
                return v106.Row.Label.Text;
            end;
        end;
        error("Palettes are open, but there is no open palette");
    end;
    v57.AvatarScreen.selectedPaletteKey = function() --[[ Line: 468 ]] --[[ Name: selectedPaletteKey ]]
        -- upvalues: v57 (copy)
        return (assert(v57.AvatarScreen.selectedPaletteText():match(".+%.(.-):%[%]$"), "Couldn't match palette key"));
    end;
    v57.AvatarScreen.getDummy = function() --[[ Line: 476 ]] --[[ Name: getDummy ]]
        -- upvalues: v57 (copy)
        local v107 = v57.elementByPath("AvatarScreen.Contents.Contents.Preview.DummyPreview.DummyPreview.WorldModel.Dummy"):waitForRbxInstance(5);
        if v107 ~= nil then
            return v107;
        else
            return (v57.expectInstanceByPath("AvatarScreen.Contents.Contents.Preview.DummyPreview.DummyPreview.WorldModel.Dummy"));
        end;
    end;
    v57.AvatarScreen.clickAddItem = function() --[[ Line: 486 ]] --[[ Name: clickAddItem ]]
        -- upvalues: v57 (copy)
        v57.clickPath("AvatarScreen.Contents.Contents.CatalogContainer.CatalogContainer.Catalog.AddItemButton");
    end;
    v90 = function() --[[ Line: 496 ]] --[[ Name: getSidebarItems ]]
        -- upvalues: v57 (copy), v10 (ref)
        local function _(v108) --[[ Line: 500 ]] --[[ Name: previewFor ]]
            if v108:IsA("ImageLabel") then
                return v108.Image;
            else
                return v108;
            end;
        end;
        local function v112(v110, v111) --[[ Line: 504 ]] --[[ Name: sortByYPosition ]]
            return v110.yPosition < v111.yPosition;
        end;
        local v113 = v57.expectInstanceByPath("AvatarScreen.Contents.Contents.Preview.EquippedItemsSidebar");
        local v114 = {};
        for _, v116 in v113.Contents.LayeredClothingEquipment:GetChildren() do
            local v117 = {
                yPosition = v116.AbsolutePosition.Y, 
                instance = v116
            };
            local l_Preview_0 = v10.getByTestId(v116, "EquippedItemPreview").Inner.Preview;
            v117.preview = if l_Preview_0:IsA("ImageLabel") then l_Preview_0.Image else l_Preview_0;
            table.insert(v114, v117);
        end;
        local v119 = {};
        for _, v121 in v113.OtherEquipment.Scroller:GetChildren() do
            if v121:IsA("Frame") then
                local v122 = {
                    yPosition = v121.AbsolutePosition.Y, 
                    instance = v121
                };
                local l_Preview_1 = v121.Inner.Preview;
                v122.preview = if l_Preview_1:IsA("ImageLabel") then l_Preview_1.Image else l_Preview_1;
                table.insert(v119, v122);
            end;
        end;
        table.sort(v114, v112);
        table.sort(v119, v112);
        return {
            layeredClothing = v114, 
            otherEquipment = v119
        };
    end;
    v57.AvatarScreen.getSidebarItems = v90;
    v57.AvatarScreen.clickSubmitButton = function() --[[ Line: 544 ]] --[[ Name: clickSubmitButton ]]
        -- upvalues: v57 (copy)
        v57.clickPath("AvatarScreen.StageSelect.Contents.Publish");
    end;
    v57.AvatarScreen.clickCheckBodyMode = function() --[[ Line: 548 ]] --[[ Name: clickCheckBodyMode ]]
        -- upvalues: v57 (copy)
        v57.clickPath("AvatarScreen.StageSelect.Contents.CheckBody");
    end;
    v57.AvatarScreen.clickCheckFaceMode = function() --[[ Line: 552 ]] --[[ Name: clickCheckFaceMode ]]
        -- upvalues: v57 (copy)
        v57.clickPath("AvatarScreen.StageSelect.Contents.CheckFace");
    end;
    v57.AvatarScreen.clickAvatarSettings = function() --[[ Line: 556 ]] --[[ Name: clickAvatarSettings ]]
        -- upvalues: v57 (copy)
        v57.clickPath("AvatarScreen.StageSelect.SettingsButton");
    end;
    v90 = function() --[[ Line: 560 ]] --[[ Name: clickHideShowButton ]]
        -- upvalues: v57 (copy), v9 (ref), v11 (ref)
        local v124 = v57.AvatarScreen.getSidebarItems();
        local v125 = nil;
        for _, v127 in v124.layeredClothing do
            local l_instance_0 = v127.instance;
            v9.act(function() --[[ Line: 565 ]]
                -- upvalues: v11 (ref), l_instance_0 (copy)
                v11.VirtualInput.Mouse.SendMouseMoveEvent(l_instance_0.AbsolutePosition.X, l_instance_0.AbsolutePosition.Y);
                v11.VirtualInput.waitForInputEventsProcessed();
            end);
            local v129 = l_instance_0:GetChildren()[1];
            if v129 ~= nil then
                v125 = v129:FindFirstChild("Outer"):GetChildren()[1]:FindFirstChild("HideShowPane");
            end;
            if v125 ~= nil then
                break;
            end;
        end;
        assert(v125 ~= nil, "did not find button");
        local l_v125_FullName_0 = v125:GetFullName();
        local v131 = string.find(l_v125_FullName_0, "AvatarScreen");
        assert(v131 ~= nil, "invalid path");
        v57.clickPath((string.sub(l_v125_FullName_0, v131)));
    end;
    v57.AvatarScreen.clickHideShowButton = v90;
    v90 = function() --[[ Line: 591 ]] --[[ Name: getSkinToneButtons ]]
        -- upvalues: v57 (copy), v10 (ref), v9 (ref), v11 (ref)
        assert(v57.AvatarScreen.selectedPaletteKey() == "Skin", "Not on Skin tab");
        local v132 = {};
        for _, v134 in v10.getAllByTestId(v57.ui, "SkinPreview") do
            table.insert(v132, {
                color = v134.BackgroundColor3, 
                click = function() --[[ Line: 606 ]] --[[ Name: click ]]
                    -- upvalues: v9 (ref), v11 (ref), v134 (copy)
                    v9.act(function() --[[ Line: 607 ]]
                        -- upvalues: v11 (ref), v134 (ref)
                        v11.Element.new(v134):click();
                    end);
                end, 
                isClickable = not v134:IsA("TextButton")
            });
        end;
        return v132;
    end;
    v57.AvatarScreen.getSkinToneButtons = v90;
    v57.AutoSetupScreen = {};
    v57.AutoSetupScreen.getAlertDescription = function() --[[ Line: 623 ]] --[[ Name: getAlertDescription ]]
        -- upvalues: v57 (copy)
        local v135 = v57.instanceByPath("Provider.ErrorAlert.Alert.Contents.Description");
        local v136 = true;
        if v135 ~= nil then
            v136 = v135:IsA("TextLabel");
        end;
        assert(v136, "Description isn't a valid instance");
        return v135 and v135.Text;
    end;
    v57.AutoSetupScreen.getAlertTitle = function() --[[ Line: 629 ]] --[[ Name: getAlertTitle ]]
        -- upvalues: v57 (copy)
        local v137 = v57.instanceByPath("Provider.GenerationCard.TitlePane.Title");
        local v138 = true;
        if v137 ~= nil then
            v138 = v137:IsA("TextLabel");
        end;
        assert(v138, "Title isn't a valid instance");
        return v137 and v137.Text;
    end;
    v57.AutoSetupScreen.getDummy = function() --[[ Line: 635 ]] --[[ Name: getDummy ]]
        -- upvalues: v57 (copy)
        return (v57.expectInstanceByPath("Provider.ModelPreview.ModelPreview.ViewportFrame.WorldModel.Dummy"));
    end;
    v57.AutoSetupScreen.startAutoSetup = function() --[[ Line: 641 ]] --[[ Name: startAutoSetup ]]
        -- upvalues: v57 (copy)
        v57.clickPath("Provider.Controls.Start");
    end;
    v57.AutoSetupScreen.controlsActive = function() --[[ Line: 645 ]] --[[ Name: controlsActive ]]
        -- upvalues: v57 (copy)
        assert(v57.AutoSetupScreen.isActive(), "Auto setup screen is not active");
        return v57.instanceByPath("Provider.Controls") ~= nil;
    end;
    v57.AutoSetupScreen.isActive = function() --[[ Line: 650 ]] --[[ Name: isActive ]]
        -- upvalues: v57 (copy)
        return v57.instanceByPath("Provider.ModelPreview.ModelPreview.ViewportFrame.WorldModel.Dummy") ~= nil;
    end;
    v57.SelectScreen = {};
    v90 = function() --[[ Line: 656 ]] --[[ Name: isActive ]]
        -- upvalues: v22 (ref), v57 (copy)
        if v22() then
            return v57.instanceByPath("Provider.Buttons") ~= nil;
        else
            return v57.instanceByPath("Provider.ImportCharacterFrom") ~= nil;
        end;
    end;
    v57.SelectScreen.isActive = v90;
    v57.SelectScreen.clickAddSelected = function() --[[ Line: 664 ]] --[[ Name: clickAddSelected ]]
        -- upvalues: v57 (copy)
        v57.clickPath("Provider.Buttons.AddSelected");
    end;
    v57.DisambiguationMenu = v13(v57);
    v57.TestingScreen = {};
    v57.TestingScreen.isActive = function() --[[ Line: 672 ]] --[[ Name: isActive ]]
        -- upvalues: v57 (copy)
        return v57.instanceByPath("Provider.StopButton") ~= nil;
    end;
    v57.TestingScreen.clickStop = function() --[[ Line: 676 ]] --[[ Name: clickStop ]]
        -- upvalues: v57 (copy)
        v57.clickPath("Provider.StopButton");
    end;
    return v57;
end;
v29.withTestPreviewer = function(v140, v141) --[[ Line: 685 ]] --[[ Name: withTestPreviewer ]]
    -- upvalues: v139 (copy), v41 (copy)
    return function() --[[ Line: 686 ]]
        -- upvalues: v139 (ref), v141 (copy), v41 (ref), v140 (copy)
        local v142 = v139(v141);
        local v143 = v41(-1);
        v140(v142);
        v143();
        v142.destroy();
    end;
end;
v29.withClonedLizard = function(v144) --[[ Line: 695 ]] --[[ Name: withClonedLizard ]]
    -- upvalues: v29 (copy)
    return function() --[[ Line: 696 ]]
        -- upvalues: v29 (ref), v144 (copy)
        local v145 = v29.cloneLizard("ClonedLizard");
        v144(v145);
    end;
end;
v29.withPreviewerAndLizard = function(v146, v147) --[[ Line: 702 ]] --[[ Name: withPreviewerAndLizard ]]
    -- upvalues: v29 (copy)
    return v29.withTestPreviewer(function(v148) --[[ Line: 706 ]]
        -- upvalues: v29 (ref), v146 (copy)
        return v29.withClonedLizard(function(v149) --[[ Line: 707 ]]
            -- upvalues: v148 (copy), v146 (ref)
            v148.select({
                v149
            });
            v146(v148, v149);
        end)();
    end, v147);
end;
v29.cloneAutoSetupTarget = function() --[[ Line: 714 ]] --[[ Name: cloneAutoSetupTarget ]]
    -- upvalues: v29 (copy), l_Workspace_0 (copy), v12 (copy)
    local v150 = v29.testAssets.AutoSetupTarget:Clone();
    v150.Parent = l_Workspace_0;
    v12(function() --[[ Line: 718 ]]
        -- upvalues: v150 (copy)
        v150:Destroy();
    end);
    return v150;
end;
v29.deferYield = function() --[[ Line: 725 ]] --[[ Name: deferYield ]]
    local v151 = coroutine.running();
    task.defer(task.spawn, v151);
    coroutine.yield();
end;
return v29;
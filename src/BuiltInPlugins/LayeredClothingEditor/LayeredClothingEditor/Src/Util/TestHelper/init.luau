local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_ItemCharacteristics_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.ItemCharacteristics;
local v4 = require(l_Parent_0.Packages.Dev.Rhodium);
local l_Element_0 = v4.Element;
local l_XPath_0 = v4.XPath;
local l_Localization_0 = v1.ContextServices.Localization;
local v8 = require(l_Parent_0.Src.Reducers.MainReducer);
local v9 = {
    DefaultClothesName = "clothes", 
    DefaultAvatarName = "dummy", 
    AttachmentCFrame = CFrame.new(10, 20, 10), 
    DefaultAttachmentName = "WaistFrontAttachment", 
    DefaultMeshId = "https://assetdelivery.roblox.com/v1/asset/?id=6799863967"
};
local function _() --[[ Line: 28 ]] --[[ Name: delay ]]
    wait(0.1);
end;
v9.delay = function() --[[ Line: 33 ]] --[[ Name: delay ]]
    wait(0.1);
end;
v9.createTestStore = function() --[[ Line: 37 ]] --[[ Name: createTestStore ]]
    -- upvalues: v2 (copy), v8 (copy)
    local v11 = {
        v2.thunkMiddleware
    };
    return v2.Store.new(v8, nil, v11);
end;
v9.clickElement = function(v12, v13) --[[ Line: 42 ]] --[[ Name: clickElement ]]
    v12:click(v13);
    wait(0.1);
end;
v9.sendInputToXPath = function(v14, v15) --[[ Line: 47 ]] --[[ Name: sendInputToXPath ]]
    -- upvalues: v9 (copy)
    local v16 = v9.clickXPath(v14, 2);
    wait(0.1);
    v16:sendKey(Enum.KeyCode.Backspace);
    wait(0.1);
    v16:sendText(v15);
    wait(0.1);
    v16:sendKey(Enum.KeyCode.Return);
    wait(0.1);
end;
v9.confirmDialog = function() --[[ Line: 58 ]] --[[ Name: confirmDialog ]]
    -- upvalues: l_Localization_0 (copy), l_XPath_0 (copy), v9 (copy)
    local v17 = l_Localization_0.mock():getText("Dialog", "DefaultTitle");
    local v18 = l_XPath_0.new(game.CoreGui[v17]):cat(l_XPath_0.new("SolidBackground.ButtonContainer.1.Contents.TextButton"));
    v9.waitForXPathInstance(v18);
    v9.clickXPath(v18);
end;
v9.goToAssetTypeScreenFromStart = function(v19, v20) --[[ Line: 66 ]] --[[ Name: goToAssetTypeScreenFromStart ]]
    -- upvalues: v9 (copy), l_XPath_0 (copy)
    local v21 = v9.getScreenFlow():cat(l_XPath_0.new("SelectFrame.Content")):cat(l_XPath_0.new("NextAndBackButtonContainer.NextButton.Contents.TextButton"));
    v9.waitForXPathInstance(v21);
    if v19 then
        v9.addLCItemWithFullCageFromExplorer();
    elseif v20 then
        v9.addLCItemWithAttachmentFromExplorer();
    else
        v9.addLCItemWithoutCageFromExplorer();
    end;
    v9.clickXPath(v21);
    wait(0.1);
end;
v9.goToEditScreenFromStart = function(v22, v23) --[[ Line: 86 ]] --[[ Name: goToEditScreenFromStart ]]
    -- upvalues: v9 (copy), l_XPath_0 (copy)
    v9.goToAssetTypeScreenFromStart(v22, v23);
    local v24 = v9.getScreenFlow(true):cat(l_XPath_0.new("ExpandablePane.Content"));
    local v25 = v24:cat(l_XPath_0.new("Content.ClothingTypeList.List.Shirt"));
    local v26 = v24:cat(l_XPath_0.new("Content.AccessoryTypeList.List.Waist"));
    local v27 = v24:cat(l_XPath_0.new("Content.List.Front"));
    local v28 = v24:cat(l_XPath_0.new("NextAndBackButtonContainer.NextButton.Contents.TextButton"));
    if v22 then
        v9.waitForXPathInstance(v25);
        v9.clickXPath(v25);
    else
        v9.waitForXPathInstance(v26);
        v9.clickXPath(v26);
        v9.waitForXPathInstance(v28);
        v9.clickXPath(v28);
        v9.waitForXPathInstance(v27);
        v9.clickXPath(v27);
    end;
    v9.waitForXPathInstance(v28);
    v9.clickXPath(v28);
    wait(0.1);
end;
v9.clickEquippableGridTile = function(v29) --[[ Line: 116 ]] --[[ Name: clickEquippableGridTile ]]
    -- upvalues: v9 (copy), l_XPath_0 (copy)
    local v30 = v9.getEquippableGridTilePath(v29);
    v9.waitForXPathInstance(v30);
    local v31 = v30:cat(l_XPath_0.new("Contents.TextButton"));
    v9.waitForXPathInstance(v31);
    v9.clickXPath(v31);
end;
v9.getEquippableGridTilePath = function(v32) --[[ Line: 125 ]] --[[ Name: getEquippableGridTilePath ]]
    -- upvalues: v9 (copy), l_XPath_0 (copy)
    local v33 = v9.getEditScreenContainer():cat(l_XPath_0.new("PreviewSwizzle.Content.PreviewFrame.Grid")):cat(l_XPath_0.new("ScrollingFrame.Scroller"));
    local v34 = v32 + 1;
    return v33:cat(l_XPath_0.new((tostring(v34))));
end;
v9.getEquippableGridTileInstance = function(v35) --[[ Line: 136 ]] --[[ Name: getEquippableGridTileInstance ]]
    -- upvalues: v9 (copy)
    local v36 = v9.getEquippableGridTilePath(v35);
    return v9.waitForXPathInstance(v36);
end;
v9.clickXPath = function(v37, v38) --[[ Line: 141 ]] --[[ Name: clickXPath ]]
    -- upvalues: l_Element_0 (copy), v9 (copy)
    local v39 = l_Element_0.new(v37);
    v9.clickElement(v39, v38);
    return v39;
end;
local function v42(v40) --[[ Line: 147 ]] --[[ Name: waitForValidFunctionWithTimeout ]]
    local v41 = os.time();
    while true do
        if not v40() then
            if os.time() - v41 > 5 then
                return false;
            else
                wait(0.1);
            end;
        else
            return true;
        end;
    end;
end;
v9.waitForValid = function(v43) --[[ Line: 158 ]] --[[ Name: waitForValid ]]
    -- upvalues: v42 (copy)
    return (v42(v43));
end;
v9.waitForXPathInstance = function(v44) --[[ Line: 162 ]] --[[ Name: waitForXPathInstance ]]
    -- upvalues: v42 (copy)
    if v42(function() --[[ Line: 163 ]]
        -- upvalues: v44 (copy)
        return v44:getFirstInstance();
    end) then
        return v44:getFirstInstance();
    else
        return nil;
    end;
end;
local function _(v45, v46) --[[ Line: 173 ]] --[[ Name: getProperty ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 174 ]]
        -- upvalues: v45 (copy), v46 (copy)
        return v45[v46];
    end);
    return l_status_0 == true and l_result_0 or nil;
end;
v9.waitForPropertyEqualTo = function(v50, v51, v52) --[[ Line: 180 ]] --[[ Name: waitForPropertyEqualTo ]]
    -- upvalues: v42 (copy)
    return (v42(function() --[[ Line: 181 ]]
        -- upvalues: v50 (copy), v51 (copy), v52 (copy)
        local l_v50_0 = v50;
        local l_v51_0 = v51;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 174 ]]
            -- upvalues: l_v50_0 (copy), l_v51_0 (copy)
            return l_v50_0[l_v51_0];
        end);
        return (l_status_1 == true and l_result_1 or nil) == v52;
    end));
end;
v9.waitForChildrenCountEqualTo = function(v57, v58) --[[ Line: 186 ]] --[[ Name: waitForChildrenCountEqualTo ]]
    -- upvalues: v42 (copy)
    return (v42(function() --[[ Line: 187 ]]
        -- upvalues: v57 (copy), v58 (copy)
        return #v57:GetChildren() == v58;
    end));
end;
v9.getScreenFlow = function(v59) --[[ Line: 192 ]] --[[ Name: getScreenFlow ]]
    -- upvalues: l_XPath_0 (copy)
    if v59 then
        return l_XPath_0.new("game.CoreGui.PluginMockGui.ScreenFlow.Screen.MainFrame.Scroller");
    else
        return l_XPath_0.new("game.CoreGui.PluginMockGui.ScreenFlow");
    end;
end;
v9.getEditScreenContainer = function() --[[ Line: 200 ]] --[[ Name: getEditScreenContainer ]]
    -- upvalues: l_XPath_0 (copy)
    return l_XPath_0.new("game.CoreGui.PluginMockGui.Container.MainFrame");
end;
v9.cleanTempInstances = function() --[[ Line: 204 ]] --[[ Name: cleanTempInstances ]]
    -- upvalues: v9 (copy)
    local v60 = v9.getTempInstancesFolder();
    if v60 then
        v60:Destroy();
    end;
    local v61 = v9.getTempScreenGui();
    if v61 then
        v61:Destroy();
    end;
end;
v9.getTempInstancesFolder = function() --[[ Line: 216 ]] --[[ Name: getTempInstancesFolder ]]
    local l_TempInstancesFolder_0 = workspace:FindFirstChild("TempInstancesFolder");
    if l_TempInstancesFolder_0 then
        return l_TempInstancesFolder_0;
    else
        l_TempInstancesFolder_0 = Instance.new("Folder");
        l_TempInstancesFolder_0.Name = "TempInstancesFolder";
        l_TempInstancesFolder_0.Parent = workspace;
        return l_TempInstancesFolder_0;
    end;
end;
v9.getTempScreenGui = function() --[[ Line: 228 ]] --[[ Name: getTempScreenGui ]]
    local l_TempScreenGui_0 = game.CoreGui:FindFirstChild("TempScreenGui");
    if l_TempScreenGui_0 then
        return l_TempScreenGui_0;
    else
        l_TempScreenGui_0 = Instance.new("ScreenGui", game.CoreGui);
        l_TempScreenGui_0.Name = "TempScreenGui";
        l_TempScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        return l_TempScreenGui_0;
    end;
end;
v9.createNonAvatar = function(v64) --[[ Line: 240 ]] --[[ Name: createNonAvatar ]]
    -- upvalues: v9 (copy)
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = v64 or v9.DefaultAvatarName;
    l_Model_0.Parent = v9.getTempInstancesFolder();
    return l_Model_0;
end;
v9.createClothesWithoutCage = function(v66) --[[ Line: 247 ]] --[[ Name: createClothesWithoutCage ]]
    -- upvalues: v9 (copy)
    local l_Model_1 = Instance.new("Model");
    local v68 = Instance.new("MeshPart", l_Model_1);
    v68.Name = v66 or v9.DefaultClothesName;
    l_Model_1.Parent = v9.getTempInstancesFolder();
    return v68;
end;
v9.createClothesWithFullCages = function(v69) --[[ Line: 255 ]] --[[ Name: createClothesWithFullCages ]]
    -- upvalues: v9 (copy)
    local l_Model_2 = Instance.new("Model");
    local v71 = Instance.new("MeshPart", l_Model_2);
    v71.Name = v69 or v9.DefaultClothesName;
    l_Model_2.Parent = v9.getTempInstancesFolder();
    Instance.new("MeshPart", v71).Name = v71.Name;
    local v72 = Instance.new("WrapLayer", v71);
    v72.CageMeshId = v9.DefaultMeshId;
    v72.ReferenceMeshId = v9.DefaultMeshId;
    return v71;
end;
v9.createClothesWithOuterCage = function(v73) --[[ Line: 268 ]] --[[ Name: createClothesWithOuterCage ]]
    -- upvalues: v9 (copy)
    local l_Model_3 = Instance.new("Model");
    local v75 = Instance.new("MeshPart", l_Model_3);
    v75.Name = v73 or v9.DefaultClothesName;
    l_Model_3.Parent = v9.getTempInstancesFolder();
    Instance.new("MeshPart", v75).Name = v75.Name;
    Instance.new("WrapTarget", v75).CageMeshId = v9.DefaultMeshId;
    return v75;
end;
local function v79(v76) --[[ Line: 280 ]] --[[ Name: createAvatar ]]
    -- upvalues: v9 (copy)
    local l_Model_4 = Instance.new("Model");
    l_Model_4.Parent = v9.getTempInstancesFolder();
    Instance.new("Humanoid").Parent = l_Model_4;
    Instance.new("Part", l_Model_4).Name = "HumanoidRootPart";
    local v78 = Instance.new("MeshPart", l_Model_4);
    v78.Name = "UpperTorso";
    Instance.new("MeshPart", l_Model_4).Name = "LowerTorso";
    Instance.new("MeshPart", l_Model_4).Name = "Head";
    Instance.new("MeshPart", l_Model_4).Name = "LeftFoot";
    Instance.new("MeshPart", l_Model_4).Name = "RightFoot";
    Instance.new("MeshPart", l_Model_4).Name = "LeftHand";
    Instance.new("MeshPart", l_Model_4).Name = "RightHand";
    Instance.new("MeshPart", l_Model_4).Name = "RightUpperArm";
    Instance.new("MeshPart", l_Model_4).Name = "RightLowerArm";
    Instance.new("MeshPart", l_Model_4).Name = "LeftUpperArm";
    Instance.new("MeshPart", l_Model_4).Name = "LeftLowerArm";
    Instance.new("MeshPart", l_Model_4).Name = "LeftUpperLeg";
    Instance.new("MeshPart", l_Model_4).Name = "LeftLowerLeg";
    Instance.new("MeshPart", l_Model_4).Name = "RightUpperLeg";
    Instance.new("MeshPart", l_Model_4).Name = "RightLowerLeg";
    l_Model_4.Name = v76 or v9.DefaultAvatarName;
    Instance.new("WrapTarget", v78);
    return l_Model_4;
end;
v9.createAvatarWithoutCages = function(v80) --[[ Line: 322 ]] --[[ Name: createAvatarWithoutCages ]]
    -- upvalues: v79 (copy)
    return (v79(v80));
end;
v9.createAvatarWithFullCages = function(v81) --[[ Line: 326 ]] --[[ Name: createAvatarWithFullCages ]]
    -- upvalues: v79 (copy), v9 (copy)
    local v82 = v79(v81);
    Instance.new("Humanoid").Parent = v82;
    local l_MeshPart_0 = Instance.new("MeshPart");
    l_MeshPart_0.Parent = v82;
    Instance.new("Attachment", l_MeshPart_0).Name = v9.DefaultAttachmentName;
    Instance.new("MeshPart", v82).Name = "Inner";
    Instance.new("MeshPart", v82).Name = "Outer";
    v82.PrimaryPart = l_MeshPart_0;
    return v82;
end;
local function _(v84) --[[ Line: 342 ]] --[[ Name: selectItem ]]
    game:GetService("Selection"):Set({
        v84
    });
    wait(0.1);
end;
local function _(v86, v87) --[[ Line: 348 ]] --[[ Name: addItemAndConfirm ]]
    -- upvalues: v9 (copy)
    if not v87 then
        return;
    else
        v9.clickXPath(v87);
        game:GetService("Selection"):Set({
            v86
        });
        wait(0.1);
        v9.confirmDialog();
        return;
    end;
end;
v9.addRegularPartFromExplorer = function() --[[ Line: 360 ]] --[[ Name: addRegularPartFromExplorer ]]
    -- upvalues: v9 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Parent = v9.getTempInstancesFolder();
    game:GetService("Selection"):Set({
        l_Part_0
    });
    wait(0.1);
    return l_Part_0;
end;
v9.addLCItemWithAttachmentFromExplorer = function() --[[ Line: 369 ]] --[[ Name: addLCItemWithAttachmentFromExplorer ]]
    -- upvalues: v9 (copy)
    local v90 = v9.createClothesWithoutCage();
    local v91 = Instance.new("Attachment", v90);
    v91.Name = v9.DefaultAttachmentName;
    v91.CFrame = v9.AttachmentCFrame;
    game:GetService("Selection"):Set({
        v90
    });
    wait(0.1);
    return v90;
end;
v9.addLCItemWithoutCageFromExplorer = function(v92) --[[ Line: 380 ]] --[[ Name: addLCItemWithoutCageFromExplorer ]]
    -- upvalues: v9 (copy), l_ItemCharacteristics_0 (copy)
    local v93 = v92 or v9.createClothesWithoutCage();
    assert(not l_ItemCharacteristics_0.hasFullCages(v93));
    game:GetService("Selection"):Set({
        v93
    });
    wait(0.1);
    return v93;
end;
v9.addLCItemWithFullCageFromExplorer = function(v94) --[[ Line: 389 ]] --[[ Name: addLCItemWithFullCageFromExplorer ]]
    -- upvalues: v9 (copy), l_ItemCharacteristics_0 (copy)
    local v95 = v94 or v9.createClothesWithFullCages();
    assert(l_ItemCharacteristics_0.hasFullCages(v95));
    game:GetService("Selection"):Set({
        v95
    });
    wait(0.1);
    return v95;
end;
v9.addLCItemWithOuterCageFromExplorer = function(v96) --[[ Line: 398 ]] --[[ Name: addLCItemWithOuterCageFromExplorer ]]
    -- upvalues: v9 (copy), l_ItemCharacteristics_0 (copy)
    local v97 = v96 or v9.createClothesWithOuterCage();
    assert(l_ItemCharacteristics_0.hasOuterCage(v97));
    game:GetService("Selection"):Set({
        v97
    });
    wait(0.1);
    return v97;
end;
v9.addAvatarWithFullCagesFromExplorer = function() --[[ Line: 407 ]] --[[ Name: addAvatarWithFullCagesFromExplorer ]]
    -- upvalues: v9 (copy), l_ItemCharacteristics_0 (copy)
    local v98 = v9.createAvatarWithFullCages();
    assert(l_ItemCharacteristics_0.hasFullCages(v98));
    game:GetService("Selection"):Set({
        v98
    });
    wait(0.1);
    return v98;
end;
v9.addLCItemWithInvalidCageFromExplorer = function() --[[ Line: 416 ]] --[[ Name: addLCItemWithInvalidCageFromExplorer ]]
    -- upvalues: v9 (copy), l_ItemCharacteristics_0 (copy)
    local v99 = v9.createClothesWithFullCages();
    local l_WrapLayer_0 = v99:FindFirstChild("WrapLayer");
    l_WrapLayer_0.CageMeshId = "";
    l_WrapLayer_0.ReferenceMeshId = "";
    assert(l_ItemCharacteristics_0.hasInvalidCage(v99));
    game:GetService("Selection"):Set({
        v99
    });
    wait(0.1);
    return v99;
end;
local function v104(v101) --[[ Line: 428 ]] --[[ Name: addItemToGrid ]]
    -- upvalues: v9 (copy), l_XPath_0 (copy)
    local v102 = v9.getEditScreenContainer():cat(l_XPath_0.new("PreviewSwizzle.Content.PreviewFrame.Grid")):cat(l_XPath_0.new("ScrollingFrame.Scroller")):cat(l_XPath_0.new("AddNewTile"));
    v9.waitForXPathInstance(v102);
    local v103 = v102:cat(l_XPath_0.new("Contents.TextButton"));
    v9.waitForXPathInstance(v103);
    if not v103 then
        return;
    else
        v9.clickXPath(v103);
        game:GetService("Selection"):Set({
            v101
        });
        wait(0.1);
        v9.confirmDialog();
        return;
    end;
end;
v9.addAvatarToGrid = function() --[[ Line: 441 ]] --[[ Name: addAvatarToGrid ]]
    -- upvalues: v104 (copy), v9 (copy)
    v104(v9.createAvatarWithFullCages());
end;
v9.addClothesItemToGrid = function() --[[ Line: 446 ]] --[[ Name: addClothesItemToGrid ]]
    -- upvalues: v104 (copy), v9 (copy)
    v104(v9.createClothesWithFullCages());
end;
return v9;
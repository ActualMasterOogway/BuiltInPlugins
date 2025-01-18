local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.Rodux);
local v7 = require(l_Packages_0.ReactRoblox);
local l_ContextServices_0 = v4.ContextServices;
local l_MockPlugin_0 = v4.TestHelpers.Instances.MockPlugin;
local v10 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
local v11 = require(l_Parent_0.Core.Components.Asset.Asset);
local v12 = require(l_Parent_0.Core.Components.Asset.Preview.AssetPreviewWrapper);
local v13 = require(l_Parent_0.Core.Util.MockWrapper);
local v14 = require(l_Parent_0.TestUtils.MockItems);
local v15 = require(script.Parent.TabTestWrapper);
local v16 = require(script.Parent.ToolboxTestWrapper);
local l_Element_0 = require(l_Parent_0.Packages.Dev.Rhodium).Element;
local v18 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v50 = {
    getPathInTestToolbox = function(v20) --[[ Line: 36 ]] --[[ Name: getPathInTestToolbox ]]
        return string.format("game.CoreGui.ScreenGui.%s.%s", "ToolboxComponent", v20);
    end, 
    cleanupCategoryVerification = function() --[[ Line: 40 ]] --[[ Name: cleanupCategoryVerification ]]
        for _, v22 in ipairs(game.CoreGui:GetChildren()) do
            if v22.Name == "CategoryVerification" then
                v22:Destroy();
            end;
        end;
    end, 
    createTestAsset = function(v23, v24, v25, v26) --[[ Line: 48 ]] --[[ Name: createTestAsset ]]
        -- upvalues: v14 (copy), v3 (copy), v6 (copy), v10 (copy), v5 (copy), v13 (copy), v11 (copy)
        local v27 = v25 or v14.getSimpleAsset(12345);
        local l_Id_0 = v27.Asset.Id;
        local v29 = v26 or {};
        v26 = v3.Dictionary.join(v29, {
            store = v6.Store.new(v10, {
                assets = {
                    idToAssetMap = {
                        [l_Id_0] = v27
                    }
                }
            }, {
                v6.thunkMiddleware
            })
        });
        v29 = v5.createElement(v13, v26 or {}, {
            Asset = v5.createElement(v11, {
                assetId = l_Id_0, 
                assetData = v27, 
                LayoutOrder = 1, 
                Selected = false
            })
        });
        return v5.mount(v29, v23 or nil, v24 or "");
    end, 
    createTestTab = function(v30, v31, _, v33) --[[ Line: 73 ]] --[[ Name: createTestTab ]]
        -- upvalues: v5 (copy), v13 (copy), v15 (copy)
        local v34 = v5.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Root = v5.createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0), 
                Position = UDim2.new(0, 0, 0, 0)
            }, {
                Components = v5.createElement(v13, v33 or {}, {
                    Tab = v5.createElement(v15, {})
                })
            })
        });
        return v5.mount(v34, v30 or nil, v31 or "");
    end, 
    createTestToolbox = function(v35, _, _, v38) --[[ Line: 90 ]] --[[ Name: createTestToolbox ]]
        -- upvalues: v5 (copy), v13 (copy), v16 (copy)
        v35.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        local v39 = v5.createElement("Frame", {
            Size = UDim2.new(0.8, 0, 0.8, 0), 
            Position = UDim2.new(0, 0, 0, 0)
        }, {
            Components = v5.createElement(v13, v38 or {
                pluginGui = v35
            }, {
                Toolbox = v5.createElement(v16, {})
            })
        });
        return v5.mount(v39, v35 or nil, "ToolboxComponent");
    end, 
    cleanupTestToolbox = function() --[[ Line: 106 ]] --[[ Name: cleanupTestToolbox ]]
        for _, v41 in ipairs(game.CoreGui:GetChildren()) do
            for _, v43 in ipairs(v41:GetChildren()) do
                if v43.Name == "ToolboxComponent" then
                    v41:Destroy();
                    break;
                end;
            end;
        end;
    end, 
    createPreviewAsset = function(v44, v45, _, _) --[[ Line: 117 ]] --[[ Name: createPreviewAsset ]]
        -- upvalues: v5 (copy), v13 (copy), v12 (copy), v14 (copy)
        local v48 = v5.createElement(v13, {}, {
            AssetPreviewWrapper = v5.createElement(v12, {
                assetData = v14.getPreviewAsset(112312321312), 
                previewFuncs = {}
            })
        });
        return v5.mount(v48, v44 or nil, v45 or "");
    end, 
    getDescendants = function(v49) --[[ Line: 128 ]] --[[ Name: getDescendants ]]
        return v49:GetDescendants();
    end
};
v50.getDescendant = function(v51, v52) --[[ Line: 132 ]] --[[ Name: getDescendant ]]
    -- upvalues: v50 (copy)
    local v53 = v50.getDescendants(v51);
    local v54 = nil;
    for _, v56 in pairs(v53) do
        if v56 == v52 then
            v54 = v56;
        end;
    end;
    return v54;
end;
v50.delay = function(v57) --[[ Line: 143 ]] --[[ Name: delay ]]
    local v58 = v57 or 0.2;
    task.wait(v58);
end;
v50.clickInstanceWithXPath = function(v59) --[[ Line: 148 ]] --[[ Name: clickInstanceWithXPath ]]
    -- upvalues: l_Element_0 (copy), v7 (copy), v50 (copy)
    local v60 = l_Element_0.new(v59);
    v7.act(function() --[[ Line: 150 ]]
        -- upvalues: v60 (copy)
        v60:clickWithoutValidation();
    end);
    v50.delay();
    return v60;
end;
v50.typeInstanceWithXPath = function(v61, v62) --[[ Line: 158 ]] --[[ Name: typeInstanceWithXPath ]]
    -- upvalues: l_Element_0 (copy), v7 (copy), v50 (copy)
    local v63 = l_Element_0.new(v61);
    v7.act(function() --[[ Line: 160 ]]
        -- upvalues: v63 (copy), v62 (copy)
        v63:sendText(v62);
    end);
    v50.delay();
    return v63;
end;
v50.clickInstance = function(v64) --[[ Line: 168 ]] --[[ Name: clickInstance ]]
    -- upvalues: l_Element_0 (copy), v7 (copy), v50 (copy)
    local v65 = l_Element_0.new(v64);
    v7.act(function() --[[ Line: 170 ]]
        -- upvalues: v65 (copy)
        v65:clickWithoutValidation();
    end);
    v50.delay();
    return v65;
end;
v50.mockMouse = function(v66) --[[ Line: 178 ]] --[[ Name: mockMouse ]]
    -- upvalues: l_MockPlugin_0 (copy), l_ContextServices_0 (copy)
    if not v66 then
        v66 = l_MockPlugin_0.new();
    end;
    return l_ContextServices_0.Mouse.new(v66:GetMouse());
end;
if v18() then
    v50.getMockUGCBody = function() --[[ Line: 186 ]] --[[ Name: getMockUGCBody ]]
        -- upvalues: l_Workspace_0 (copy)
        return l_Workspace_0.UGCTestBody:Clone();
    end;
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v50.getMockBodyWithUnknown = function() --[[ Line: 193 ]] --[[ Name: getMockBodyWithUnknown ]]
        -- upvalues: l_Workspace_0 (copy)
        local v67 = l_Workspace_0.UGCTestBody:Clone();
        local l_MeshPart_0 = Instance.new("MeshPart");
        l_MeshPart_0.Name = "unknownPart";
        l_MeshPart_0.Parent = v67;
        return v67;
    end;
end;
return v50;
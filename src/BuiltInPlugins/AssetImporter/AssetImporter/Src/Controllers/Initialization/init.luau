local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v5 = require(l_script_FirstAncestor_0.Packages.TestLoader);
local _ = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
local l_isFTF_0 = v5.isFTF;
local l_MockPlugin_0 = v1.TestHelpers.Instances.MockPlugin;
local v9 = require(l_script_FirstAncestor_0.Src.MainPlugin);
local v10 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v11 = require(script.ContextItemCache);
local v12 = require(script.TestElement);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportQueuedSessionRefactor);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixGroupFetch);
local v15 = {
    BlenderCubeDefault = "blender-cube-default.fbx", 
    CubeWithAllPbrs = "cube-with-all-pbrs.fbx", 
    CorruptedFile = "corrupted-file.fbx", 
    BlenderCubeRigged = "blender-cube-rigged.fbx", 
    RootTwoGroupFiveCube = "root-two-group-five-cube.fbx"
};
local v16 = {};
v16.__index = v16;
v16.Resources = v15;
v16.getResourcePathForTesting = function(v17) --[[ Line: 92 ]]
    -- upvalues: l_isFTF_0 (copy), v15 (copy)
    if not l_isFTF_0() then
        error("This function can only be called in a FTF test runner");
    end;
    if not v17 then
        v17 = v15.BlenderCubeDefault;
    end;
    return (("%*/%*/%*"):format(script:FindFirstAncestorWhichIsA("Plugin"):GetPluginComponent("FTFUtil"):ClientFolderPathAsync(), "AssetImport/AssetImportTest.Lib/resources", v17));
end;
v16.new = function(v18, v19) --[[ Line: 106 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_isFTF_0 (copy), l_MockPlugin_0 (copy), v9 (copy), v4 (copy), v10 (copy), v11 (copy), v14 (copy), v16 (copy), v2 (copy)
    local v20 = not v5.isCli() and "Production" or l_isFTF_0() and "FeatureTest" or "RobloxCli";
    local v21 = {
        environment = v20, 
        plugin = if v20 == "Production" then v18 else l_MockPlugin_0.new("AssetImporter"), 
        loader = v19, 
        story = v9, 
        storyProps = {}, 
        store = v4.Store.new(v10, nil, {
            v4.thunkMiddleware
        })
    };
    v21.contextItems = v11.new(v21);
    if v14() then
        v16.loadData(v21);
    end;
    v21.handle = if v21.environment == "Production" then v2.mount(v2.createElement(v9, v21.contextItems)) else nil;
    return (setmetatable(v21, v16));
end;
v16.loadData = function(v22) --[[ Line: 140 ]] --[[ Name: loadData ]]
    local l_Networking_0 = v22.contextItems.Networking;
    if l_Networking_0 then
        l_Networking_0:loadManagedGroups();
    end;
end;
v16.destroy = function(v24) --[[ Line: 149 ]] --[[ Name: destroy ]]
    -- upvalues: v13 (copy), v2 (copy)
    if v24.contextItems then
        v24.contextItems:destroy();
    end;
    if v24.store then
        local function _(v25) --[[ Line: 155 ]] --[[ Name: cancelSession ]]
            if v25 and typeof(v25.Cancel) == "function" then
                v25:Cancel();
            end;
        end;
        if v13() then
            for _, v28 in v24.store:getState().Sessions.sessionQueue do
                local l_session_0 = v28.session;
                if l_session_0 and typeof(l_session_0.Cancel) == "function" then
                    l_session_0:Cancel();
                end;
            end;
        end;
        local l_activeQueueItem_0 = v24.store:getState().Preview.activeQueueItem;
        if l_activeQueueItem_0 then
            local l_session_1 = l_activeQueueItem_0.session;
            if l_session_1 and typeof(l_session_1.Cancel) == "function" then
                l_session_1:Cancel();
            end;
        end;
        local l_assetImportSession_0 = v24.store:getState().Preview.assetImportSession;
        if l_assetImportSession_0 and typeof(l_assetImportSession_0.Cancel) == "function" then
            l_assetImportSession_0:Cancel();
        end;
        v24.store:destruct();
        v24.store = nil;
    end;
    if v24.handle then
        v2.unmount(v24.handle);
        v24.handle = nil;
    end;
    if v24.root then
        v24.root:render(nil);
        v24.root = nil;
    end;
    if v24.environment ~= "Production" then
        for _, v34 in game:GetService("CoreGui"):GetChildren() do
            v34:Destroy();
            v34 = nil;
        end;
    end;
end;
v16._createTestElement = function(v35, v36) --[[ Line: 208 ]] --[[ Name: _createTestElement ]]
    -- upvalues: v2 (copy), v12 (copy), v3 (copy)
    local l_CoreGui_0 = game:GetService("CoreGui");
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Parent = l_CoreGui_0;
    local v39 = v2.createElement(v35.story, v35.storyProps);
    local v40 = v2.createElement(v12, {
        ContextItems = v35.contextItems:getItemsAsList(), 
        Payload = v39
    });
    v35.root = v3.createBlockingRoot(l_Folder_0);
    if v36 then
        v36(v40);
        return;
    else
        v3.act(function() --[[ Line: 225 ]]
            -- upvalues: v35 (copy), v40 (copy)
            v35.root:render(v40);
        end);
        return;
    end;
end;
v16._setStory = function(v41, v42) --[[ Line: 231 ]] --[[ Name: _setStory ]]
    v41.story = v42;
end;
v16._setStoryProps = function(v43, v44) --[[ Line: 235 ]] --[[ Name: _setStoryProps ]]
    v43.storyProps = v44;
end;
return v16;
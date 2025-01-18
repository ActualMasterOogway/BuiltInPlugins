local l_RunService_0 = game:GetService("RunService");
local l_StudioService_0 = game:GetService("StudioService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Src.Components.InExperiencePreviewer.InExperiencePreviewerClient);
local v5 = require(l_Parent_0.Src.Components.InExperiencePreviewer.InExperiencePreviewerServer);
local v6 = require(l_Parent_0.Packages.Roact);
local v7 = require(l_Parent_0.Src.Util.DebugFlags);
if not require(l_Parent_0.Src.Flags.GetAccessoryToolEngineFeature)() then
    return;
else
    local v8 = v7.RunTests() or v7.RunRhodiumTests();
    v6.setGlobalConfig({});
    if v8 then
        return;
    else
        local v9 = require(l_Parent_0.Src.Components.LayeredClothingEditorPlugin);
        local v10 = nil;
        local function _() --[[ Line: 38 ]] --[[ Name: cleanupPreviousPreviewSessionForUser ]]
            -- upvalues: l_ReplicatedStorage_0 (copy), l_StudioService_0 (copy)
            local l_LayeredClothingEditorPreview_0 = l_ReplicatedStorage_0:FindFirstChild("LayeredClothingEditorPreview");
            if not l_LayeredClothingEditorPreview_0 then
                return;
            else
                local l_l_LayeredClothingEditorPreview_0_FirstChild_0 = l_LayeredClothingEditorPreview_0:FindFirstChild((tostring(l_StudioService_0:GetUserId())));
                if l_l_LayeredClothingEditorPreview_0_FirstChild_0 then
                    l_l_LayeredClothingEditorPreview_0_FirstChild_0:Destroy();
                end;
                return;
            end;
        end;
        local function v17() --[[ Line: 50 ]] --[[ Name: init ]]
            -- upvalues: l_RunService_0 (copy), v4 (copy), v5 (copy), l_ReplicatedStorage_0 (copy), l_StudioService_0 (copy), v6 (copy), v9 (copy), v10 (ref)
            if l_RunService_0:IsRunning() then
                if l_RunService_0:IsClient() then
                    v4:init();
                    return;
                else
                    v5:init();
                    return;
                end;
            else
                if l_RunService_0:IsEdit() then
                    local l_LayeredClothingEditorPreview_1 = l_ReplicatedStorage_0:FindFirstChild("LayeredClothingEditorPreview");
                    if l_LayeredClothingEditorPreview_1 then
                        local l_l_LayeredClothingEditorPreview_1_FirstChild_0 = l_LayeredClothingEditorPreview_1:FindFirstChild((tostring(l_StudioService_0:GetUserId())));
                        if l_l_LayeredClothingEditorPreview_1_FirstChild_0 then
                            l_l_LayeredClothingEditorPreview_1_FirstChild_0:Destroy();
                        end;
                    end;
                end;
                local v16 = v6.createElement(v9, {
                    plugin = plugin
                });
                v10 = v6.mount(v16);
                return;
            end;
        end;
        plugin.Unloading:Connect(function() --[[ Line: 69 ]]
            -- upvalues: l_RunService_0 (copy), v4 (copy), v5 (copy), v10 (ref), v6 (copy)
            if l_RunService_0:IsRunning() then
                if l_RunService_0:IsClient() then
                    v4:shutdown();
                    return;
                else
                    v5:shutdown();
                    return;
                end;
            else
                if v10 then
                    v6.unmount(v10);
                end;
                return;
            end;
        end);
        v17();
        return;
    end;
end;
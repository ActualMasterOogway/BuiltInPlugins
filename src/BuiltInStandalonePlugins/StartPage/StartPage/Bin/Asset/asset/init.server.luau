local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
require(l_script_FirstAncestor_0.Packages.TestLoader).launch("StartPage", l_script_FirstAncestor_0.Src);
local function v10() --[[ Line: 7 ]] --[[ Name: init ]]
    -- upvalues: l_script_FirstAncestor_0 (copy)
    local v1 = require(l_script_FirstAncestor_0.Packages.React);
    local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
    local v3 = require(l_script_FirstAncestor_0.Src.MainPlugin);
    local l_FocusedDataModelSession_0 = plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
    local v5 = nil;
    local function v8() --[[ Line: 16 ]] --[[ Name: load ]]
        -- upvalues: v1 (copy), v3 (copy), v5 (ref), v2 (copy)
        if not plugin.HostDataModelTypeIsCurrent then
            return;
        else
            local v6 = v1.createElement(v3, {
                Plugin = plugin
            });
            local l_Frame_0 = Instance.new("Frame");
            v5 = v2.createRoot(l_Frame_0);
            assert(v5, "Force Luau to know root is non-nil");
            v5:render(v6);
            return;
        end;
    end;
    local function v9() --[[ Line: 30 ]] --[[ Name: unload ]]
        -- upvalues: v5 (ref)
        if v5 then
            v5:unmount();
            v5 = nil;
        end;
    end;
    l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(v9);
    l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(v8);
    v8();
end;
if game:DefineFastFlag("DebugTestStartPageInAssetDM", false) then
    v10();
end;
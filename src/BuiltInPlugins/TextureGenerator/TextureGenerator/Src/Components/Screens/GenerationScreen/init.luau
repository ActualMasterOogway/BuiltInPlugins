local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_useEventConnection_0 = v3.useEventConnection;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v7 = require(l_Components_0.EntryArea);
local v8 = require(l_Components_0.Generations);
local l_ContextServices_0 = v4.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v13 = require(l_Hooks_0.useSelectedMeshParts);
local l_UI_0 = v4.UI;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Pane_0 = l_UI_0.Pane;
local v17 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v18 = require(l_script_FirstAncestor_0.Src.Util.GenerationsContext);
local v19 = require(l_script_FirstAncestor_0.Src.Util.PreviewsContext);
local v20 = require(l_script_FirstAncestor_0.Src.Util.OptionsContext);
local v21 = require(l_script_FirstAncestor_0.Src.Util.createHashFromMeshParts);
local v22 = require(l_script_FirstAncestor_0.Src.Util.fetchAndSetQuotas);
local v23 = require(l_script_FirstAncestor_0.Src.Util.setTexture);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v27 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
return function() --[[ Line: 51 ]] --[[ Name: GenerationScreen ]]
    -- upvalues: l_Analytics_0 (copy), l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), v13 (copy), v2 (copy), v18 (copy), v20 (copy), v19 (copy), v22 (copy), l_useEventConnection_0 (copy), l_TextureGenerationService_0 (copy), v25 (copy), v17 (copy), v26 (copy), v27 (copy), v21 (copy), v23 (copy), l_ScrollingFrame_0 (copy), l_Pane_0 (copy), v7 (copy), v8 (copy)
    local v28 = l_Analytics_0:use();
    local v29 = l_LayoutOrderIterator_0.new();
    local v30 = l_Localization_0:use();
    local v31 = v13();
    local v32 = v2.useContext(v18);
    local v33 = v2.useContext(v20);
    local v34 = v2.useContext(v19);
    v2.useEffect(function() --[[ Line: 60 ]]
        -- upvalues: v22 (ref), v32 (copy), v34 (copy)
        v22(v32, v34);
    end, {});
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v31 (copy), v32 (copy)
        local v35 = nil;
        for _, v37 in v31 do
            local l_SurfaceAppearance_0 = v37:FindFirstChildOfClass("SurfaceAppearance");
            if l_SurfaceAppearance_0 then
                v35 = l_SurfaceAppearance_0.ColorMap;
            end;
        end;
        local v39 = nil;
        if v35 then
            for v40, v41 in v32.generations do
                if v41.textureIds == v35 then
                    v39 = v40;
                    break;
                end;
            end;
        end;
        v32.setSelected(v39);
    end, {
        v31, 
        v32.setSelected
    });
    l_useEventConnection_0(l_TextureGenerationService_0.GenerationNotificationSignal, function(v42) --[[ Line: 88 ]]
        -- upvalues: v25 (ref), v32 (copy), v30 (copy), v33 (copy), v17 (ref), v26 (ref), v27 (ref), v28 (copy), v21 (ref), v23 (ref), v22 (ref), v34 (copy)
        if v25() then
            print("generation notification table", v42);
        end;
        local v43 = v32.generations[v42.uuid];
        if not v43 then
            warn(v30:getText("Generation", "Warning"));
            return;
        else
            if v42.seed then
                v33.setSeed(v42.seed);
            end;
            if v42.status == v17.STATUS.COMPLETED then
                v42.layoutOrder = v32.quota + v17.COMPLETED_GENERATIONS_INDEX;
                v32.setSelected(v42.uuid);
                if v26() then
                    local v44 = nil;
                    if v27() then
                        v44 = v43.uuid;
                    end;
                    v28:report("ReceivedTexture", v43.serverId, v43.meshParts, v43.prompt, v43.seed, v43.rotation, v43.smartUVUnwrap, v43.promptMasking, v42.textureIds, v44);
                end;
            end;
            v32.updateGeneration({
                action = v17.GENERATION_ACTIONS.UPDATE, 
                uuid = v42.uuid, 
                data = v42
            });
            if v42.status ~= v17.STATUS.COMPLETED then
                return;
            else
                if v42.unwrappingRequest then
                    local v45 = v21(v43.meshParts);
                    v42.unwrappingRequest:ApplyToDataModel(v43.partGroup);
                    v32.updateModelToGenerations({
                        action = v17.GENERATION_ACTIONS.REMOVE, 
                        hash = v45, 
                        uuid = v42.uuid
                    });
                    v32.updateModelToGenerations({
                        action = v17.GENERATION_ACTIONS.ADD, 
                        hash = v21(v43.meshParts), 
                        uuid = v42.uuid
                    });
                end;
                assert(v42.textureIds, "Notification should have saved TextureIDs");
                for _, v47 in v43.meshParts do
                    v23(v47, v42.textureIds);
                end;
                v22(v32, v34);
                return;
            end;
        end;
    end, {
        v32.generations, 
        v32.updateGeneration, 
        v32.updateModelToGenerations, 
        v32.setSelected, 
        v33.setSeed, 
        v31
    });
    l_useEventConnection_0(l_TextureGenerationService_0.PreviewNotificationSignal, function(v48) --[[ Line: 172 ]]
        -- upvalues: v25 (ref), v33 (copy), v34 (copy), v26 (ref), v17 (ref), v27 (ref), v28 (copy), v21 (ref), v30 (copy), v22 (ref), v32 (copy)
        if v25() then
            print("preview notification table", v48);
        end;
        if v48.seed then
            v33.setSeed(v48.seed);
        end;
        local v49 = v34.previews[v48.uuid];
        if v49 and not v49.imageFailed then
            v48.imageFailed = 0;
        elseif v48.previewUrlFailed and v49.imageFailed then
            v48.imageFailed = v49.imageFailed + 1;
        end;
        if v26() and v48.status == v17.STATUS.COMPLETED then
            local v50 = nil;
            if v27() then
                v50 = v48.uuid;
            end;
            v28:report("ReceivedPreview", v49.serverId, v49.meshParts, v49.prompt, v49.seed, v49.rotation, v49.smartUVUnwrap, v49.promptMasking, v50);
        end;
        if v48.status == v17.STATUS.FAILED then
            local l_message_0 = v48.message;
            v34.addError(v21(v49.meshParts), l_message_0, v30:getText("EntryArea", "ErrorAlertTitle"), v48.message, "error");
            v34.removePreview(v48.uuid);
        else
            v34.updatePreview(v48);
        end;
        v22(v32, v34);
    end, {
        v32, 
        v33.setSeed, 
        v34, 
        v31
    });
    return v2.createElement(l_ScrollingFrame_0, {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 1)
    }, {
        Main = v2.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            EntryArea = v2.createElement(v7, {
                LayoutOrder = v29:getNextOrder()
            }), 
            Generations = v2.createElement(v8, {
                LayoutOrder = v29:getNextOrder(), 
                MeshParts = v31
            })
        })
    });
end;
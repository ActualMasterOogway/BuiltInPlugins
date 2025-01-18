local v0 = require(script.Parent.PreviewConstants);
return {
    getPreviewingAnimationId = function(v1) --[[ Line: 6 ]] --[[ Name: getPreviewingAnimationId ]]
        -- upvalues: v0 (copy)
        local l_selectedAssets_0 = v1.previewStatus.selectedAssets;
        if not l_selectedAssets_0 or not l_selectedAssets_0[v0.TABS_KEYS.Animations] then
            return;
        else
            local _, v4 = next(l_selectedAssets_0[v0.TABS_KEYS.Animations]);
            if v4 then
                if v0.AnimationIdToSequenceId[v4] then
                    return v0.AnimationIdToSequenceId[v4];
                else
                    warn("Animation id " .. tostring(v4) .. " does not have sequence id defined");
                end;
            end;
            return nil;
        end;
    end
};
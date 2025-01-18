local v0 = require(script.Parent.Logging);
return function(v1) --[[ Line: 23 ]] --[[ Name: createReconcilerCompat ]]
    -- upvalues: v0 (copy)
    return {
        reify = function(...) --[[ Line: 26 ]] --[[ Name: reify ]]
            -- upvalues: v0 (ref), v1 (copy)
            v0.warnOnce("Roact.reify has been renamed to Roact.mount and will be removed in a future release.\nCheck the call to Roact.reify at:\n");
            return v1.mountVirtualTree(...);
        end, 
        teardown = function(...) --[[ Line: 32 ]] --[[ Name: teardown ]]
            -- upvalues: v0 (ref), v1 (copy)
            v0.warnOnce("Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.\nCheck the call to Roact.teardown at:\n");
            return v1.unmountVirtualTree(...);
        end, 
        reconcile = function(...) --[[ Line: 38 ]] --[[ Name: reconcile ]]
            -- upvalues: v0 (ref), v1 (copy)
            v0.warnOnce("Roact.reconcile has been renamed to Roact.update and will be removed in a future release.\nCheck the call to Roact.reconcile at:\n");
            return v1.updateVirtualTree(...);
        end
    };
end;
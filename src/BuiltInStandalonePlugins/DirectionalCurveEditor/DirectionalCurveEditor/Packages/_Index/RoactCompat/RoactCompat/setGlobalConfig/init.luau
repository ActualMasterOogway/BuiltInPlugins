local v0 = require(script.Parent.warnOnce);
return function(_) --[[ Line: 19 ]]
    -- upvalues: v0 (copy)
    if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
        v0("setGlobalConfig", "Roact 17 uses a `_G.__DEV__` flag to enable development behavior. " .. "If you're seeing this warning, you already have it enabled. " .. "Please remove any redundant uses of `setGlobalConfig`.");
    end;
end;
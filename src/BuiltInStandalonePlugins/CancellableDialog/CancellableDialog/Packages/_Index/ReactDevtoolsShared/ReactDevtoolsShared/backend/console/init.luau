local _ = require(script.Parent.types);
return {
    patch = function(_) --[[ Line: 17 ]] --[[ Name: patch ]]

    end, 
    unpatch = function() --[[ Line: 22 ]] --[[ Name: unpatch ]]

    end, 
    error = function(...) --[[ Line: 24 ]] --[[ Name: error ]]
        error(...);
    end, 
    warn = function(...) --[[ Line: 28 ]] --[[ Name: warn ]]
        warn(...);
    end, 
    log = function(...) --[[ Line: 32 ]] --[[ Name: log ]]
        print(...);
    end, 
    registerRenderer = function(_) --[[ Line: 36 ]] --[[ Name: registerRenderer ]]

    end
};
return function(v0) --[[ Line: 2 ]]
    return (string.gsub(v0, "[\027\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", ""));
end;
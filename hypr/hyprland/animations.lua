

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("smooth",         { type = "bezier", points = { {0.30, 1.00}, {0.90, 1.10} } })
hl.curve("easeOutBack",    { type = "bezier", points = { {0.34, 1.56}, {0.64, 1}    } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- My Animations
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })

hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "borderangle",   enabled = true,  speed = 20, bezier = "almostLinear",   style = "loop"})

hl.animation({ leaf = "windows",       enabled = true,  speed = 5,    spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 5,    spring = "easy",         style = "slide" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 5,    spring = "easy",       style = "slide" })
hl.animation({ leaf = "windowsMove",   enabled = true,  speed = 5,    bezier = "easeOutQuint"})

hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fadeSwitch",    enabled = true,  speed = 7,    bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 5,    bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 5,    bezier = "easeOutQuint" })

hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "slidefade 90%" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "slidefade 90%" })

hl.animation({ leaf = "workspaces",    enabled = true,  speed = 3.5,  bezier = "easeOutBack"  })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 3.5,  bezier = "easeOutBack"  })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 3.5,  bezier = "easeOutBack"  })
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true,  speed = 5,  bezier = "easeOutQuint"  })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true,  speed = 5,  bezier = "easeOutQuint"  })

hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

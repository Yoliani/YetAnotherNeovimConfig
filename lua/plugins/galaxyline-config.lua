local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = {"LuaTree", "vista", "dbui"}
local i = require("gutil.icons")
local c = require("gutil.colors")
local u = require("gutil.utils")
local diagnostic = require("gutil.providers.diagnostic")
local vcs = require("gutil.providers.vcs")
local fileinfo = require("gutil.providers.fileinfo")
local extension = require("gutil.providers.extension")
local buffer = require("gutil.providers.buffer")
local vimode = require("gutil.providers.vimode")

local bufferIcon = buffer.get_buffer_type_icon
local bufferNumber = buffer.get_buffer_number
local diagnosticError = diagnostic.get_diagnostic_error
local diagnosticWarn = diagnostic.get_diagnostic_warn
local diagnosticInfo = diagnostic.get_diagnostic_info
local diagnosticEndSpace = diagnostic.end_space
local diagnosticSeperator = diagnostic.seperator
local diffAdd = vcs.diff_add
local diffModified = vcs.diff_modified
local diffRemove = vcs.diff_remove
local fileFormat = fileinfo.get_file_format
local fileEncode = fileinfo.get_file_encode
local fileSize = fileinfo.get_file_size
local fileIcon = fileinfo.get_file_icon
local fileName = fileinfo.get_current_file_name
local fileType = fileinfo.get_file_type
local fileTypeName = buffer.get_buffer_filetype
local filetTypeSeperator = fileinfo.filetype_seperator
local gitBranch = vcs.get_git_branch_formatted
local gitSeperator = vcs.seperator
local lineColumn = fileinfo.line_column
local linePercent = fileinfo.current_line_percent
local scrollBar = extension.scrollbar_instance
local space = u.space
local viMode = vimode.get_mode
local viModeSeperator = vimode.seperator

gls.left[1] = {
  ViMode = {
    provider = viMode,
    highlight = {c.Color("act1"), c.Color("DarkGoldenrod2")}
  }
}

gls.left[2] = {
  ViModeSeperator = {
    provider = viModeSeperator,
    highlight = {c.Color("act1"), c.Color("DarkGoldenrod2")}
  }
}

gls.left[3] = {
  FileSize = {
    provider = fileSize,
    condition = u.buffer_not_empty,
    highlight = {c.Color("base"), c.Color("act1")}
  }
}

gls.left[4] = {
  FileName = {
    provider = fileName,
    condition = u.buffer_not_empty,
    separator = i.slant.Left,
    separator_highlight = {c.Color("purple"), c.Color("act1")},
    highlight = {c.Color("func"), c.Color("act1"), "bold"}
  }
}

gls.left[5] = {
  FileType = {
    provider = fileType,
    condition = u.buffer_not_empty,
    highlight = {c.Color("base"), c.Color("purple")}
  }
}

gls.left[6] = {
  FiletTypeSeperator = {
    provider = filetTypeSeperator
  }
}

gls.left[7] = {
  DiagnosticError = {
    provider = diagnosticError,
    icon = " " .. i.bullet,
    highlight = {c.Color("error"), c.Color("act1")}
  }
}

gls.left[8] = {
  DiagnosticWarn = {
    provider = diagnosticWarn,
    icon = " " .. i.bullet,
    highlight = {c.Color("warning"), c.Color("act1")}
  }
}

gls.left[9] = {
  DiagnosticInfo = {
    provider = diagnosticInfo,
    icon = " " .. i.bullet,
    highlight = {c.Color("info"), c.Color("act1")}
  }
}

gls.left[10] = {
  DiagnosticEndSpace = {
    provider = diagnosticEndSpace,
    highlight = {c.Color("act1"), c.Color("act1")}
  }
}

gls.left[11] = {
  DiagnosticSeperator = {
    provider = diagnosticSeperator,
    highlight = {c.Color("purple"), c.Color("act1")}
  }
}

gls.left[12] = {
  GitBranch = {
    provider = gitBranch,
    icon = "Git-", --" " .. i.git .. " ",
    condition = u.buffer_not_empty
  }
}
--[[
gls.left[13] = {
    DiffAdd = {
        provider = diffAdd,
        condition = u.checkwidth,
        icon = i.diff.Add,
        highlight = {c.Color('green'), c.Color('purple')}
    }
}
gls.left[14] = {
    DiffModified = {
        provider = diffModified,
        condition = u.checkwidth,
        icon = i.diff.Modified,
        highlight = {c.Color('orange'), c.Color('purple')}
    }
}
gls.left[15] = {
    DiffRemove = {
        provider = diffRemove,
        condition = u.checkwidth,
        icon = i.diff.Remove,
        highlight = {c.Color('red'), c.Color('purple')}
    }
}
--]]
gls.left[13] = {
  GitSeperator = {
    provider = gitSeperator,
    condition = u.buffer_not_empty
  }
}

gls.left[14] = {
  Space = {
    provider = space,
    highlight = {c.Color("blue"), c.Color("purple")}
  }
}

gls.right[1] = {
  FileFormat = {
    provider = fileFormat,
    highlight = {c.Color("base"), c.Color("purple")}
  }
}
gls.right[2] = {
  LineInfo = {
    provider = lineColumn,
    separator = " | ",
    separator_highlight = {c.Color("base"), c.Color("purple")},
    highlight = {c.Color("base"), c.Color("purple")}
  }
}
gls.right[3] = {
  PerCent = {
    provider = linePercent,
    separator = i.slant.Left,
    separator_highlight = {c.Color("act1"), c.Color("purple")},
    highlight = {c.Color("base"), c.Color("act1")}
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = scrollBar,
    highlight = {c.Color("yellow"), c.Color("purple")}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = fileTypeName,
    separator = i.slant.Right,
    separator_highlight = {c.Color("purple"), c.Color("bg")},
    highlight = {c.Color("base"), c.Color("purple")}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = bufferIcon,
    separator = i.slant.Left,
    separator_highlight = {c.Color("purple"), c.Color("bg")},
    highlight = {c.Color("base"), c.Color("purple")}
  }
}

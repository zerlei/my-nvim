local api = vim.api

local Log = {
  log = function(msg)
    local file, err = io.open("./nvim_log.log", "a")
    if not file then
      print(err)
      return
    end
    file:write(msg .. "\n")
    file:close()
  end,
}

local Utils = {

  move_currentbuf_to_left_window = function()
    local current_win = api.nvim_get_current_win() -- 获取当前窗口 ID
    local current_pos = api.nvim_win_get_position(current_win) -- 获取当前窗口的位置
    local current_col = current_pos[2] -- 当前窗口的列位置
    local left_win = nil
    local left_sub = -100000
    local wins = api.nvim_list_wins()

    for _, win in ipairs(wins) do
      local pos = api.nvim_win_get_position(win)
      local col = pos[2] -- 获取窗口的列位置
      -- 判断该窗口是否在相邻左边，即列位置差等于当前窗口的宽度
      if col == 0 then
        goto continue
      end
      if col < current_col then -- 窗口在左边
        if (col - current_col) > left_sub then
          left_win = win
        end
      end
      ::continue::
    end
    if left_win then
      local current_buf = api.nvim_get_current_buf()
      api.nvim_win_set_buf(left_win, current_buf)
      api.nvim_command "b#"
    end
  end,
  move_currentbuf_to_right_window = function()
    local current_win = api.nvim_get_current_win() -- 获取当前窗口 ID
    local current_pos = api.nvim_win_get_position(current_win) -- 获取当前窗口的位置
    local current_col = current_pos[2] -- 当前窗口的列位置
    local right_win = nil
    local right_sub = 100000
    local wins = api.nvim_list_wins()

    for _, win in ipairs(wins) do
      local pos = api.nvim_win_get_position(win)
      local col = pos[2] -- 获取窗口的列位置
      if col > current_col then -- 窗口在左边
        if (col - current_col) < right_sub then
          right_win = win
        end
      end
    end
    if right_win then
      local current_buf = api.nvim_get_current_buf()
      api.nvim_win_set_buf(right_win, current_buf)
      api.nvim_command "b#"
    end
  end,
}

return Utils

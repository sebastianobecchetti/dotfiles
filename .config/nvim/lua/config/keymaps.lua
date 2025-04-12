vim.keymap.set("n", "<F9>", function()
  -- Salva il file corrente
  vim.cmd("write")

  -- Ottieni info sul file corrente
  local file = vim.fn.expand("%:p")
  local filetype = vim.bo.filetype

  -- Crea uno split orizzontale in tmux
  os.execute("tmux split-window -v")

  -- Costruisci il comando da eseguire
  local cmd = ""

  if filetype == "python" then
    cmd = 'python3 "' .. file .. '"'
  elseif filetype == "rust" then
    -- Naviga alla root del progetto (con Cargo.toml)
    local cargo_root = vim.fn.systemlist("cargo locate-project --message-format plain")[1]
    if cargo_root and cargo_root ~= "" then
      local dir = vim.fn.fnamemodify(cargo_root, ":h")
      cmd = 'cd "' .. dir .. '" && cargo run'
    else
      print("Cargo project non trovato.")
      return
    end
  else
    print("Filetype '" .. filetype .. "' non supportato.")
    return
  end

  -- Invia il comando al nuovo split tmux
  os.execute("tmux send-keys '" .. cmd .. "' C-m")
end, { desc = "Save and run current file in new tmux split (Python or Rust)" })

local M = {}
-- Function to get all files in a directory
M.getFilesInDirectory = function(directory)
  local files = {}
  local command

  -- WARNING: On Windows, this has to be run in Bash as pwsh and cmd doesn't have ls
  command = 'ls -1 "' .. directory .. '"'

  -- Execute the command and capture output
  local file_reader = io.popen(command)
  if not file_reader then
    return files
  end

  -- Read all filenames
  for file in file_reader:lines() do
    table.insert(files, file)
  end
  file_reader:close()

  return files
end

-- Function to get image based on current hour
M.getImageByHour = function(imageDirectory)
  -- Get all files in the directory
  local imageFiles = M.getFilesInDirectory(imageDirectory)

  -- Filter to keep only image files (you can adapt this to your needs)
  local images = {}
  for _, file in ipairs(imageFiles) do
    -- Check if file has an image extension
    if
      file:match("%.jpg$")
      or file:match("%.png$")
      or file:match("%.jpeg$")
      or file:match("%.webp$")
    then
      table.insert(images, file)
    end
  end

  -- If no images found, return nil
  if #images == 0 then
    return nil
  end

  -- Get current hour (0-23)
  local currentHour = os.date("*t").hour

  -- Use modulo to get an index based on the current hour
  local index = currentHour % #images + 1

  -- Return the full path to the image
  return imageDirectory .. images[index]
end

return M

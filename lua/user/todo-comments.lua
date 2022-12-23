local status_ok, todo_comments = pcall(require, 'todo_comments')
if not status_ok then
    return
end

todo_comments.setup{}

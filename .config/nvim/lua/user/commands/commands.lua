local command = vim.api.nvim_create_user_command
command('MakeTags', '!ctags -R .', {})
command('Spelling', ':set spell spelllang=en,it', {})
command('SpellingItalian', ':set spell spelllang=it', {})
command('SpellingEnglish', ':set spell spelllang=en', {})
command('NoSpelling', ':set nospell', {})
command('W', ':w', {})

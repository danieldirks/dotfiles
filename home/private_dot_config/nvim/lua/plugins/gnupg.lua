return {
    {
        -- en/decrypt gnupg files automatically
        -- https://github.com/jamessan/vim-gnupg
        "jamessan/vim-gnupg",
        lazy = false,
        init = function ()
            -- extend to support encryption of vimwiki pages that get .md appended implicitly
            vim.g.GPGFilePattern = "*.{gpg,gpg.md,asc,asc.md,pgp,pgp.md}"
        end
    },
}
